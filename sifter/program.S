.thumb_func		    	@ Necessary because sdk uses BLX
.global main	   	 	@ Provide program starting address

main:
    BL          stdio_init_all
    MOV         R4, #0
    LDR         R5, =numbers
    LDR         R6, =size

load:
    @ TODO: Set up stack frame for load function
    LDR         R7, [R5, R4]
    ADD         R4, #4
    @ TODO: Branch and link to the sifter
    CMP         R4, R6
    BNE         load

rest:
    NOP
    B           rest

.data
    numbers:    .word   255, 1426063615, 855638271, 0, 1140850943
    end:
    .set        size,   end - numbers