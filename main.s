
.rodata
array_length:
.word 5
.data
array:
.word 10, 5, 20, 60, 200
.text

main:
.global main
li t0, 1
la t1, array_length #adress
la t3, array #adressOfFirst
mv a7, t1
mv a6, t3
lw t2, 0(t1)  #size 5
lw t4, 0(t3)  #firstElement 50

addi sp, sp, -16 #выделение памяти в стеке
sw ra, 12(sp) # сохранение
call NOD2
lw ra, 12(sp) # востанавливаем
addi sp, sp, 16 # освобождение памяти в сетке

finish:
mul t4,t6,t4
li a0, 1
mv a1,t4
ecall
ret