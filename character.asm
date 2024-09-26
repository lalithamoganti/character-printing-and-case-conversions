ORG 100h           
MOV DX, OFFSET msg_input  
MOV AH, 09h        
INT 21h            

MOV AH, 01h       
INT 21h            
MOV BL, AL        

  ; Print the message "The lowercase letter is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h 
MOV DL, BL           ; Call DOS interrupt to print the output message
MOV AH, 02h        
INT 21h            


MOV AH, 4Ch        
INT 21h            
 msg_input  DB 'Enter a Character: $'
 msg_output DB 0Dh, 0Ah, 'The Character is: $'  ; Output message         
END      