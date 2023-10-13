.thumb_func
.global sifter

sifter:
    @ TODO: Prepare stack frame for sifter
    LDR     R0, =format
    MOV     R1, R7
    @ TODO: Branch and Link to determine_type
    @ TODO: Branch and Link to determine_quality
    BL      printf
    @ TODO: Pop appropriate registers to...
    @ TODO: Branch and eXecute back to subroutine calling this one (caller)

determine_type:
    @ TODO: Prepare stack frame for determine_type
    @ TODO: Shift appropriate direction(s) to get the type bits
    @ TODO: Compare and branch to appropriate typing branches

is_lunar_type:
    LDR     R2, =lunar
    @ TODO: Pop from stack to get address of caller
    @ TODO: Branch and eXecute to caller

is_martian_type:
    LDR     R2, =martian
    @ TODO: Pop from stack to get address of caller
    @ TODO: Branch and eXecute to caller

determine_quality:
    @ TODO: Set up stack frame for determine_quality
    @ TODO: Shift appropriate places and direction(s) to get quality bits
    @ TODO: Compare and branch to correct quality branch

hi_quality:
    LDR     R3, =hi_qual
    @ TODO: Pop from stack to get address of caller
    @ TODO: Branch and eXecute to caller

lo_quality:
    LDR     R3, =lo_qual
    @ TODO: Pop from stack to get address of caller
    @ TODO: Branch and eXecute to caller

.data
    format:     .asciz      "0x%08x\tTYPE: %s\tQUALITY: %s\n"
    lunar:      .asciz      "LUNAR"
    martian:    .asciz      "MARTIAN"
    hi_qual:    .asciz      "HI"
    lo_qual:    .asciz      "LO"