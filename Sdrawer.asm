;  __ _                                            _                
; / _(_)_ __ ___  _ __  ___  ___  _ __   ___/\   /(_)_ __ _   _ ___ 
; \ \| | '_ ` _ \| '_ \/ __|/ _ \| '_ \ / _ \ \ / / | '__| | | / __|
; _\ \ | | | | | | |_) \__ \ (_) | | | | (_) \ V /| | |  | |_| \__ \
; \__/_|_| |_| |_| .__/|___/\___/|_| |_|\___/ \_/ |_|_|   \__,_|___/
;                |_|                                                
; By Clément RICATTE & Valentin Azancoth
; -> github.com/AvaN0x

drawPLAYER:
	mov cx, PLAYER
	mov dx, PLAYER+2
	mov ah, 0ch
	mov bh, 1

	cmp PLAYER+6, 3
	jg drawPlayer1

		; colonne 0
		add cx, 1
		push dx
			add  dx, 1
			mov al, 080h
			int 10h				; (0-1)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (0-2)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (0-3)
		pop dx
		; colonne 1
		add cx, 1
		push dx
			add  dx, 1
			mov al, 080h
			int 10h				; (1-1)
			add  dx, 1
			mov al, 080h
			int 10h				; (1-2)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (1-3)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (1-4)
		pop dx
		; colonne 2
		add cx, 1
		push dx
			add  dx, 2
			mov al, 080h
			int 10h				; (2-2)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-3)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-4)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-5)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-6)
		pop dx
		; colonne 3
		add cx, 1
		push dx
			add  dx, 3
			mov al, 080h
			int 10h				; (3-3)
			add  dx, 1
			mov al, 026h
			int 10h				; (3-4)
			add  dx, 1
			mov al, 081h
			int 10h				; (3-5)
		pop dx
		; colonne 4
		add cx, 1
		push dx
			add  dx, 3
			mov al, 081h
			int 10h				; (4-3)
			add  dx, 1
			mov al, 081h
			int 10h				; (4-4)
			add  dx, 1
			mov al, 081h
			int 10h				; (4-5)
			add  dx, 1
			mov al, 081h
			int 10h				; (4-6)
		pop dx
		; colonne 5
		add cx, 1
		push dx
			add  dx, 2
			mov al, 081h
			int 10h				; (5-2)
			add  dx, 1
			mov al, 081h
			int 10h				; (5-3)
			add  dx, 1
			mov al, 026h
			int 10h				; (5-4)
			add  dx, 1
			mov al, 081h
			int 10h				; (5-5)
		pop dx
		; colonne 6
		add cx, 1
		push dx
			add  dx, 1
			mov al, 081h
			int 10h				; (6-1)
			add  dx, 1
			mov al, 081h
			int 10h				; (6-2)
			add  dx, 1
			mov al, 085h
			int 10h				; (6-3)
		pop dx
		; colonne 7
		add cx, 1
		push dx
			add  dx, 1
			mov al, 081h
			int 10h				; (7-1)
			add  dx, 1
			mov al, 085h
			int 10h				; (7-2)
		pop  dx
	
	jmp drawPlayerINC


	drawPlayer1:
		; colonne 0
		add cx, 1
		push dx
			add  dx, 2
			mov al, 080h
			int 10h				; (0-2)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (0-3)
		pop dx
		; colonne 1
		add cx, 1
		push dx
			add  dx, 2
			mov al, 080h
			int 10h				; (1-2)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (1-3)
		pop dx
		; colonne 2
		add cx, 1
		push dx
			add  dx, 1
			mov al, 080h
			int 10h				; (2-1)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-2)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-3)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-4)
			add  dx, 1
			mov al, 080h
			int 10h				; (2-5)
		pop dx
		; colonne 3
		add cx, 1
		push dx
			add  dx, 2
			mov al, 080h
			int 10h				; (3-2)
			add  dx, 1
			mov al, 026h
			int 10h				; (3-3)
			add  dx, 1
			mov al, 080h
			int 10h				; (3-4)
		pop dx
		; colonne 4
		add cx, 1
		push dx
			add  dx, 2
			mov al, 081h
			int 10h				; (4-2)
			add  dx, 1
			mov al, 081h
			int 10h				; (4-3)
			add  dx, 1
			mov al, 081h
			int 10h				; (4-4)
			add  dx, 1
			mov al, 081h
			int 10h				; (4-5)
		pop dx
		; colonne 5
		add cx, 1
		push dx
			add  dx, 1
			mov al, 081h
			int 10h				; (5-1)
			add  dx, 1
			mov al, 081h
			int 10h				; (5-2)
			add  dx, 1
			mov al, 026h
			int 10h				; (5-3)
			add  dx, 1
			mov al, 081h
			int 10h				; (5-4)
		pop dx
		; colonne 6
		add cx, 1
		push dx
			add  dx, 2
			mov al, 081h
			int 10h				; (6-2)
			add  dx, 1
			mov al, 085h
			int 10h				; (6-3)
		pop dx
		; colonne 7
		add cx, 1
		push dx
			add  dx, 2
			mov al, 081h
			int 10h				; (7-2)
			add  dx, 1
			mov al, 085h
			int 10h				; (7-3)
		pop  dx

	drawPlayerINC:
		cmp PLAYER+6, 8					; si on est pas a la limite
		jne allowedDrawPlayerINC		; on peut incrémenter
		mov PLAYER+6, 0					; sinon on remet a 0
		jmp drawPLAYEREND
		
		allowedDrawPlayerINC:
		inc PLAYER+6 		; incremente

	drawPLAYEREND:
