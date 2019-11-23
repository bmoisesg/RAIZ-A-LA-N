print macro cadena 
    
	LOCAL ETIQUETA 
    pusha
	ETIQUETA: 
		MOV ah,09h 
		MOV dx,@data 
		;MOV dx, SEG cadena
		MOV ds,dx 
		MOV dx, offset cadena 
		int 21h
        popa
endm


println macro 
    print salto
endm    

printRegistro macro parametro
	LOCAL inicio,imprime,fin,imprime,imp

	    pusha
		print parA
	inicio:	
		mov ax,parametro
		mov cx,5
		mov dx,0
		
	imprime:
		mov bx,10  	
		div bx
		add dl,30h
		mov dh,0
		push dx
		mov dx,0
	loop imprime

		mov cx,5
    imp:	
        mov ah,02h
        pop dx 
        int 21h
        loop imp
        print parC
	    popa
endm

raizAlaN macro parametro1, parametro2
    LOCAL eti, etiFin,etiLoop
    ;parametro1 es el indice
    ;parametro2 es la base
    ;num va de [1-infinito]
    mov num[0],01h    
    eti:
        mov cx,parametro1       ;para el loop usa cx
        mov acumulador[0],01h   ;reiniciamor acumulador
            etiLoop: ;multiplica parmetro1- veces y lo guarda en acumulador
                mov ax, acumulador[0]
                mov bx, num[0]
                mul bx
                mov acumulador[0],ax
            loop etiLoop
        ;compara si el resultado de acumlador es igual que la base
        mov dx, parametro2
        cmp acumulador[0],dx
        je etiFin                   ;si es correcto, sale
        inc num                     ;si es incorrecto, num++ y hacer otra iteracion
        mov acumulador[0],1h        ;reiniciar el valor del acumulador  
        jmp eti
    etiFin:
        ;muestra resultado
        print msg
        printRegistro num
        println
endm