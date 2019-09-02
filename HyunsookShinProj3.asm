;LoganWileyproj6.asm
;This program creates a simple boolean calculator for 32-bit integers

INCLUDE Irvine32.inc
includelib \Irvine\lib32\Kernel32.lib
includelib \Irvine\lib32\user32.lib
includelib \Irvine\Irvine32.lib
.data
oprTable BYTE '1' ;value 1
         DWORD PRINT_AND ;procedure for PRINT_AND
EntrySize = ($-oprTable)
         BYTE '2' ;value 2
         DWORD PRINT_OR ;procedure for PRINT_OR
         BYTE '3' ;value 3
         DWORD PRINT_NOT ;procedure for PRINT_NOT
         BYTE '4' ;value 4
         DWORD PRINT_XOR ;procedure for PRINT_XOR
         BYTE '5' ;value 5
         DWORD EXIT_PROG ;procedure for EXIT_PROG
CountEntries = ($-oprTable) / EntrySIze
;strings for user menu
str1 BYTE "1. x AND y", 0dh,0ah,0
str2 BYTE "2. x OR y", 0dh,0ah,0
str3 BYTE "3. NOT x",0dh,0ah,0
str4 BYTE "4. x XOR y",0dh,0ah,0
str5 BYTE "5. Exit program",0dh,0ah,0
strCh BYTE "Enter your choice: ",0

;string for each operations
strA BYTE "AND operation", 0
strO BYTE "OR operation", 0
strN BYTE "NOT operation",0
strX BYTE "XOR operation",0
strE BYTE "Thank you ",0

.code
main PROC
    ;calls procedure
    call Clrscr ;clears screen
    ;display menu
    mov edx, OFFSET str1
    call WriteString
    mov edx, OFFSET str2
    call WriteString
    mov edx, OFFSET str3
    call WriteString
    mov edx, OFFSET str4
    call WriteString
    mov edx, OFFSET str5
    call WriteString
    mov edx, OFFSET strCh
    call WriteString ;prompts user for choice
    call ReadChar ;read user choice
    call WriteChar ;print user choice
    mov esi,OFFSET oprTable ;point esi to the address of table
    mov ecx,CountEntries ;count of table entries
    call Crlf
L1: ;beginning of loop
    cmp al,[esi] ;compare characters
    jne L2 ;
    call NEAR PTR [esi+1]
    call Crlf
    jmp L3 ;exit the loop
L2:
    add esi,EntrySize ;got next entry table
    loop L1    ;repeat until ecx=0
L3:
    exit
main ENDP
;define procedures
PRINT_AND PROC
    mov edx,OFFSET strA
    call WriteString
    ret
PRINT_AND ENDP
PRINT_OR PROC
    mov edx,OFFSET strO
    call WriteString
    ret
PRINT_OR ENDP 
PRINT_NOT PROC
    mov edx,OFFSET strN
    call WriteString
    ret
PRINT_NOT ENDP          
PRINT_XOR PROC
    mov edx,OFFSET strX
    call WriteString
    ret
PRINT_XOR ENDP
EXIT_PROG PROC
    mov edx,OFFSET strE
    call WriteString
    ret
EXIT_PROG ENDP    
END main
