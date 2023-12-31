/* -- store01.s */

/* -- Data section */
.data

/* Ensure variable is 4-byte aligned */
.align 4
/* Define storage for myvar1 */
myvar1:
    /* Contents of myvar1 is 4 bytes containing the value 0 */
    .word 0

/* Ensure variable is 4-byte aligned */
.align 4
/* Define storage for myvar2 */
myvar2:
    /* Contents of myvar2 is 4 bytes containing the value 4 */
    .word 0

/* -- Code section */
.text

/* Ensure code is 4 byte aligned */
.balign 4
.global _start
_start:
    ldr r1, addr_of_myvar1 /* r1 <- &myvar1 */
    mov r3, #3 /* r3 <- 3 */
    str r3, [r1] /* *r1 <- r3 */
    ldr r2, addr_of_myvar2 /* r2 <- &myvar2 */
    mov r3, #4 /* r3 <- 4 */
    str r3, [r2] /* *r2 <- r3 */

    /* Same instructions as above */
    ldr r1, addr_of_myvar1 /* r1 <- &myvar1 */
    ldr r1, [r1] /* r1 <- *r1 */
    ldr r2, addr_of_myvar2 /* r2 <- &myvar2 */
    ldr r2, [r2] /* r2 <- *r2 */
    add r0, r1, r2

    /* End program */
    mov r7, #1
    svc 0

/* Labels needed to access data */
addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2
