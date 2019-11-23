include macro.asm
.model small ,stdcall
.286
.stack ;segmento de stack
.data ;segmento de datos     

    msg         db 'resultado=','$'
    buffer1     db 'y^2','$'
    parA       db '[','$'
    parC       db ']','$'
    salto       db 13,10,'$'
    
    base        word 1 dup('$')
    elevado     word 1 dup('$')
    num         word 1 dup('$')
    acumulador  word 1 dup('$')    

.code ;segmento de código======================================================
main proc 
		  
            mov ax, @data
            mov ds,ax
            mov es,ax
            ;METODO1
            ;raizAlaN 2,144 ;la raiz cuadrada de 144= 12
            ;raizAlaN 3,8   ;la raiz tercera de 8=2
            ;METODO2
            ;saca el numero del buffer y^2 -> saca el 2
            
            mov cl,2
            mov elevado[0],cx
            mov base[0],144
            raizAlaN elevado[0],base[0]
            
        
    terminar:
        MOV ah, 4ch
        int 21h 


main endp    
end

