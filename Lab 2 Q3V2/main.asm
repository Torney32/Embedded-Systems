;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
		;Store values in R4,5,6
		mov.w #0CFA1h, R4
		mov.w #0ABC0h, R5
		mov.w #0001h, R6

		;And operation
		and R6, R4
		and R6, R5

		;Comparison
		cmp R4,R6
		jeq R4equalR6 ;if equal go here
		jne R5cmpR6   ;if not equal go here
		jmp $

R4equalR6:;cmp R5 and R6 if R4=R6
		cmp R5,R6;
		jeq R4R5equalR6; func for both equal
		jne OnesComp;only if 1 equals R6
		jmp $;

R4R5equalR6:
		mov.w #0FF0h, R9
		jmp $;

R5cmpR6:;compare after R4 != R6
		cmp R5,R6;
		jeq OnesComp; func for 1 equal
		jmp $;

OnesComp:;function to perform one's complement
		mov.w #0FFFFh, R10
		xor R9,R10
		jmp $
                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
