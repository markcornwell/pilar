/* a simple driver for scheme_entry */

#include <stdio.h>

int scheme_entry();

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

int main(int argc, char** argv){
   print_ptr(scheme_entry());
   return 0;
}
