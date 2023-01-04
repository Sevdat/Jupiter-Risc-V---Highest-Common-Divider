.text
Nod:
.globl Nod
mv t0,a0
mv t1,a1
li t2, -1

li a2, 0    #count
li a3, 0   #save

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
mv t0,a0
mv t1,a1
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
mv a0,a5
ret