ret

DrawHomer MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Homer		; x coordinate
	mov dx, Homer+2	    ; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			mov al, LColor
			add cx, 3
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,5)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			mov al, LColor
			add cx, 2
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,6)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			mov al, LColor
			add cx, 2
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,6)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			mov al, LColor
			add cx, 2
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			mov al, LColor
			add cx, 2
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,6)
            add cx, 1
            mov al, _DPINK_
			int 10h 			; interruption correspondante	; (3,7)

		pop cx
	; ligne 5
		add dx, 1
		push cx
			mov al, _WHITE_
			add cx, 1
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (5,6)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (6,6)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,7)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 2
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 2
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,6)
		pop cx
ENDM

DrawMarge MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Marge		; x coordinate
	mov dx, Marge+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (0,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (0,5)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (1,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (1,6)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (2,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,6)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 3
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,6)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 2
			mov al, _LGREEN_
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 2
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,7)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 2
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 1
			mov al, _DPURPLE_
			int 10h 			; interruption correspondante	; (7,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,5)
		pop cx
ENDM

DrawBart MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Bart		; x coordinate
	mov dx, Bart+2   	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (0,5)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,6)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,6)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,6)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 1
			mov al, _DPURPLE_
			int 10h 			; interruption correspondante	; (5,6)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 2
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (6,6)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,7)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 2
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 2
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,6)
		pop cx
ENDM

DrawLisa MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Lisa		; x coordinate
	mov dx, Lisa+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,4)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,6)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (0,4)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (5,5)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			mov al, _MAGENTA_
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,6)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 2
			mov al, NColor
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 1
			mov al, _DPINK_
			int 10h 			; interruption correspondante	; (7,4)
		pop cx
ENDM

DrawMaggie MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Maggie		; x coordinate
	mov dx, Maggie+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
	; ligne 1
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
		pop cx
	; ligne 2
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,6)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (3,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (4,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,6)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			add cx, 2
			mov al, NColor
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,6)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,5)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (7,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (7,4)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (7,6)
		pop cx
ENDM

DrawBarney MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Barney		; x coordinate
	mov dx, Barney+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 2
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,5)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,7)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, _LMAGENTA_
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (3,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			mov al, _LMAGENTA_
			int 10h 			; interruption correspondante	; (4,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,6)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			mov al, _LMAGENTA_
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,6)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,6)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,7)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 1
			mov al, _BLUE_
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 2
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,6)
		pop cx
