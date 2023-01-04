.globl __start
.rodata
array_length:
.word 5
.data
array:
.word -10, 5, 20, -60, 200
.text

__start:

la t0, array  #firstElementAdress
la t1, array_length  #sizeAdress
lw t1, 0(t1)  #size
li a2, 0    #count
li a3, 0   #save
li t2, -1

smallest:
bgeu a2, t1, finish
lw a4, 0(t0) #firstElement 10
bge a4, zero, positiveOne
mul a4, a4, t2 
positiveOne:
beq a2, zero, addSmallest
bgeu a3,a4, addSmallest
addi t0, t0, 4
addi a2, a2, 1
j smallest
addSmallest:
mv a3, a4
addi t0, t0, 4
addi a2, a2, 1
j smallest
finish:

mv a5,a3 #smallestInList
addi a5,a5,1

restart:
addi a5,a5,-1
la t0, array  #firstElementAdress
la t1, array_length  #sizeAdress
lw t1, 0(t1)  #size
li a2, 0    #count
li a3, 0   #save

nextNumber:
lw a4, 0(t0) #firstElement 10
bge a4, zero, positiveTwo
mul a4, a4, t2 
positiveTwo:
beq a2,t1,end

addition:
add a3,a3,a5
beq a4,a3, possible
bgeu a3,a4, restart
j addition

possible:
li a3, 0   #save
addi t0,t0,4
addi a2,a2,1
j nextNumber


end:
mv a1,a5
li a0,1
ecall
li a0, 10
ecall