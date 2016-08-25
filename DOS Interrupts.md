#DOS Interrupts

MS-DOS provides many common services through INT 21h. Entire books have been written about the variety of functions available; I will just list the most basic ones for console input and output here.
Input a character.

        MOV     AH, 01h
        INT     21h
        
After the interrupt, AL contains the ASCII code of the input character. The character is echoed (displayed on the screen). Use function code 8 instead of 1 for no echo.
Input a string.

        SECTION .data
        Buffer  DB      BUFSIZE         ;BUFSIZE is max number of chars to read, <= 255
        RESB    BUFSIZE + 1

        SECTION .text
        MOV     DX, Buffer
        MOV     AH, 0Ah
        INT     21h

After the interrupt, BYTE [Buffer + 1] will contain the number of characters read, and the characters themselves will start at Buffer + 2. The characters will be terminated by a carriage return (ASCII code 13), although this will not be included in the count.

Output a character.

        MOV     DL, ...
        MOV     AH, 02h
        INT     21h

Load the desired character into DL, then call the interrupt with function code 2 in AH.

Output a string.

        MOV     DX, ...
        MOV     AH, 09h
        INT     21h

Load the address of a '$'-terminated string into DX, then call the interrupt with function code 9 in AH.

Exit.

        MOV     AL, ...
        MOV     AH, 4Ch
        INT     21h

Load the return code (0 for normal exit, non-zero for error) into AL, then call the interrupt with function code 4Ch in AH. This is the proper DOS exit routine; however, if you are running your program with DEBUG, this will exit DEBUG. An alternative is to go behind DOS's back and use the BIOS routine accessed by INT 20h, which will return control to the DEBUG prompt when executed.
