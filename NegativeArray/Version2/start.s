.text
__start:
.globl __start

  call main
  
  end:
  mv a1,a0
  li a0,17
  ecall