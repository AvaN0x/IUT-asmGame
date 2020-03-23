;  __ _                                            _                
; / _(_)_ __ ___  _ __  ___  ___  _ __   ___/\   /(_)_ __ _   _ ___ 
; \ \| | '_ ` _ \| '_ \/ __|/ _ \| '_ \ / _ \ \ / / | '__| | | / __|
; _\ \ | | | | | | |_) \__ \ (_) | | | | (_) \ V /| | |  | |_| \__ \
; \__/_|_| |_| |_| .__/|___/\___/|_| |_|\___/ \_/ |_|_|   \__,_|___/
;                |_|                                                
; By Clément RICATTE & Valentin Azancoth
; -> github.com/AvaN0x
; -> github.com/Valaaz

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
			int 10h				; (0-3)
		pop dx
		; colonne 1
		add cx, 1
		push dx
			add  dx, 1
			mov al, 080h
			int 10h				; (1-1)
			add  dx, 1
			int 10h				; (1-2)
			add  dx, 1
			mov al, 06Dh
			int 10h				; (1-3)
			add  dx, 1
			int 10h				; (1-4)
		pop dx
		; colonne 2
		add cx, 1
		push dx
			add  dx, 2
			mov al, 080h
			int 10h				; (2-2)
			add  dx, 1
			int 10h				; (2-3)
			add  dx, 1
			int 10h				; (2-4)
			add  dx, 1
			int 10h				; (2-5)
			add  dx, 1
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
			int 10h				; (4-4)
			add  dx, 1
			int 10h				; (4-5)
			add  dx, 1
			int 10h				; (4-6)
		pop dx
		; colonne 5
		add cx, 1
		push dx
			add  dx, 2
			mov al, 081h
			int 10h				; (5-2)
			add  dx, 1
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
			int 10h				; (2-2)
			add  dx, 1
			int 10h				; (2-3)
			add  dx, 1
			int 10h				; (2-4)
			add  dx, 1
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
			int 10h				; (4-3)
			add  dx, 1
			int 10h				; (4-4)
			add  dx, 1
			int 10h				; (4-5)
		pop dx
		; colonne 5
		add cx, 1
		push dx
			add  dx, 1
			mov al, 081h
			int 10h				; (5-1)
			add  dx, 1
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
	local drawHomer1, drawHomerINC, allowedDrawHomerINC, drawHomerEND

	mov cx, homer
	mov dx, homer+2
	mov ah, 0ch
	mov bh, 1

	cmp Homer+14, 7
	jg drawHomer1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 5
		mov al, 01Eh
		int 10h				; (0-5)
		add  dx, 1
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
		int 10h				; (1-2)
		add  dx, 1
		int 10h				; (1-3)
		add  dx, 1
		int 10h				; (1-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (1-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (1-6)
		add  dx, 1
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (2-0)
		add  dx, 1
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (3-0)
		add  dx, 1
		int 10h				; (3-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (3-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		int 10h				; (4-1)
		add  dx, 1
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
		add  dx, 1
		mov al, 0DFh
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
		mov al, 059h
		int 10h				; (5-3)
		add  dx, 1
		mov al, 006h
		int 10h				; (5-4)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-6)
		add  dx, 1
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (6-6)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 5
		mov al, 028h
		int 10h				; (7-5)
		add  dx, 1
		mov al, 070h
		int 10h				; (7-6)
	pop  dx

	jmp drawHomerINC

	drawHomer1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 5
		mov al, 01Eh
		int 10h				; (0-5)
		add  dx, 1
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
		int 10h				; (1-2)
		add  dx, 1
		int 10h				; (1-3)
		add  dx, 1
		int 10h				; (1-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (1-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (1-6)
		add  dx, 1
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (2-0)
		add  dx, 1
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (3-0)
		add  dx, 1
		int 10h				; (3-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (3-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		int 10h				; (4-1)
		add  dx, 1
		int 10h				; (4-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-3)
		add  dx, 1
		int 10h				; (4-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (4-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (4-6)
		add  dx, 1
		mov al, 0DFh
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
		mov al, 059h
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
		int 10h				; (5-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-6)
		add  dx, 1
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 4
		mov al, 028h
		int 10h				; (6-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (6-5)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 5
		mov al, 070h
		int 10h				; (7-5)
	pop  dx

	drawHomerINC:
		cmp Homer+14, 30					; si on est pas a la limite
		jne allowedDrawHomerINC		; on peut incrémenter
		mov Homer+14, 0					; sinon on remet a 0
		jmp drawHomerEND
		
		allowedDrawHomerINC:
		inc Homer+14 		; incremente

	drawHomerEND:
ENDM

DrawMarge MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawMarge1, drawMargeINC, allowedDrawMargeINC, drawMargeEND

	mov cx, marge
	mov dx, marge+2
	mov ah, 0ch
	mov bh, 1

	cmp Marge+14, 11
	jg drawMarge1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 035h
		int 10h				; (0-1)
		add  dx, 1
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
		int 10h				; (1-1)
		add  dx, 1
		int 10h				; (1-2)
		add  dx, 1
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
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-3)
		add  dx, 2
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
		int 10h				; (3-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
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
		int 10h				; (4-4)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
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

	jmp drawMargeINC

	drawMarge1:

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
		add  dx, 3
		mov al, LColor
		int 10h				; (1-3)
		add  dx, 2
		int 10h				; (1-5)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
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
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
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
		int 10h				; (4-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-2)
		add  dx, 1
		int 10h				; (4-3)
		add  dx, 1
		int 10h				; (4-4)
		add  dx, 1
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
		mov al, 035h
		int 10h				; (5-0)
		add  dx, 1
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 2
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
		mov al, 035h
		int 10h				; (6-0)
		add  dx, 1
		int 10h				; (6-1)
		add  dx, 1
		int 10h				; (6-2)
		add  dx, 1
		int 10h				; (6-3)
		add  dx, 3
		mov al, NColor
		int 10h				; (6-6)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 1
		mov al, 035h
		int 10h				; (7-1)
		add  dx, 1
		int 10h				; (7-2)
	pop  dx

	drawMargeINC:
		cmp Marge+14, 32					; si on est pas a la limite
		jne allowedDrawMargeINC		; on peut incrémenter
		mov Marge+14, 0					; sinon on remet a 0
		jmp drawMargeEND
		
		allowedDrawMargeINC:
		inc Marge+14 		; incremente

	drawMargeEND:
ENDM

DrawBart MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawBart1, drawBartINC, allowedDrawBartINC, drawBartEND

	mov cx, Bart
	mov dx, Bart+2
	mov ah, 0ch
	mov bh, 1

	cmp Bart+14, 3
	jg drawBart1

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
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
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
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
		add  dx, 1
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
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
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (7-6)
	pop  dx

	jmp drawBartINC

	drawBart1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 3
		mov al, NColor
		int 10h				; (0-3)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 4
		mov al, 027h
		int 10h				; (1-4)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (2-0)
		add  dx, 1
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
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
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (3-6)
		add  dx, 1
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
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
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 4
		mov al, NColor
		int 10h				; (7-4)
	pop  dx

	drawBartINC:
		cmp Bart+14, 8					; si on est pas a la limite
		jne allowedDrawBartINC		; on peut incrémenter
		mov Bart+14, 0					; sinon on remet a 0
		jmp drawBartEND
		
		allowedDrawBartINC:
		inc Bart+14 		; incremente

	drawBartEND:
ENDM

DrawLisa MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawLisa1, drawLisaINC, allowedDrawLisaINC, drawLisaEND

	mov cx, lisa
	mov dx, lisa+2
	mov ah, 0ch
	mov bh, 1

	cmp Lisa+14, 7
	jg drawLisa1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (0-2)
		add  dx, 4
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (1-1)
		add  dx, 1
		int 10h				; (1-2)
		add  dx, 1
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
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-5)
		add  dx, 1
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
		int 10h				; (3-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-5)
		add  dx, 1
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
		int 10h				; (4-1)
		add  dx, 1
		int 10h				; (4-2)
		add  dx, 1
		int 10h				; (4-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (4-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-5)
		add  dx, 1
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

	jmp drawLisaINC

	DrawLisa1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (0-2)
		add  dx, 3
		int 10h				; (0-5)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (1-1)
		add  dx, 1
		mov al, 000h
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
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-5)
		add  dx, 1
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
		int 10h				; (3-4)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-5)
		add  dx, 1
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
		int 10h				; (4-1)
		add  dx, 1
		int 10h				; (4-2)
		add  dx, 1
		int 10h				; (4-3)
		add  dx, 1
		int 10h				; (4-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-5)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 3
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

	drawLisaINC:
		cmp Lisa+14, 16					; si on est pas a la limite
		jne allowedDrawLisaINC		; on peut incrémenter
		mov Lisa+14, 0					; sinon on remet a 0
		jmp drawLisaEND
		
		allowedDrawLisaINC:
		inc Lisa+14 		; incremente

	drawLisaEND:
ENDM

DrawMaggie MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawMaggie1, drawMaggieINC, allowedDrawMaggieINC, drawMaggieEND

	mov cx, maggie
	mov dx, maggie+2
	mov ah, 0ch
	mov bh, 1

	cmp Maggie+14, 3
	jg drawMaggie1

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
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
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
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-4)
		add  dx, 1
		int 10h				; (5-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-6)
		add  dx, 1
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
		int 10h				; (6-5)
		add  dx, 2
		mov al, NColor
		int 10h				; (6-7)
	pop dx

	jmp drawMaggieINC

	drawMaggie1:

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
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 035h
		int 10h				; (2-6)
		add  dx, 1
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
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
		int 10h				; (5-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-6)
		add  dx, 1
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
		int 10h				; (6-5)
		add  dx, 2
		mov al, NColor
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 4
		mov al, 027h
		int 10h				; (7-4)
		add  dx, 1
		int 10h				; (7-5)
	pop  dx

	drawMaggieINC:
		cmp Maggie+14, 8					; si on est pas a la limite
		jne allowedDrawMaggieINC		; on peut incrémenter
		mov Maggie+14, 0					; sinon on remet a 0
		jmp drawMaggieEND
		
		allowedDrawMaggieINC:
		inc Maggie+14 		; incremente

	drawMaggieEND:
ENDM

DrawBarney MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawBarney1, drawBarneyINC, allowedDrawBarneyINC, drawBarneyEND

	mov cx, barney
	mov dx, barney+2
	mov ah, 0ch
	mov bh, 1

	cmp Barney+14, 7
	jg drawBarney1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 006h
		int 10h				; (0-1)
		add  dx, 1
		int 10h				; (0-2)
		add  dx, 2
		mov al, 03Eh
		int 10h				; (0-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (0-5)
		add  dx, 1
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (1-0)
		add  dx, 1
		int 10h				; (1-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-2)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (1-3)
		add  dx, 1
		int 10h				; (1-4)
		add  dx, 1
		int 10h				; (1-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-6)
		add  dx, 1
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (2-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (2-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-6)
		add  dx, 1
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (3-0)
		add  dx, 2
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
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
		int 10h				; (4-2)
		add  dx, 1
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
		add  dx, 1
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, NColor
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
		int 10h				; (5-7)
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
		add  dx, 5
		mov al, 028h
		int 10h				; (7-5)
		add  dx, 1
		mov al, 070h
		int 10h				; (7-6)
	pop  dx

	jmp drawBarneyINC

	drawBarney1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 006h
		int 10h				; (0-1)
		add  dx, 1
		int 10h				; (0-2)
		add  dx, 2
		mov al, 03Eh
		int 10h				; (0-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (0-5)
		add  dx, 1
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (1-0)
		add  dx, 1
		int 10h				; (1-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-2)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (1-3)
		add  dx, 1
		int 10h				; (1-4)
		add  dx, 1
		int 10h				; (1-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-6)
		add  dx, 1
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (2-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (2-4)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-5)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (2-6)
		add  dx, 1
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (3-0)
		add  dx, 2
		mov al, LColor
		int 10h				; (3-2)
		add  dx, 1
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
		int 10h				; (4-2)
		add  dx, 1
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
		add  dx, 1
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (5-2)
		add  dx, 1
		mov al, NColor
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
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 2
		mov al, LColor
		int 10h				; (6-2)
		add  dx, 1
		mov al, 028h
		int 10h				; (6-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (6-4)
		add  dx, 1
		int 10h				; (6-5)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 4
		mov al, 070h
		int 10h				; (7-4)
	pop  dx

	drawBarneyINC:
		cmp Barney+14, 40					; si on est pas a la limite
		jne allowedDrawBarneyINC		; on peut incrémenter
		mov Barney+14, 0					; sinon on remet a 0
		jmp drawBarneyEND
		
		allowedDrawBarneyINC:
		inc Barney+14 		; incremente

	drawBarneyEND:
ENDM

DrawFlanders MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawFlanders1, drawFlandersINC, allowedDrawFlandersINC, drawFlandersEND

	mov cx, Flanders
	mov dx, Flanders+2
	mov ah, 0ch
	mov bh, 1

	cmp Flanders+14, 7
	jg drawFlanders1

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
		int 10h				; (2-1)
		add  dx, 1
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
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
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

	jmp drawFlandersINC

	drawFlanders1:

	; colonne 0
	add cx, 1
	push dx
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 6
		mov al, NColor
		int 10h				; (1-6)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (2-0)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (2-2)
		add  dx, 1
		mov al, 006h
		int 10h				; (2-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-4)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (2-5)
		add  dx, 1
		mov al, 07Bh
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
		int 10h				; (3-2)
		add  dx, 1
		mov al, 006h
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, 006h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 07Bh
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
		mov al, 03Eh
		int 10h				; (5-5)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (5-6)
		add  dx, 1
		mov al, 008h
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		mov al, 006h
		int 10h				; (6-0)
		add  dx, 1
		int 10h				; (6-1)
		add  dx, 1
		mov al, 006h
		int 10h				; (6-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (6-3)
		add  dx, 1
		mov al, 006h
		int 10h				; (6-4)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (6-5)
		add  dx, 1
		int 10h				; (6-6)
		add  dx, 1
		mov al, 008h
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 5
		mov al, 07Bh
		int 10h				; (7-5)
		add  dx, 1
		mov al, LColor
		int 10h				; (7-6)
	pop  dx

	drawFlandersINC:
		cmp Flanders+14, 16					; si on est pas a la limite
		jne allowedDrawFlandersINC		; on peut incrémenter
		mov Flanders+14, 0					; sinon on remet a 0
		jmp drawFlandersEND
		
		allowedDrawFlandersINC:
		inc Flanders+14 		; incremente

	drawFlandersEND:
ENDM

DrawApu MACRO NColor      ; Normal color
	local drawApu1, drawApuINC, allowedDrawApuINC, drawApuEND

	mov cx, apu
	mov dx, apu+2
	mov ah, 0ch
	mov bh, 1

	cmp Apu+14, 11
	jg drawApu1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 0DFh
		int 10h				; (0-1)
		add  dx, 1
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
		int 10h				; (1-1)
		add  dx, 1
		int 10h				; (1-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-3)
		add  dx, 2
		mov al, 07Bh
		int 10h				; (1-5)
		add  dx, 1
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
		int 10h				; (2-2)
		add  dx, 1
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
		int 10h				; (3-2)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
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
		int 10h				; (7-1)
		add  dx, 5
		mov al, NColor
		int 10h				; (7-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (7-7)
	pop  dx

	jmp drawApuINC

	drawApu1:

	; colonne 0
	add cx, 1
	push dx
		mov al, 0DFh
		int 10h				; (0-0)
		add  dx, 1
		int 10h				; (0-1)
		add  dx, 5
		mov al, NColor
		int 10h				; (0-6)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		mov al, 0DFh
		int 10h				; (1-0)
		add  dx, 1
		int 10h				; (1-1)
		add  dx, 2
		mov al, NColor
		int 10h				; (1-3)
		add  dx, 3
		mov al, 02Bh
		int 10h				; (1-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, 0DFh
		int 10h				; (2-0)
		add  dx, 1
		mov al, NColor
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 02Ch
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
		mov al, 000h
		int 10h				; (3-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, 086h
		int 10h				; (3-5)
		add  dx, 1
		mov al, 02Ch
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
		int 10h				; (4-2)
		add  dx, 1
		int 10h				; (4-3)
		add  dx, 1
		mov al, 086h
		int 10h				; (4-4)
		add  dx, 2
		mov al, 02Bh
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-1)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-2)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (5-3)
		add  dx, 3
		mov al, 07Bh
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
		int 10h				; (6-1)
		add  dx, 1
		int 10h				; (6-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (6-3)
		add  dx, 2
		mov al, 07Bh
		int 10h				; (6-5)
		add  dx, 1
		int 10h				; (6-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 1
		mov al, 0DFh
		int 10h				; (7-1)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (7-2)
		add  dx, 3
		mov al, 07Bh
		int 10h				; (7-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (7-6)
		add  dx, 1
		mov al, 0DFh
		int 10h				; (7-7)
	pop  dx

	drawApuINC:
		cmp Apu+14, 24					; si on est pas a la limite
		jne allowedDrawApuINC		; on peut incrémenter
		mov Apu+14, 0					; sinon on remet a 0
		jmp drawApuEND
		
		allowedDrawApuINC:
		inc Apu+14 		; incremente

	drawApuEND:
ENDM

DrawPetitPapaNoel MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawPetitPapaNoel1, drawPetitPapaNoelINC, allowedDrawPetitPapaNoelINC, drawPetitPapaNoelEND

	mov cx, PetitPapaNoel
	mov dx, PetitPapaNoel+2
	mov ah, 0ch
	mov bh, 1

	cmp PetitPapaNoel+14, 64
	jg drawPetitPapaNoel1

	; colonne 0
	add cx, 1
	push dx
		add  dx, 6
		mov al, LColor
		int 10h				; (0-6)
		add  dx, 1
		int 10h				; (0-7)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (1-1)
		add  dx, 4
		int 10h				; (1-5)
		add  dx, 1
		int 10h				; (1-6)
		add  dx, 1
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (2-0)
		add  dx, 4
		int 10h				; (2-4)
		add  dx, 1
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
		int 10h				; (3-1)
		add  dx, 1
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-5)
		add  dx, 1
		int 10h				; (3-6)
		add  dx, 1
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
		int 10h				; (4-5)
		add  dx, 1
		int 10h				; (4-6)
		add  dx, 1
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (5-0)
		add  dx, 1
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-4)
		add  dx, 1
		int 10h				; (5-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-6)
		add  dx, 1
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

	jmp drawPetitPapaNoelINC

	drawPetitPapaNoel1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 6
		mov al, LColor
		int 10h				; (0-6)
		add  dx, 1
		int 10h				; (0-7)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 2
		mov al, 0DFh
		int 10h				; (1-2)
		add  dx, 3
		mov al, LColor
		int 10h				; (1-5)
		add  dx, 1
		int 10h				; (1-6)
		add  dx, 1
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, 00Fh
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 2
		int 10h				; (2-4)
		add  dx, 1
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
		int 10h				; (3-1)
		add  dx, 1
		int 10h				; (3-2)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-4)
		add  dx, 1
		mov al, NColor
		int 10h				; (3-5)
		add  dx, 1
		int 10h				; (3-6)
		add  dx, 1
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		mov al, 00Fh
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
		int 10h				; (4-5)
		add  dx, 1
		int 10h				; (4-6)
		add  dx, 1
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (5-0)
		add  dx, 1
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
		int 10h				; (5-5)
		add  dx, 1
		mov al, NColor
		int 10h				; (5-6)
		add  dx, 1
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (6-0)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (7-1)
	pop  dx

	drawPetitPapaNoelINC:
		cmp PetitPapaNoel+14, 70					; si on est pas a la limite
		jne allowedDrawPetitPapaNoelINC		; on peut incrémenter
		mov PetitPapaNoel+14, 0					; sinon on remet a 0
		jmp drawPetitPapaNoelEND
		
		allowedDrawPetitPapaNoelINC:
		inc PetitPapaNoel+14 		; incremente

	drawPetitPapaNoelEND:
ENDM

DrawBouleDeNeige MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawBouleDeNeige1, drawBouleDeNeigeINC, allowedDrawBouleDeNeigeINC, drawBouleDeNeigeEND

	mov cx, bouledeneige
	mov dx, bouledeneige+2
	mov ah, 0ch
	mov bh, 1

	cmp BouleDeNeige+14, 7
	jg drawBouleDeNeige1

	; colonne 0
	add cx, 1
	push dx
		mov al, NColor
		int 10h				; (0-0)
		add  dx, 3
		int 10h				; (0-3)
		add  dx, 1
		int 10h				; (0-4)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, NColor
		int 10h				; (1-1)
		add  dx, 1
		int 10h				; (1-2)
		add  dx, 2
		mov al, LColor
		int 10h				; (1-4)
		add  dx, 1
		int 10h				; (1-5)
		add  dx, 1
		int 10h				; (1-6)
		add  dx, 1
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
		int 10h				; (2-6)
		add  dx, 1
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
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
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
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

	jmp drawBouleDeNeigeINC

	drawBouleDeNeige1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, NColor
		int 10h				; (0-1)
		add  dx, 1
		int 10h				; (0-2)
		add  dx, 2
		int 10h				; (0-4)
	pop dx
	; colonne 1
	add cx, 1
	push dx

		mov al, NColor
		int 10h				; (1-0)
		add  dx, 3
		int 10h				; (1-3)
		add  dx, 1
		mov al, LColor
		int 10h				; (1-4)
		add  dx, 1
		int 10h				; (1-5)
		add  dx, 1
		int 10h				; (1-6)
		add  dx, 1
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
		int 10h				; (2-6)
		add  dx, 1
		int 10h				; (2-7)
	pop dx
	; colonne 3
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (3-1)
		add  dx, 1
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
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
		int 10h				; (4-7)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 2
		int 10h				; (5-6)
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
		add  dx, 2
		mov al, NColor
		int 10h				; (6-6)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 4
		mov al, LColor
		int 10h				; (7-4)
	pop  dx

	drawBouleDeNeigeINC:
		cmp BouleDeNeige+14, 16					; si on est pas a la limite
		jne allowedDrawBouleDeNeigeINC		; on peut incrémenter
		mov BouleDeNeige+14, 0					; sinon on remet a 0
		jmp drawBouleDeNeigeEND
		
		allowedDrawBouleDeNeigeINC:
		inc BouleDeNeige+14 		; incremente

	drawBouleDeNeigeEND:
ENDM

DrawKrusty MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawKrusty1, drawKrustyINC, allowedDrawKrustyINC, drawKrustyEND

	mov cx, krusty
	mov dx, krusty+2
	mov ah, 0ch
	mov bh, 1

	cmp Krusty+14, 5
	jg drawKrusty1

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
		int 10h				; (1-3)
		add  dx, 1
		mov al, NColor
		int 10h				; (1-4)
		add  dx, 1
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
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
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
		int 10h				; (4-2)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-4)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		int 10h				; (5-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-4)
		add  dx, 1
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

	jmp drawKrustyINC

	drawKrusty1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 07Bh
		int 10h				; (0-1)
		add  dx, 4
		mov al, 01Eh
		int 10h				; (0-5)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		add  dx, 1
		mov al, 07Bh
		int 10h				; (1-1)
		add  dx, 1
		int 10h				; (1-2)
		add  dx, 2
		mov al, NColor
		int 10h				; (1-4)
		add  dx, 1
		int 10h				; (1-5)
		add  dx, 2
		mov al, 027h
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		add  dx, 1
		mov al, 07Bh
		int 10h				; (2-1)
		add  dx, 1
		mov al, LColor
		int 10h				; (2-2)
		add  dx, 1
		mov al, 018h
		int 10h				; (2-3)
		add  dx, 1
		int 10h				; (2-4)
		add  dx, 1
		mov al, 031h
		int 10h				; (2-5)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-6)
		add  dx, 1
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
		int 10h				; (3-2)
		add  dx, 1
		int 10h				; (3-3)
		add  dx, 1
		mov al, 018h
		int 10h				; (3-4)
		add  dx, 1
		mov al, 031h
		int 10h				; (3-5)
		add  dx, 1
		int 10h				; (3-6)
		add  dx, 1
		mov al, 027h
		int 10h				; (3-7)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, LColor
		int 10h				; (4-0)
		add  dx, 1
		int 10h				; (4-1)
		add  dx, 1
		mov al, 000h
		int 10h				; (4-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (4-3)
		add  dx, 1
		mov al, 059h
		int 10h				; (4-4)
		add  dx, 1
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
		int 10h				; (5-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (5-5)
		add  dx, 1
		int 10h				; (5-6)
		add  dx, 1
		mov al, 086h
		int 10h				; (5-7)
	pop dx
	; colonne 6
	add cx, 1
	push dx
		add  dx, 1
		mov al, LColor
		int 10h				; (6-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (6-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (6-3)
		add  dx, 1
		int 10h				; (6-4)
		add  dx, 1
		mov al, 07Bh
		int 10h				; (6-5)
		add  dx, 1
		mov al, 086h
		int 10h				; (6-6)
		add  dx, 1
		int 10h				; (6-7)
	pop dx
	; colonne 7
	add cx, 1
	push dx
		add  dx, 1
		mov al, 07Bh
		int 10h				; (7-1)
		add  dx, 1
		int 10h				; (7-2)
		add  dx, 1
		mov al, 059h
		int 10h				; (7-3)
		add  dx, 1
		mov al, 006h
		int 10h				; (7-4)
		add  dx, 1
		mov al, 018h
		int 10h				; (7-5)
		add  dx, 2
		mov al, 086h
		int 10h				; (7-7)
	pop  dx

	drawKrustyINC:
		cmp Krusty+14, 12					; si on est pas a la limite
		jne allowedDrawKrustyINC		; on peut incrémenter
		mov Krusty+14, 0					; sinon on remet a 0
		jmp drawKrustyEND
		
		allowedDrawKrustyINC:
		inc Krusty+14 		; incremente

	drawKrustyEND:
ENDM

DrawTahitiBob MACRO LColor, NColor      ; LIGHT color and Normal color
	local drawTahitiBob1, drawTahitiBobINC, allowedDrawTahitiBobINC, drawTahitiBobEND

	mov cx, tahitibob
	mov dx, tahitibob+2
	mov ah, 0ch
	mov bh, 1

	cmp TahitiBob+14, 4
	jg drawTahitiBob1

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
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
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
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
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
		int 10h				; (7-3)
		add  dx, 4
		int 10h				; (7-7)
	pop  dx

	jmp drawTahitiBobINC

	drawTahitiBob1:

	; colonne 0
	add cx, 1
	push dx
		add  dx, 1
		mov al, 086h
		int 10h				; (0-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (0-2)
		add  dx, 1
		int 10h				; (0-3)
	pop dx
	; colonne 1
	add cx, 1
	push dx
		mov al, 027h
		int 10h				; (1-0)
		add  dx, 1
		int 10h				; (1-1)
		add  dx, 1
		int 10h				; (1-2)
		add  dx, 1
		int 10h				; (1-3)
		add  dx, 2
		mov al, LColor
		int 10h				; (1-5)
		add  dx, 2
		mov al, 006h
		int 10h				; (1-7)
	pop dx
	; colonne 2
	add cx, 1
	push dx
		mov al, 086h
		int 10h				; (2-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (2-1)
		add  dx, 1
		int 10h				; (2-2)
		add  dx, 1
		mov al, 086h
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
		mov al, 027h
		int 10h				; (3-0)
		add  dx, 1
		int 10h				; (3-1)
		add  dx, 1
		int 10h				; (3-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (3-3)
		add  dx, 1
		int 10h				; (3-4)
		add  dx, 1
		mov al, 01Eh
		int 10h				; (3-5)
		add  dx, 1
		mov al, 006h
		int 10h				; (3-6)
	pop dx
	; colonne 4
	add cx, 1
	push dx
		mov al, 027h
		int 10h				; (4-0)
		add  dx, 1
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
		int 10h				; (4-5)
		add  dx, 1
		mov al, 031h
		int 10h				; (4-6)
	pop dx
	; colonne 5
	add cx, 1
	push dx
		mov al, 086h
		int 10h				; (5-0)
		add  dx, 1
		mov al, 027h
		int 10h				; (5-1)
		add  dx, 1
		int 10h				; (5-2)
		add  dx, 1
		mov al, LColor
		int 10h				; (5-3)
		add  dx, 1
		int 10h				; (5-4)
		add  dx, 1
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
		mov al, 027h
		int 10h				; (6-0)
		add  dx, 1
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
		mov al, 086h
		int 10h				; (7-1)
		add  dx, 1
		mov al, 027h
		int 10h				; (7-2)
		add  dx, 1
		int 10h				; (7-3)
		add  dx, 2
		mov al, NColor
		int 10h				; (7-5)
		add  dx, 1
		mov al, 086h
		int 10h				; (7-6)
	pop  dx

	drawTahitiBobINC:
		cmp TahitiBob+14, 10					; si on est pas a la limite
		jne allowedDrawTahitiBobINC		; on peut incrémenter
		mov TahitiBob+14, 0					; sinon on remet a 0
		jmp drawTahitiBobEND
		
		allowedDrawTahitiBobINC:
		inc TahitiBob+14 		; incremente

	drawTahitiBobEND:
ENDM


