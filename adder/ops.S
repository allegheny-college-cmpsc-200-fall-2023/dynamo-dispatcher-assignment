.thumb_func		    	@ Necessary because sdk uses BLX
.global add	    	 	@ Provide program starting address to linker

add:
    PUSH    {LR}
    @BKPT
    LDR     R6, [R4]
    LDR     R7, [R5]
    ADD     R6, R7
    POP     {R0}
    @BKPT
    BX      R0