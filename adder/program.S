.thumb_func		    	@ Necessary because sdk uses BLX
.global main	   	 	@ Provide program starting address to linker

main:
    BL  stdio_init_all
    LDR R4, =a
    LDR R5, =b
    BL  add             @ JUMP TO add; STORE CURRENT LOCATION
                        @ OF PROGRAM TO LR
    LDR R0, =finish
    MOV R1, R6
    BKPT
    BL  printf

rest:
    NOP
    B   rest

.data
    a:          .word       2
    b:          .word       3
    finish:     .asciz      "SUM: %d\n"