ENDM

DrawFlanders MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Flanders		; x coordinate
	mov dx, Flanders+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (0,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,5)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,5)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (4,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (5,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (5,5)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,6)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 1
			mov al, _GRAY_
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 2
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (7,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,5)
		pop cx
ENDM

DrawApu MACRO LColor      ; LIGHT color and Normal color
	mov cx, Apu		; x coordinate
	mov dx, Apu+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 1
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (0,1)
			add cx, 2
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,7)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (1,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (1,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,7)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (2,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,5)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 3
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (5,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 3
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 2
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (5,7)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			mov al, _LORANGE_
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			mov al, _YELLOW_
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			mov al, _LORANGE_
			int 10h 			; interruption correspondante	; (6,6)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,7)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 1
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 2
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,7)
		pop cx
ENDM

DrawPetitPapaNoel MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, PetitPapaNoel		; x coordinate
	mov dx, PetitPapaNoel+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,5)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 2
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (1,6)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			add cx, 3
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,6)
			add cx, 1
			mov al, _DBLUE_
			int 10h 			; interruption correspondante	; (2,7)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 3
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,5)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,5)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			mov al, LColor
			int 10h 			; interruption correspondante	; (7,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (7,4)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (7,5)
		pop cx
ENDM

DrawBouleDeNeige MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, BouleDeNeige		; x coordinate
	mov dx, BouleDeNeige+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
	; ligne 1
		add dx, 1
		push cx
			mov al, NColor
			int 10h 			; interruption correspondante	; (1,0)
			add cx, 3
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 2
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 2
			int 10h 			; interruption correspondante	; (2,6)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, _YELLOW_
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			mov al, _YELLOW_
			int 10h 			; interruption correspondante	; (3,6)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			mov al, nColor
			int 10h 			; interruption correspondante	; (4,0)
			add cx, 2
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (4,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,7)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			mov al, NColor
			int 10h 			; interruption correspondante	; (5,0)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,4)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 2
			int 10h 			; interruption correspondante	; (7,4)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (7,5)
		pop cx
ENDM

DrawKrusty MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Krusty		; x coordinate
	mov dx, Krusty+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 3
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			add cx, 3
			mov al, LColor
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (2,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,6)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (2,7)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			mov al, _LMAGENTA_
			int 10h 			; interruption correspondante	; (3,6)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (3,7)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (4,1)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (4,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,7)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			mov al, NColor
			int 10h 			; interruption correspondante	; (5,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,1)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			mov al, _PINK_
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,6)
			add cx, 1
			mov al, _DPINK_
			int 10h 			; interruption correspondante	; (5,7)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			mov al, _WHITE_
			int 10h 			; interruption correspondante	; (6,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			mov al, _LGREEN_
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (6,6)
			add cx, 1
			mov al, _LBLUE_
			int 10h 			; interruption correspondante	; (6,7)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 1
			mov al, _LMAGENTA_
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 2
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,7)
		pop cx
ENDM

