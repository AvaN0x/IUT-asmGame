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
	mov cx, homer
	mov dx, homer+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 6
		mov al, LColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 5
		mov al, 01Eh
		int 10h				; (1-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-6)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (3-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (3-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (4-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (5-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (5-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (5-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (6-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (6-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (6-3)
		add  dx, 1
		mov al, 006h
		int 10h				; (6-4)
		add  dx, 1
		mov al, 059h
		int 10h				; (6-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (7-6)
	pop  dx
ENDM

DrawMarge MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, marge
	mov dx, marge+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 035h
		int 10h				; (0-1)
		add  dx, 1
		mov al, 035h
		int 10h				; (0-2)
		add  dx, 4
		mov al, LColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx

		mov al, 035h
		int 10h				; (1-0)
		add  dx, 1
		mov al, 035h
		int 10h				; (1-1)
		add  dx, 1
		mov al, 035h
		int 10h				; (1-2)
		add  dx, 1
		mov al, 035h
		int 10h				; (1-3)
		add  dx, 2
		mov al, LColor
		int 10h				; (1-5)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, 035h
		int 10h				; (2-0)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-1)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 2
		mov al, LColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (2-6)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, 035h
		int 10h				; (3-0)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (3-6)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, 035h
		int 10h				; (4-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (4-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 3
		mov al, LColor
		int 10h				; (6-3)
		add  dx, 2
		mov al, NColor
		int 10h				; (6-5)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (7-6)
	pop  dx
ENDM

DrawBart MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, bart
	mov dx, bart+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 5
		mov al, 027h
		int 10h				; (1-5)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (2-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, NColor
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (4-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, NColor
		int 10h				; (5-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (5-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (6-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (6-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-3)
		add  dx, 2
		mov al, 086h
		int 10h				; (6-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (7-6)
	pop  dx
ENDM

DrawLisa MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, lisa
	mov dx, lisa+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (0-2)
		add  dx, 4
		mov al, LColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (1-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-3)
		add  dx, 3
		mov al, 027h
		int 10h				; (1-6)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (2-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-6)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, NColor
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-6)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-5)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-6)
		add  dx, 1
		mov al, 006h
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 2
		mov al, NColor
		int 10h				; (5-5)
		add  dx, 1
		mov al, 086h
		int 10h				; (5-6)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 4
		mov al, NColor
		int 10h				; (6-6)
	pop dx
	; colonne 7
	add cx, 1
	push dx
	pop  dx
ENDM

DrawMaggie MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, maggie
	mov dx, maggie+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 7
		mov al, 035h
		int 10h				; (0-7)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (1-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-4)
		add  dx, 2
		mov al, 035h
		int 10h				; (1-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		add  dx, 1
		mov al, 035h
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		add  dx, 1
		mov al, 035h
		int 10h				; (4-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (4-6)
		add  dx, 1
		mov al, 035h
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 2
		mov al, 027h
		int 10h				; (6-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (6-5)
		add  dx, 2
		mov al, NColor
		int 10h				; (6-7)
	pop dx
ENDM

DrawBarney MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, barney
	mov dx, barney+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 4
		mov al, 03Eh
		int 10h				; (0-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (0-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, 006h
		int 10h				; (1-1)
		add  dx, 1
		mov al, 006h
		int 10h				; (1-2)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (1-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (1-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (2-0)
		add  dx, 1
		mov al, 006h
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (2-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (2-4)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (2-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (3-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (3-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (4-0)
		add  dx, 2
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (4-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (5-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (5-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (6-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (6-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (7-2)
		add  dx, 4
		mov al, NColor
		int 10h				; (7-6)
	pop  dx
ENDM

DrawFlanders MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, Flanders
	mov dx, Flanders+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 5
		mov al, 07Bh
		int 10h				; (1-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-6)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (2-0)
		add  dx, 1
		mov al, 006h
		int 10h				; (2-1)
		add  dx, 1
		mov al, 006h
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 1
		mov al, 006h
		int 10h				; (2-4)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (2-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (2-6)
		add  dx, 1
		mov al, 008h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (3-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (3-6)
		add  dx, 1
		mov al, 008h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (4-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, 006h
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (4-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (5-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, 006h
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 1
		mov al, 006h
		int 10h				; (5-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx

		mov al, 006h
		int 10h				; (6-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (6-2)
		add  dx, 1
		mov al, 006h
		int 10h				; (6-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-4)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (6-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (6-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (7-6)
	pop  dx
ENDM

DrawApu MACRO NColor      ; LIGHT color and Normal color
	mov cx, apu
	mov dx, apu+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 0DFh
		int 10h				; (0-1)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (0-2)
		add  dx, 3
		mov al, 07Bh
		int 10h				; (0-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx

		mov al, 0DFh
		int 10h				; (1-0)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-1)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-3)
		add  dx, 2
		mov al, 07Bh
		int 10h				; (1-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (1-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-1)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-2)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-3)
		add  dx, 3
		mov al, 07Bh
		int 10h				; (2-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, 0DFh
		int 10h				; (3-0)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, 086h
		int 10h				; (3-4)
		add  dx, 2
		mov al, 02Bh
		int 10h				; (3-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, 0DFh
		int 10h				; (4-0)
		add  dx, 1
		mov al, NColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-5)
		add  dx, 1
		mov al, 02Ch
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, 0DFh
		int 10h				; (5-0)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (5-5)
		add  dx, 1
		mov al, 02Ch
		int 10h				; (5-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx

		mov al, 0DFh
		int 10h				; (6-0)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-1)
		add  dx, 2
		mov al, NColor
		int 10h				; (6-3)
		add  dx, 3
		mov al, 02Bh
		int 10h				; (6-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx

		mov al, 0DFh
		int 10h				; (7-0)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (7-1)
		add  dx, 5
		mov al, NColor
		int 10h				; (7-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (7-7)
	pop  dx
ENDM

DrawPetitPapaNoel MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, PetitPapaNoel
	mov dx, PetitPapaNoel+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 6
		mov al, LColor
		int 10h				; (0-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (0-7)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (1-1)
		add  dx, 4
		mov al, LColor
		int 10h				; (1-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (2-0)
		add  dx, 4
		mov al, LColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-6)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, LColor
		int 10h				; (5-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-6)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 1
		mov al, 000h
		int 10h				; (6-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-2)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 2
		mov al, 0DFh
		int 10h				; (7-2)
	pop  dx
ENDM

DrawBouleDeNeige MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, bouledeneige
	mov dx, bouledeneige+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx

		mov al, NColor
		int 10h				; (0-0)
		add  dx, 3
		mov al, NColor
		int 10h				; (0-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (0-4)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, NColor
		int 10h				; (1-1)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-2)
		add  dx, 2
		mov al, LColor
		int 10h				; (1-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 4
		mov al, 035h
		int 10h				; (2-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-6)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, 02Ch
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, 035h
		int 10h				; (4-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-6)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 3
		mov al, NColor
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 1
		mov al, 02Ch
		int 10h				; (6-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-4)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 4
		mov al, LColor
		int 10h				; (7-4)
	pop  dx
ENDM

DrawKrusty MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, krusty
	mov dx, krusty+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 2
		mov al, 07Bh
		int 10h				; (0-2)
		add  dx, 3
		mov al, NColor
		int 10h				; (0-5)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 2
		mov al, 07Bh
		int 10h				; (1-2)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (1-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-5)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (1-6)
		add  dx, 1
		mov al, 027h
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 2
		mov al, 07Bh
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 1
		mov al, 018h
		int 10h				; (2-4)
		add  dx, 1
		mov al, 018h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (2-6)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, 07Bh
		int 10h				; (3-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 018h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (3-6)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, 07Bh
		int 10h				; (4-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-4)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-4)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 1
		mov al, 027h
		int 10h				; (6-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (6-4)
		add  dx, 1
		mov al, 059h
		int 10h				; (6-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (6-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 2
		mov al, 07Bh
		int 10h				; (7-2)
		add  dx, 2
		mov al, 059h
		int 10h				; (7-4)
		add  dx, 1
		mov al, 006h
		int 10h				; (7-5)
		add  dx, 1
		mov al, 018h
		int 10h				; (7-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (7-7)
	pop  dx
ENDM

DrawTahitiBob MACRO LColor, NColor      ; LIGHT color and Normal color
	mov cx, tahitibob
	mov dx, tahitibob+2
	mov ah, 0ch
	mov bh, 1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 027h
		int 10h				; (0-1)
		add  dx, 1
		mov al, 086h
		int 10h				; (0-2)
		add  dx, 1
		mov al, 027h
		int 10h				; (0-3)
	pop dx
	; colonne 1
	add cx, 1
	push dx

		mov al, 086h
		int 10h				; (1-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (1-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (1-2)
		add  dx, 1
		mov al, 086h
		int 10h				; (1-3)
		add  dx, 3
		mov al, LColor
		int 10h				; (1-6)
		add  dx, 1
		mov al, 006h
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx

		mov al, 027h
		int 10h				; (2-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-2)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-3)
		add  dx, 2
		mov al, LColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (2-6)
		add  dx, 1
		mov al, 006h
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx

		mov al, 086h
		int 10h				; (3-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (3-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (3-6)
		add  dx, 1
		mov al, 006h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx

		mov al, 086h
		int 10h				; (4-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (4-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx

		mov al, 027h
		int 10h				; (5-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx

		mov al, 086h
		int 10h				; (6-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (6-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 1
		mov al, 000h
		int 10h				; (6-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-4)
		add  dx, 2
		mov al, NColor
		int 10h				; (6-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 1
		mov al, 027h
		int 10h				; (7-1)
		add  dx, 1
		mov al, 086h
		int 10h				; (7-2)
		add  dx, 1
		mov al, 086h
		int 10h				; (7-3)
		add  dx, 4
		mov al, 086h
		int 10h				; (7-7)
	pop  dx
ENDM


