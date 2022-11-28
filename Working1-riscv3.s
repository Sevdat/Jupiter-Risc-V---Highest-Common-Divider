.globl __start
.rodata
array_length:
.word 5
.data
array:
.word 10, 5, 20, 60, 200
.text

#(bgeu t1, t2, goToMarking -> if (t1 >= t2) goToMarking)
#(beq t1, zero, finish -> if(t1 == 0) goToFinish)
#(li t0, 1 -> t0 = 1)
#(add t0, t1, t2 -> t0 = t1 + t2 )
#(addi t0, t1, 2 -> t0 = t1 + 2 )
#(j loop -> goToLoop)

__start:
li t0, 1
la t1, array_length #adress
la t3, array #adressOfFirst
lw t2, 0(t1)  #size 5
lw t4, 0(t3)  #firstElement 50

Loop0:   
beq t2, t0, continiue
addi t3, t3, 4  #nextAdress
lw t5, 0(t3)  #nextElement 20
bgeu t4, t5, goToMarking
addi t2, t2, -1 #size -= 1
j Loop0
goToMarking:
mv t4, t5
addi t2, t2, -1 #size -= 1
j Loop0

continiue:

li t0, 1
la t1, array_length #adress
la t3, array #adressOfFirst
lw t2, 0(t1)  #size 5
li t6, -1
addi t4,t4,1 # smal += 1
mul t4,t4,t6 # smal = -7


restart:
addi t4, t4, 1  #smal += 1
beq t4, zero, finish
mv a2, t2 # a2 = size
mv a3, t3 #a3 = adressOfFirst
mul a5, t4, t6

nextElement:
addi a2, a2, -1   # size -= 1
beq a2, zero, finish  # if (size == 0) finish
lw a4, 0(a3) #element = 80

repeat:
beq a4, a5, Next   # if (element == positsmal) Next
bgeu a5,a4, restart # if (-1 >= element) restart
add a4, a4, t4  # element -= 6   
j repeat

Next:
addi a3,a3, 4 #NextElement
j nextElement

finish:
mul t4,t6,t4
li a0, 1
mv a1,t4
ecall
li a0, 10
ecall