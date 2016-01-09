# Hello World

     .text
     .global start
start:
      pushl $13      # push the length of the string
      pushl msg      # push pointer to the string
      pushl  $1      # push stdout file descriptor
      subl  $4,%esp  # align the stack by moving the ptr 4 more bytes (16-4*3) 
      mov   $4,%eax  # set the eax register to the write syscall number (4)
      int   $0x80     # interrupt 0x80
      addl  $16,%esp # clean up stack parameters

      movl  $1,%eax  #  the length of the string
      movl  $13,%esp #  a carriage return
      int   $0x80

      .data
msg:  .ascii "Hello, world!\n"
