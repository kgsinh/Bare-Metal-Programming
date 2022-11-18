@@ kgcmp.s :
@@ Code for Comparing two numbers on STM32 and linking assembly to C
 

    .code   16
    .text                   @@ - Code section (text -> ROM)

@@ <function block>
    .align  2               @@ - 2^n alignment (n=2)
    .syntax unified
    .global KG_AFC          @@ - Symbol name for function
    .code   16              @@ - 16bit THUMB code (BOTH are required!)
    .thumb_func             @@ /
    .type   KG_AFC, %function   @@ - symbol type (not req)

@@ Declaration : int KG_AFC(int32_t A, int32_B)
@@ Uses r0 for parameter 0
@@ Uses r1 for parameter 1
@@   r0: A
@@   r1: B
  

KG_AFC:
        push    {ip, lr} @store ip and lr to stack memory
        mov r3, #0       @move 0 to r0
        cmp r0,r1        @compare r0 and r1 values
        bgt label1       @branch to label1 if r0 is greater than r1
        blt label2       @branch to label2 if r0 is less than r1
        beq label3       @branch to label3 if r0 equal to r1
  
label1: ldr r0, =statement1 @print A > B
        bl printf           @branch and also link to printf 
        pop {ip, pc}        @store ip and pc to stack memory

label2: ldr r0, =statement2 @print A < B
        bl printf
        pop {ip, pc}

label3: adds r3, r3, #1  @increment r3 by 1 and store it to r3
        cmp r3, #3       @compare r3 with value 3
        bne print        @branch to print if r3 and 3 are not equal
        mov r3, #0       @mov 0 to r3
        b break          @branch to break
        
print:  ldr r0, =statement3 @print A = B
        bl printf  
        pop {ip, pc}

        mov r0, #0       @move 0 to r0 like return 0         

        bl KG_AFC        @branch and also link to KG_AFC

break:                   @to break the execution
      

statement1: .asciz "A > B\n"  @string to printf call and print the string    

statement2: .asciz "A < B\n"

statement3: .asciz "A = B\n"


.size   KG_AFC, .-KG_AFC    @@ - symbol size (not req)
