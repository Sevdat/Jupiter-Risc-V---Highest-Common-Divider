.rodata
array_length:
.word 5
.data
array:
.word -10, 5, 20, -60, 200
.text

main:
.globl main

la a0, array  #firstElementAdress
la a1, array_length  #sizeAdress
lw a1, 0(a1)  #size

addi sp, sp, -16 #выделение памяти в стеке
sw ra, 12(sp) # сохранение
call Nod
lw ra, 12(sp) # востанавливаем
addi sp, sp, 16 # освобождение памяти в сетке

end:
mv a1,a0
li a0,1
ecall
ret

#(bgeu t1, t2, goToMarking -> if (t1 >= t2) goToMarking)
#(beq t1, zero, finish -> if(t1 == 0) goToFinish)
#(li t0, 1 -> t0 = 1)
#(add t0, t1, t2 -> t0 = t1 + t2 )
#(addi t0, t1, 2 -> t0 = t1 + 2 )
#(j loop -> goToLoop)
#(mul t4,t6,t4 -> t4 = t6 * t4)

#li t0, 1
#la t1, array_length #adress
#la t3, array #adressOfFirst
#lw t2, 0(t1)  #size 5
#lw t4, 0(t3)  #firstElement 50
#addi t3, t3, 4  #nextAdress
#lw t5, 0(t3)  #nextElement 20