.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

#recursive version
factorial:
    # YOUR CODE HERE
    # n is stored at a0
    li t0, 1
    beq a0, t0, finish #if (n == 1) jump to finish
    addi sp, sp, -8 #expand the stack frame
    sw ra, 4(sp) #push ra onto stack
    sw a0, 0(sp) #store the current n
    addi a0, a0, -1 #prep n-1
    jal ra, factorial #call factorial(n-1), ra will be stored with the current address
    lw t0, 0(sp)
    mul a0, a0, t0
    lw ra, 4(sp)
    addi sp, sp, 8 #delete the stack frame
finish:
    ret
    
