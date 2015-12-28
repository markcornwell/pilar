/* a simple driver for scheme_entry */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>

/* runtime.c */

#include <stdio.h>

/* define all scheme constants */
#define bool_f     0x002F
#define bool_t     0x006F
#define nil        0x003F

#define fx_mask    0x0003
#define fx_tag     0x0000
#define fx_shift    2

#define char_mask  0x00FF
#define char_tag   0x000F
#define char_shift  8


#define pair_mask  0x0007
#define pair_tag   0x0001

#define symbol_mask 0x0007
#define symbol_tag  0x0003

#define vect_mask  0x0007
#define vect_tag   0x0005

#define str_mask   0x0007
#define str_tag    0x0006

/* All scheme values are of type ptr */

typedef unsigned int ptr;                        // 4 bytes  ??? not right ???
typedef struct { ptr car; ptr cdr;   } *pair;    // 8-byte aligned
typedef struct { ptr len; ptr elt[]; } *vector;  // 8-byte aligned
typedef struct { ptr len; char ch[]; } *string;  // 4 byte aligned
typedef struct { ptr str; ptr val;   } *symbol;  // 8-byte-aligned

static void print_pairs (pair p);
static void print_vector (vector v);
static void print_string (string s);
static void print_symbol (symbol y);

static void print_ptr(ptr x) {
  
   fprintf(stderr,"print_ptr %x\n", x);  /* DEBUG */
   
   if ((x & fx_mask) == fx_tag) {
       printf("%d", ((int) x) >> fx_shift);

   } else if((x & symbol_mask) == symbol_tag) {
     print_symbol((symbol) (x - symbol_tag));
       
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

   } else if((x & str_mask) == str_tag) {
       printf("\"");
       print_string((string) (x - str_tag));
       printf("\"");

   } else if((x & vect_mask) == vect_tag) {
       printf("#(");
       print_vector((vector) (x - vect_tag)); // zero out vect_tag  -8 = 1111...1000
       printf(")");
       
   } else if((x & pair_mask) == pair_tag) {
     printf("(");
     print_pairs((pair) (x - 1));
     printf(")");
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

static void print_string (string s) {
  fprintf(stderr,"print_string %p", s);
  if (((int) s & -4) != (int) s)  {
    printf("error: print_string: s=%x must be 8-byte aligned\n", (unsigned int) s);
    exit(-1);
  }
  unsigned int len = s->len/4;
  for (int i=0; i<len; i++) {
    if (s->ch[i]=='\\' || s->ch[i]=='\"') {
      printf("\\");
    }
    printf("%c",s->ch[i]);      // need to handle escapes
  }
}

static void print_symbol (symbol y) {
  string s = (string) ((int) (y->str) - str_tag);
  print_string(s);
}

static void print_pairs (pair p) {
  fprintf(stderr,"print_pairs %p (car=%x  cdr=%x)\n", p ,p->car, p->cdr);
  if (((int) p & -8) != (int) p)  {
    printf("error: print_pairs p=%x must be 8-byte aligned\n", (unsigned int) p);
    exit(-1);
  }
  print_ptr(p->car);
  if ((p->cdr) == nil) {
    return;
  } else if (((p->cdr) & pair_mask) == pair_tag) {
    printf(" ");
    print_pairs((pair)((p->cdr) - pair_tag));  // zero out pair-tag
  } else {
    printf (" . ");
    print_ptr(p->cdr);
  }
}

static void print_vector(vector v) {
  unsigned int len = (v->len)/4;
  fprintf(stderr,"print_vector %p\n", v);
  for (int i=0; i< len ; i++) {
    //fprintf(stderr,"print_vector{len=%i,i=%i}\n",len,i);  /* DEBUG */
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
     fprintf(stderr,"@%8p  %02hhx %02hhx %02hhx %02hhx  %ld\n", heap, heap[3], heap[2], heap[1], heap[0], (long) *heap);
     words--;
     heap = heap + 4;
   }
}

int scheme_entry(context* ctxt, char* stack_base, char* heap_base);

int dump_enabled;

int main(int argc, char** argv){

  dump_enabled = 0; //default for heap dump flag

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

  // diagnostics
  if (dump_enabled) {
    fprintf(stderr,"heap       %p\n", heap);
    fprintf(stderr,"stack top  %p\n", stack_top);
    fprintf(stderr,"stack base %p\n", stack_base);
  }

  // save registers, call scheme, upon return print result
  context ctxt;
  ptr scheme_value = scheme_entry(&ctxt, stack_base, heap);
  print_ptr(scheme_value);
  printf("\n");

  // dump heap diagnostics if enabled
  if (dump_enabled) {
    dump(heap,10);
    fprintf(stderr,"value = %x\n", scheme_value);
    fprintf(stderr,"int    %ld\n", sizeof(int));
    fprintf(stderr,"long   %ld\n", sizeof(long));
    fprintf(stderr,"ptr    %ld\n", sizeof(ptr));
    fprintf(stderr,"pair   %ld\n", sizeof(pair));
    fprintf(stderr,"pair*  %ld\n", sizeof(pair*));
  }
  
  // free heap & stack
  deallocate_protected_space(stack_top, stack_size);
  deallocate_protected_space(heap, heap_size);
  return 0;
}
