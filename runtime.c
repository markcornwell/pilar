/* a simple driver for scheme_entry */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>

/* runtime.c */

#include <stdio.h>

/* define all scheme constants */
#define bool_f     0x2F
#define bool_t     0x6F
#define fx_mask    0x03
#define fx_tag     0x00
#define fx_shift    2
#define char_mask  0x00FF
#define char_tag   0x0F
#define char_shift  8
#define nil        0x3F
#define pair_mask  0x03
#define pair_tag   0x01
#define vect_mask  0x07
#define vect_tag   0x05

/* All scheme values are of type ptrs */

typedef unsigned int ptr;                        // 4 bytes
typedef struct { ptr car; ptr cdr;   } *pair;    // 8-byte aligned
typedef struct { ptr len; ptr elt[]; } *vector;  // 8-byte aligned

static void print_car (pair p);
static void print_cdr (pair p);
static void print_vector (vector v);

static void print_ptr(ptr x) {
  //printf("print_ptr %i\n", x);  /* DEBUG */
   if ((x & fx_mask) == fx_tag) {
       printf("%d", ((int) x) >> fx_shift);
       
   } else if((x & char_mask) == char_tag) {
       if (((int) x >> char_shift) == '\t'){
            printf("#\\tab");
       } else if (((int) x >> char_shift) == '\n') {
            printf("#\\newline");
       } else if (((int) x >> char_shift) == '\r') {
	    printf("#\\return");
       } else if (((int) x >> char_shift) == ' ') {
	    printf("#\\space");
       } else {
            printf("#\\%c", ((int) x) >> char_shift);
       }
       
   } else if((x & vect_mask) == vect_tag) {
       printf("#(");
       print_vector((vector) (x & -8)); // zero out vect_tag  -8 = 1111...1000
       printf(")");
       
   } else if((x & pair_mask) == pair_tag) {
       print_car((pair) (x & -8));
       print_cdr((pair) (x & -8));   // zero out pair_tag      -8 = 1111...1000
       
   } else if(x == bool_f) {
       printf("#f");
   } else if(x == bool_t) {
       printf("#t");
   } else if(x == nil) {
       printf("()");
  } else {
       printf("#<unknown 0x%08x>", x);
  }
}

/*
static void print_pairs (pair p) {
  if ((int)p != ((int) p*8)/8)  {
    printf("error: print_pairs p=%x must be 8-byte aligned\n", (unsigned int) p);
    exit(-1);
  }
  print_ptr(p->car);
  if ((p->cdr) == nil) {
    return;
  } else if (((p->cdr) & pair_mask) == pair_tag) {
    printf(" ");
    print_pairs((pair)((p->cdr) & -4)); // zero out pair-tag
  } else {
    printf (" . ");
    print_ptr((p->cdr));
  }
}
*/

static void print_car (pair p) {
  if ((int) p & 7)  {
    printf("error: print_car p=%i must be 8-byte aligned\n", (unsigned int) p);
    exit(-1);
  }
  printf("(");
  print_ptr(p->car);
}

static void print_cdr (pair p) {
  if ((int) p & 7)  {
    printf("error: print_cdr p=%i must be 8-byte aligned\n", (unsigned int) p);
    exit(-1);
  }
  if ((p->cdr) == nil) {
    printf(")");
  } else if (((p->cdr) & pair_mask) == pair_tag) {
    printf(" ");
    print_cdr((pair)((p->cdr) & -8)); // zero out pair-tag
  } else {
    printf (" . ");
    print_ptr((p->cdr));
    printf (")");
  }
}

static void print_vector(vector v) {
  int len = (v->len)/4;
  for (int i=0; i< len ; i++) {
    //printf("{len=%i,i=%i}",len,i);  /* DEBUG */
    print_ptr(v->elt[i]);
    if (i+1 < len) printf(" ");
  }
}

static char* allocate_protected_space(int size) {
  int page = getpagesize();
  int status;
  int aligned_size = ((size + page - 1) / page) * page;
  char *p = mmap(0, aligned_size + 2 * page,
		 PROT_READ | PROT_WRITE,
		 MAP_ANON | MAP_PRIVATE,
		 0, 0);
  if (p == MAP_FAILED) { printf("MAP FAILED exiting\n"); exit(-1); }
  status = mprotect(p, page, PROT_NONE);
  if (status != 0) { printf("mprotect returned non-zero status; exiting\n"); exit(-2); }
  status = mprotect(p + page + aligned_size, page, PROT_NONE);
  if (status != 0) { printf("mprotect failed; exiting\n"); exit(-3); }
  return (p + page);
}

static void deallocate_protected_space(char *p, int size) {
  int page = getpagesize();
  int status;
  int aligned_size = ((size + page - 1) / page) * page;
  status = munmap(p - page, aligned_size + 2 * page);
  if (status != 0) { printf("munmap returned non-zero status\n"); }
}

typedef struct {
  void* eax;  /* 0    scratch  */
  void* ebx;  /* 4    preserve */
  void* ecx;  /* 8    scratch  */
  void* edx;  /* 12   scratch  */
  void* esi;  /* 16   preserve */
  void* edi;  /* 20   preserve */
  void* ebp;  /* 24   preserve */
  void* esp;  /* 28   preserve */
} context;

static void dump(char *heap, int words) {
   while(words > 0) {
     printf("@%p  %08x  %d\n", heap, *heap, (unsigned int) *heap);
     words--;
     heap = heap + 4;
   }
}

int scheme_entry(context* ctxt, char* stack_base, char* heap_base);

int main(int argc, char** argv){

  int dump_enabled = 0; //default for heap dump flag

  // process command line args
  for (int i=0; i<argc; i++) {
    if (strcmp(argv[i],"-d") == 0) {
	dump_enabled = 1;
    }
    /* other args later */
  }
  
  
  // create the stack
  int stack_size = (16 * 4096); /* holds 16K cells */ 
  char* stack_top = allocate_protected_space(stack_size);
  char* stack_base = stack_top + stack_size;
  
  // create the heap
  int heap_size =  (8 * 16 * 4096); /* holdes 16K pairs */
  char* heap = allocate_protected_space(heap_size);

  // save registers, call scheme, upon return print result
  context ctxt;
  print_ptr(scheme_entry(&ctxt, stack_base, heap));
  printf("\n");

  // dump heap diagnostics if enabled
  if (dump_enabled) {
    dump(heap,10);
  }
  
  // free heap & stack
  deallocate_protected_space(stack_top, stack_size);
  deallocate_protected_space(heap, heap_size);
  return 0;
}
