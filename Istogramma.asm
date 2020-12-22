;Rossetti Jacopo
;3INA
;22/12/2020
TITLE ciclo do-while
.MODEL SMALL    
    
.DATA 

    array db 3,5,8,9,10,'$'
    spa   db 20h
    conta db 0
    cr    db 0Dh
    lf    db 0Ah

.CODE
    lea si,array                                                                                               

.STARTUP
inizio:
    
    mov bl,[si]
    cmp bl,'$'
    jne ist1
    jmp fine
ist1:
    mov dl,"-"
    mov ah,02h
    int 21h 
    mov dl,spa
    int 21h
    jmp ist2
ist2:
    mov dl,"*"
    int 21h
    inc conta
    cmp conta,bl
    je  ist3
    jmp ist2
    
ist3:
    mov dl,lf
    int 21h
    mov dl,cr
    int 21h
    inc si
    mov conta,0
    jmp inizio    
     
    
    
         

fine:    
;servizio DOS di chiusura programma
    mov ax, 4c00h ; exit to operating system.
    int 21h    
END

