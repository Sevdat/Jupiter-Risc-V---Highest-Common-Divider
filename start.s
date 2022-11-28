# setup.s
.text

__start:

.globl __start
   call main
 
finish:

 li a0, 10 # a0 = 17
 ecall # выход с кодом завершения
 
 
 
 
 