.thumb_func		    	@ Necessary because sdk uses BLX
.global add	    	 	@ Provide program starting address to linker

add:
    @ TODO: PUSH link register to stack
    LDR     R6, [R4]
    LDR     R7, [R5]
    ADD     R6, R7
    @ TODO: POP link register value to a lo register
    @ TODO: BX (Branch and eXecute) back to main 