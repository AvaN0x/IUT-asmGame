
CMPMEM MACRO mA, mB		; MACRO pour comparer 2 cases mémoires (mA et mB)
	push cx		; save des registres

	mov cx, mB
	CMP mA, cx

	pop cx		; recuperation des registres
ENDM
 
SETCURSOR MACRO col, row
	push ax		; save des registres
	push bx		;
	push cx		;
	push dx		;

	mov	ah, 02H  	; set cursor
	mov	bh, 00   
	mov	dh, row		; row
	mov	dl, col		; column
	int	10H			; interruption

	pop dx		; recuperation des registres
	pop cx		;
	pop bx		;
	pop ax		;
ENDM

SAUTLIGNE:
	push ax		; save des registres
	push dx		;

	mov AH,2			; 	affichage caractere				\
	mov dl, 13			;	charge du caractère 13			|	caractère en fonction des machines : \n = 13 suivit de 10 sous Windows (0D 0A)
	int 21H				;	charge l'interruption			|	
	mov dl, 10			;	charge du caractère 10 = \n		|	saut de ligne
	int 21H				;	charge l'interruption			/

	pop dx		; recuperation des registres
	pop ax		;

ret

STRINGOUT MACRO string
	; var	DB	"Text", 13, 10, 24h 	; 13 is carriage return, 10 is line feed

	push ax		; save des registres
	push dx		;
	
	LEA DX, string	;	charge l'adresse du msg	
	mov AH, 09H			;	charge la fonction
	int 21H				;	charge l'interruption

	pop dx		; recuperation des registres
	pop ax		;
ENDM

PRINTNUM MACRO num
	local load, print, end
	push ax		; save des registres
	push bx		;
	push cx		;
	push dx		;

	mov ax, num		; deplace le nombre dans le registre
	
	mov cx, 0 
    mov dx, 0 

	cmp ax, 0		; if ax is zero 
	jne load    
	INC cx
	push ax

    load: 
		cmp ax, 0		; if ax is zero 
		je print       
		mov bx, 10		; initilise bx a 10       
		div bx			; extrait le dernier chiffre
		push dx			; push le chiffre
		inc cx			; increment le nombre de chiffres             
		mov dx, 0		; reset dx 
		jmp load 
    print: 
		cmp cx, 0		; regarde si le nombre de chiffre 
		je END			; est egal a zero

		pop dx 			; pop le chiffre
		add dx, '0' 	; transformation en ASCII
		mov ah, 02h		; print un caractère
		int 21h
		dec cx 			; decrease le nombre de chiffres 
		jmp print
	END: 

	pop dx		; recuperation des registres
	pop cx		;
	pop bx		;
	pop ax		;

ENDM

STRINGIN:
	; LEA DX = BUFFER ( BUFFER db 100, ?, 100 DUP ('$') )		charger adresse 
	mov AH, 0AH			;	charger la fonction 0ah de saisit de chaines
	int 21H				;	charge l'interruption
ret

ENDPROG:
	mov ax, 4c00h
	int 21h
ret

CLEARSCREEN MACRO color
	FILLSCREEN 0, 0, 39, 24, color	; correspond à la taille totale de la fenetre
ENDM

FILLSCREEN MACRO ca, ra, cb, rb, color
	push ax		; save des registres
	push bx		;
	push cx		;
	push dx		;

	mov ah, 06h 		; function
	mov al, 0			; 0 to clear
	mov bh, color		; color for lines
	mov cl, ca   		; column top left
	mov ch, ra  		; row top left
	mov dl, cb			; column bottom right
	mov dh, rb			; row bottom right
	int 10h

	SETCURSOR 0, 0

	pop dx		; recuperation des registres
	pop cx		;
	pop bx		;
	pop ax		;

ENDM

SETGRAPHICS:
	push ax		; save des registres

	mov	ah, 00h 		; fonction pour initialiser mode graphique
	mov	al, 13h			; numero du mode video
	int	10h				; interruption correspondante

	pop ax		; recuperation des registres
ret

;			(x, y) color in hex
SETPIX MACRO x, y, color	
	push ax		; save des registres
	push bx		;
	push cx		;
	push dx		;


	mov al, color
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating
    mov cx, x			; coord x
    mov dx, y			; coord y
	int 10h 			; interruption correspondante

	pop dx		; recuperation des registres
	pop cx		;
	pop bx		;
	pop ax		;
ENDM

SETROWPIX MACRO xA, yA, xB, color
	local SETPIX

	push ax		; save des registres
	push bx		;
	push cx		;
	push dx		;

	mov al, color
	mov ah, 0ch		; procedure pour pixel
	mov bh, 1    	; page no - critical while animating
	mov cx, xA		; x
	mov dx, yA		; y
	SETPIX: 
		int 10h
		inc cx		; incremente
		cmp cx, xB	; comparaison entre les coordonnées x
		jle SETPIX	; si cx <= xB on jump a SETPIX

	pop dx		; recuperation des registres
	pop cx		;
	pop bx		;
	pop ax		;
ENDM

SETFILLEDSQUARE MACRO xA, yA, xB, yB, color
	local SETROW
	push cx		; save des registres
	push dx		;

	mov cx, xA		; coord xA dans cx
	mov dx, yA		; coord yA dans cx
	SETROW:
		SETROWPIX xA, dx, xB, color		; fill the line
		inc dx			; incremente
		cmp dx, yB		; compare actual line and the last one to fill
		jle SETROW		; if less or equal jump SETROW

	pop dx		; recuperation des registres
	pop cx		;
ENDM
