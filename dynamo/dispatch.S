.thumb_func		    	@ Necessary because sdk uses BLX
.global dispatch   	 	@ Provide program starting address to linker

dispatch:
    @ TODO: Push link register to the stack
    MOV     R7, #0
    PUSH    {R6}
    @ TODO: Branch and Link (BL) to get_msb
    POP     {R6}
    CMP     R7, #20
    @ TODO: Branch back to the launcher to continue main loop if
    @       value is less than 20 bits
    MOV     R1, R6      @ Moves the original value to the printable spot
    @ TODO: Load release format string
    BL      printf
    @ TODO: POP the value from the link register to lo register
    @ TODO: Branch and eXecute to location POP'd above

get_msb:
    @ TODO: Evaluate if number is 0
    @ TODO: If so, return to the dispatcher
    @ HINT: The above is tricky, and uses a label already here;
    @       you'll need to do something with the stack, likely
    @ TODO: Increment an arbitrary bit counting register by #1
    @ TODO: Shift right to count significant bits remaining
    B       get_msb

return_to_dispatcher:
    BX      LR

return_to_launcher:
    @ TODO: Finish this label's functionality to return to the main
    @       loop (i.e. the launcher) in order to grab the next number
    @       from the array (it's 2 instructions)
    @ HINT: This will likely require POP'ing a value and then branch and eXecute
    @       back to the original location; keep track of these values in the
    @       stack on paper -- it's the only way
.data
    release:    .asciz      "(%d) DYNAMO RELEASED!\n"
