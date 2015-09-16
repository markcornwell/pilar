/* a simple driver for scheme_entry */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>

/* runtime.c */

#include <stdio.h>

/* define all scheme constants */
#define bool_f  0x2F
#define bool_t  0x6F
#define fx_mask 0x03
#define fx_tag 0x00
#define fx_shift 2
#define char_mask 0x00FF
#define char_tag 0x0F
#define char_shift 8
#define nil 0x3F
#define pair_mask 0x03
#define pair_tag  0x01

// Note: Pointer arithmetic already scales these by ptr size of 4 bytes
#define car_offset 0
#define cdr_offset 1

/* All scheme values are of type ptrs */

typedef unsigned int ptr;
typedef struct { ptr car; ptr cdr; } *pair;

ptr car(ptr x) {
  x = x - 1;
  return ((pair) x)->car;
}

ptr cdr(ptr x) {
  x = x - 1;
  return ((pair) x)->cdr;
}
  

/*
typedef union {
  unsigned int imm;
  struct {
    unsigned int car;
    unsigned int cdr;
  } *pair;
} ptr;
*/

static void print_pairs (pair p);

static void print_ptr(ptr x) {
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
   } else if((x & pair_mask) == pair_tag) {
       printf("(");
       print_pairs((pair)(x-1)); // zero out pair-tag
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
  printf("\n");
}

static void print_pairs (pair p) {
  print_ptr(p->car);
  if ((p->cdr) == nil) {
    printf("(");
  } else if (((p->cdr) & pair_mask) == pair_tag) {
    printf(" ");
    print_pairs((pair)((p->cdr)-1));
  } else {
    printf (" . ");
    print_ptr((p->cdr));
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

int scheme_entry(context* ctxt, char* stack_base, char* heap_base);

int main(int argc, char** argv){
  // stack
  int stack_size = (16 * 4096); /* holds 16K cells */ 
  char* stack_top = allocate_protected_space(stack_size);
  char* stack_base = stack_top + stack_size;
  // heap
  int heap_size =  (16 * 4096); /* heap */
  char* heap = allocate_protected_space(heap_size);
  // save registers & call scheme
  context ctxt;
  print_ptr(scheme_entry(&ctxt, stack_base, heap));
  // free heap & stack
  deallocate_protected_space(stack_top, stack_size);
  deallocate_protected_space(heap, heap_size);
  return 0;
}
