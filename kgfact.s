@@ mycode.s :
@@ Test code for STM32 and linking assembly to C
 

    .code   16
    .text                   @@ - Code section (text -> ROM)

@@ <function block>
    .align  2               @@ - 2^n alignment (n=2)
    .syntax unified
    .global kgfactorial          @@ - Symbol name for function
    .code   16              @@ - 16bit THUMB code (BOTH are required!)
    .thumb_func             @@ /
    .type   kgfactorial, %function   @@ - symbol type (not req)

@@ Declaration : int kgfactorial(int x)
@@ Uses r0 for param 0
@@   r0: x

kgfactorial: PUSH {R4,LR}     @@Store R4 and LR to Stack Memrory 
	    MOV R4,R0         @@Move R0 data to R4
	    CMP R4, #0x01     @@Compare value of R4 with 0x01
	    BNE NZ            @@BNE(Branch if not equal), it will go to NZ 
	    MOVS R0,#0x01     @@Move 0x01 to R0 with updating status 
loop:       POP {R4,PC}       @@Store R4 and PC to Stack Memory 
NZ:	    SUBS R0,R4,#1     @@R0 = R4-1(with updating status)
	    BL kgfactorial    @@Branch to kgfactorial and also link
	    MUL R0,R4,R0      @@R0 = R4 * R0
	    B loop            @@Branch to loop

.size   kgfactorial, .-kgfactorial    @@ - symbol size (not req)