DrawTahitiBob MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, TahitiBob		; x coordinate
	mov dx, TahitiBob+2	; y coordinate
	mov ah, 0ch			; procedure pour pixel
	mov bh, 1    		; page no - critical while animating

	; ligne 0
		push cx
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (0,1)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (0,2)
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (0,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (0,4)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (0,5)
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (0,6)
		pop cx
	; ligne 1
		add dx, 1
		push cx
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (1,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (1,7)
		pop cx
	; ligne 2
		add dx, 1
		push cx
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (2,0)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (2,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (2,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,4)
			add cx, 1
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (2,5)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (2,6)
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (2,7)
		pop cx
	; ligne 3
		add dx, 1
		push cx
			mov al, _LPURPLE_
			int 10h 			; interruption correspondante	; (3,0)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (3,2)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,3)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (3,4)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (3,5)
			add cx, 1
			mov al, _BLACK_
			int 10h 			; interruption correspondante	; (3,6)
			add cx, 1
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (3,7)
		pop cx
	; ligne 4
		add dx, 1
		push cx
			add cx, 3
			mov al, LColor
			int 10h 			; interruption correspondante	; (4,3)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (4,6)
		pop cx
	; ligne 5
		add dx, 1
		push cx
			add cx, 2
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,2)
			add cx, 1
			mov al, _WHITE_
			int 10h 			; interruption correspondante	; (5,3)
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (5,4)
			add cx, 1
			int 10h 			; interruption correspondante	; (5,5)
		pop cx
	; ligne 6
		add dx, 1
		push cx
			add cx, 1
			mov al, LColor
			int 10h 			; interruption correspondante	; (6,1)
			add cx, 1
			mov al, _LGREEN_
			int 10h 			; interruption correspondante	; (6,2)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (6,3)
			add cx, 1
			mov al, _LGREEN_
			int 10h 			; interruption correspondante	; (6,4)
			add cx, 1
			mov al, _GREEN_
			int 10h 			; interruption correspondante	; (6,5)
			add cx, 1
			mov al, NColor
			int 10h 			; interruption correspondante	; (6,6)
		pop cx
	; ligne 7
		add dx, 1
		push cx
			add cx, 1
			mov al, _BROWN_
			int 10h 			; interruption correspondante	; (7,1)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,2)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,3)
			add cx, 2
			mov al, _PURPLE_
			int 10h 			; interruption correspondante	; (7,5)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,6)
			add cx, 1
			int 10h 			; interruption correspondante	; (7,7)
		pop cx
ENDM

; DrawPLAYERTEMPLATE MACRO LColor, NColor      ; LIGHT color and Normal color
	; mov cx, PLAYER		; x coordinate
	; mov dx, PLAYER+2	; y coordinate
	; mov ah, 0ch			; procedure pour pixel
	; mov bh, 1    		; page no - critical while animating

	; ; ligne 0
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (0,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (0,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (0,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (0,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (0,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (0,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (0,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (0,7)
	; 	pop cx
	; ; ligne 1
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (1,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (1,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (1,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (1,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (1,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (1,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (1,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (1,7)
	; 	pop cx
	; ; ligne 2
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (2,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (2,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (2,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (2,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (2,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (2,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (2,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (2,7)
	; 	pop cx
	; ; ligne 3
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (3,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (3,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (3,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (3,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (3,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (3,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (3,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (3,7)
	; 	pop cx
	; ; ligne 4
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (4,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (4,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (4,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (4,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (4,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (4,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (4,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (4,7)
	; 	pop cx
	; ; ligne 5
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (5,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (5,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (5,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (5,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (5,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (5,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (5,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (5,7)
	; 	pop cx
	; ; ligne 6
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (6,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (6,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (6,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (6,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (6,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (6,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (6,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (6,7)
	; 	pop cx
	; ; ligne 7
	; 	add dx, 1
	; 	push cx
	; 		mov al, LColor
	; 		int 10h 			; interruption correspondante	; (7,0)
	; 		add cx, 1
	; 		mov al, _BLUE_
	; 		int 10h 			; interruption correspondante	; (7,1)
	; 		add cx, 1
	; 		mov al, _GREEN_
	; 		int 10h 			; interruption correspondante	; (7,2)
	; 		add cx, 1
	; 		mov al, _CYAN_
	; 		int 10h 			; interruption correspondante	; (7,3)
	; 		add cx, 1
	; 		mov al, _RED_
	; 		int 10h 			; interruption correspondante	; (7,4)
	; 		add cx, 1
	; 		mov al, _MAGENTA_
	; 		int 10h 			; interruption correspondante	; (7,5)
	; 		add cx, 1
	; 		mov al, _BROWN_
	; 		int 10h 			; interruption correspondante	; (7,6)
	; 		add cx, 1
	; 		mov al, _WHITE_
	; 		int 10h 			; interruption correspondante	; (7,7)
	; 	pop cx
; ENDM

