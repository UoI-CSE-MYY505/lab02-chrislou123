.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
findLast_backwards_withPointers:
    beq  a1, zero, ret0
    slli s0, a1, 2  # offset of 1 word past the end of the array
    add  s0, s0, a0 # full address of the above
loop:
    addi s0, s0, -4   # s0--
    lw   t1, 0(s0)
    beq  t1, a2, done
    bne  s0, a0, loop
ret0:
    add  s0, zero, zero
done:
    addi a7, zero, 10 
    ecall
   
