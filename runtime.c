/* a simple driver for scheme_entry */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>

int scheme_entry(char*);

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

/* all scheme values are of type ptrs */
typedef unsigned int ptr;

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

static char* allocate_protected_space(int size) {
  //printf("allocating protected space %i\n", size);
  int page = getpagesize();
  //printf("page size %i\n", page);
  int status;
  int aligned_size = ((size + page - 1) / page) * page;
  //printf("aligned size %i\n", aligned_size);
  char *p = mmap(0, aligned_size + 2 * page,
		 PROT_READ | PROT_WRITE,
		 MAP_ANON | MAP_PRIVATE,
		 0, 0);
  //printf("memory mapped at %p\n",p);
  if (p == MAP_FAILED) { printf("MAP FAILED exiting\n"); exit(-1); }
  status = mprotect(p, page, PROT_NONE);
  if (status != 0) { printf("mprotect returned non-zero status; exiting\n"); exit(-2); }
  //printf("protected first page at %p\n",p);
  status = mprotect(p + page + aligned_size, page, PROT_NONE);
  if (status != 0) { printf("mprotect failed; exiting\n"); exit(-3); }
  //printf("protected last  page at %p\n", p + page + aligned_size);
  return (p + page);
}

static void deallocate_protected_space(char *p, int size) {
  //printf("deallocating protected space\n");
  int page = getpagesize();
  int status;
  int aligned_size = ((size + page - 1) / page) * page;
  status = munmap(p - page, aligned_size + 2 * page);
  if (status != 0) { printf("munmap returned non-zero status\n"); }
}

int main(int argc, char** argv){
  //printf("Entering main\n");
  
  int stack_size = (16 * 4096); /* holds 16K cells */
  //printf("stack size is %i\n", stack_size);
  
  char* stack_top = allocate_protected_space(stack_size);
  //printf("stack top is %p\n", stack_top);
  
  char* stack_base = stack_top + stack_size;
  //printf("calling scheme_entry with stack base %p\n", stack_base);
  
  print_ptr(scheme_entry(stack_base));
  
  //printf("returned from scheme_entry\n");
  deallocate_protected_space(stack_top, stack_size);
  //printf("exiting normally\n");
  return 0;
}
