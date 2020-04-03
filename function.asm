;  __ _                                            _                
; / _(_)_ __ ___  _ __  ___  ___  _ __   ___/\   /(_)_ __ _   _ ___ 
; \ \| | '_ ` _ \| '_ \/ __|/ _ \| '_ \ / _ \ \ / / | '__| | | / __|
; _\ \ | | | | | | |_) \__ \ (_) | | | | (_) \ V /| | |  | |_| \__ \
; \__/_|_| |_| |_| .__/|___/\___/|_| |_|\___/ \_/ |_|_|   \__,_|___/
;                |_|                                                
; By Clément RICATTE
; -> github.com/AvaN0x


; ---------------------
; Controle du menu
; ---------------------
menuUP:
	cmp MENUSTATE, 0	; si on est pas a la limite
	jne allowedMenuUP			; on peut monter
	mov MENUSTATE, 2	; sinon on va tout en bas
	jmp gameMenu
	
	allowedMenuUP:
	dec MENUSTATE 		; decremente (monte)
jmp gameMenu

menuDOWN:
	cmp MENUSTATE, 2	; si on est pas a la limite
	jne allowedMenuDOWN			; on peut descendre
	mov MENUSTATE, 0	; sinon on va tout en haut
	jmp gameMenu
	
	allowedMenuDOWN:
	inc MENUSTATE 		; incremente (descend)
jmp gameMenu


; ------------------------------------------------------------
; Son lorsqu'un simpson devient malade
; ------------------------------------------------------------
simpsonGetSickSound:
	SOUND 2280, 1	;	C	523.25hz
	SOUND 2031, 1	;	D	587.33hz
ret

; ------------------------------------------------------------
; Verifier si le joueur se trouve a la position d'un simpson
; ------------------------------------------------------------
CheckCase: 
		CheckCaseHomer:				; verification si la case est celle d'Homer
			CMPMEM PLAYER, Homer		; verification de la coordonnée X
			JNE CheckCaseMarge			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Homer+2	; verification de la coordonnée Y
			JNE CheckCaseMarge			; si non égale, on regarde si la case est celle du suivant
			cmp Homer+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseMarge			; si égale, on regarde si la case est celle du suivant
				mov Homer+4, 1					; on passe l'état à malade
				MOVMEM Homer, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Homer+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound
 
		CheckCaseMarge:				; verification si la case est celle de Marge
			CMPMEM PLAYER, Marge		; verification de la coordonnée X
			JNE CheckCaseBart			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Marge+2	; verification de la coordonnée Y
			JNE CheckCaseBart			; si non égale, on regarde si la case est celle du suivant
			cmp Marge+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseBart			; si égale, on regarde si la case est celle du suivant
				mov Marge+4, 1				; on passe l'état à malade
				MOVMEM Marge, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Marge+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseBart:				; verification si la case est celle de Bart
			CMPMEM PLAYER, Bart			; verification de la coordonnée X
			JNE CheckCaseLisa			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Bart+2		; verification de la coordonnée Y
			JNE CheckCaseLisa			; si non égale, on regarde si la case est celle du suivant
			cmp Bart+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseLisa			; si égale, on regarde si la case est celle du suivant
				mov Bart+4, 1				; on passe l'état à malade
				MOVMEM Bart, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Bart+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseLisa:				; verification si la case est celle de Lisa
			CMPMEM PLAYER, Lisa			; verification de la coordonnée X
			JNE CheckCaseMaggie			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Lisa+2		; verification de la coordonnée Y
			JNE CheckCaseMaggie			; si non égale, on regarde si la case est celle du suivant
			cmp Lisa+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseMaggie			; si égale, on regarde si la case est celle du suivant
				mov Lisa+4, 1				; on passe l'état à malade
				MOVMEM Lisa, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Lisa+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseMaggie:			; verification si la case est celle de Maggie
			CMPMEM PLAYER, Maggie		; verification de la coordonnée X
			JNE CheckCaseBarney			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Maggie+2	; verification de la coordonnée Y
			JNE CheckCaseBarney			; si non égale, on regarde si la case est celle du suivant
			cmp Maggie+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseBarney			; si égale, on regarde si la case est celle du suivant
				mov Maggie+4, 1				; on passe l'état à malade
				MOVMEM Maggie, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Maggie+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseBarney:			; verification si la case est celle de Barney
			CMPMEM PLAYER, Barney		; verification de la coordonnée X
			JNE CheckCaseFlanders		; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Barney+2	; verification de la coordonnée Y
			JNE CheckCaseFlanders		; si non égale, on regarde si la case est celle du suivant
			cmp Barney+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseFlanders		; si égale, on regarde si la case est celle du suivant
				mov Barney+4, 1				; on passe l'état à malade
				MOVMEM Barney, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Barney+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseFlanders:			; verification si la case est celle de Flanders
			CMPMEM PLAYER, Flanders		; verification de la coordonnée X
			JNE CheckCaseApu			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Flanders+2	; verification de la coordonnée Y
			JNE CheckCaseApu			; si non égale, on regarde si la case est celle du suivant
			cmp Flanders+4, 1			; si la case est deja à 1, on continue
			JE CheckCaseApu				; si égale, on regarde si la case est celle du suivant
				mov Flanders+4, 1			; on passe l'état à malade
				MOVMEM Flanders, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Flanders+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseApu:				; verification si la case est celle de Apu
			CMPMEM PLAYER, Apu			; verification de la coordonnée X
			JNE CheckCasePetitPapaNoel	; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Apu+2		; verification de la coordonnée Y
			JNE CheckCasePetitPapaNoel	; si non égale, on regarde si la case est celle du suivant
			cmp Apu+4, 1				; si la case est deja à 1, on continue
			JE CheckCasePetitPapaNoel	; si égale, on regarde si la case est celle du suivant
				mov Apu+4, 1				; on passe l'état à malade
				MOVMEM Apu, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Apu+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCasePetitPapaNoel:		; verification si la case est celle de PetitPapaNoel
			CMPMEM PLAYER, PetitPapaNoel		; verification de la coordonnée X
			JNE CheckCaseBouleDeNeige			; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, PetitPapaNoel+2	; verification de la coordonnée Y
			JNE CheckCaseBouleDeNeige			; si non égale, on regarde si la case est celle du suivant
			cmp PetitPapaNoel+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseBouleDeNeige			; si égale, on regarde si la case est celle du suivant
				mov PetitPapaNoel+4, 1				; on passe l'état à malade
				MOVMEM PetitPapaNoel, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov PetitPapaNoel+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseBouleDeNeige:		; verification si la case est celle de BouleDeNeige
			CMPMEM PLAYER, BouleDeNeige		; verification de la coordonnée X
			JNE CheckCaseKrusty				; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, BouleDeNeige+2	; verification de la coordonnée Y
			JNE CheckCaseKrusty				; si non égale, on regarde si la case est celle du suivant
			cmp BouleDeNeige+4, 1			; si la case est deja à 1, on continue
			JE CheckCaseKrusty				; si égale, on regarde si la case est celle du suivant
				mov BouleDeNeige+4, 1			; on passe l'état à malade
				MOVMEM BouleDeNeige, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov BouleDeNeige+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseKrusty:			; verification si la case est celle de Krusty
			CMPMEM PLAYER, Krusty		; verification de la coordonnée X
			JNE CheckCaseTahitiBob		; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, Krusty+2	; verification de la coordonnée Y
			JNE CheckCaseTahitiBob		; si non égale, on regarde si la case est celle du suivant
			cmp Krusty+4, 1				; si la case est deja à 1, on continue
			JE CheckCaseTahitiBob		; si égale, on regarde si la case est celle du suivant
				mov Krusty+4, 1				; on passe l'état à malade
				MOVMEM Krusty, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov Krusty+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


		CheckCaseTahitiBob:			; verification si la case est celle de TahitiBob
			CMPMEM PLAYER, TahitiBob		; verification de la coordonnée X
			JNE ENDCheckCase				; si non égale, on regarde si la case est celle du suivant
			CMPMEM PLAYER+2, TahitiBob+2	; verification de la coordonnée Y
			JNE ENDCheckCase				; si non égale, on regarde si la case est celle du suivant
			cmp TahitiBob+4, 1				; si la case est deja à 1, on continue
			JE ENDCheckCase					; si égale, on regarde si la case est celle du suivant
				mov TahitiBob+4, 1				; on passe l'état à malade
				MOVMEM TahitiBob, gamePosSick		; on le déplace a la position X gamePosSick
				add gamePosSick, 11				; on augmente gamePosSick de 8 (pour la position du prochain)
				mov TahitiBob+2, 188				; on le déplace a la position Y = 192 (dernière ligne)
				call simpsonGetSickSound


	ENDCheckCase:
ret

; -------------------------------------------
; Macros pour les deplacements des Simpsons
; -------------------------------------------
movRIGHT MACRO x, max
	local movEND

	CMPMEM x, max		; si position actuelle est à la derniere case à droite
	je movEND			; alors on retourne dans la boucle
	add x, 8			; sinon on peut se décaler à droite
	call CheckCase		; on part verifier la case ou on a fini

	movEND:
ENDM

movLEFT MACRO x, max
	local movEND

	CMPMEM x, max		; si position actuelle est à la derniere case à gauche
	je movEND			; alors on retourne dans la boucle
	add x, -8			; sinon on peut se décaler à gauche
	call CheckCase		; on part verifier la case ou on a fini
	
	movEND:
ENDM

movUP MACRO y, max
	local movEND

	CMPMEM y, max	; si position actuelle est à la derniere case en haut
	je movEND			; alors on retourne dans la boucle
	add y, -8			; sinon on peut se décaler en haut
	call CheckCase		; on part verifier la case ou on a fini
	
	movEND:
ENDM

movDOWN MACRO y, max
	local movEND

	CMPMEM y, max	; si position actuelle est à la derniere case en bas
	je movEND			; alors on retourne dans la boucle
	add y, 8			; sinon on peut se décaler en bas
	call CheckCase		; on part verifier la case ou on a fini
	
	movEND:
ENDM

; ---------------------------------------
; Fonction pour deplacements aléatoires
; ---------------------------------------
movSimpsons:
	movHomer:				; on effectue le mouvement
		cmp Homer+4, 1			; s'il est malade
		je movMarge				; on ne le déplace pas
		RAND MOVSIM
		HomerRIGHT:
			cmp MOVSIM, 0						; verification de la valeur de MOVSIM
			JNE HomerLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT HOMER, HOMER+6			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movMarge						; on change de simpson
		HomerLeft:
			cmp MOVSIM, 5						; verification de la valeur de MOVSIM
			JNE HomerUP							; si pas égale, on regarde le prochain mouvement
				movLEFT HOMER, HOMER+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movMarge						; on change de simpson
		HomerUP:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE HomerDOWN						; si pas égale, on regarde le prochain mouvement
				movUP HOMER+2, HOMER+10			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movMarge						; on change de simpson
		HomerDOWN:
			cmp MOVSIM, 4						; verification de la valeur de MOVSIM
			JNE movMarge						; si pas égale, on regarde le prochain mouvement
				movDOWN HOMER+2, HOMER+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movMarge:				; on effectue le mouvement
		cmp Marge+4, 1			; s'il est malade
		je movBart				; on ne le déplace pas
		RAND MOVSIM
		MargeRIGHT:
			cmp MOVSIM, 0						; verification de la valeur de MOVSIM
			JNE MargeLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Marge, Marge+6			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBart							; on change de simpson
		MargeLeft:
			cmp MOVSIM, 2						; verification de la valeur de MOVSIM
			JNE MargeUP							; si pas égale, on regarde le prochain mouvement
				movLEFT Marge, Marge+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBart							; on change de simpson
		MargeUP:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE MargeDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Marge+2, Marge+10			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBart							; on change de simpson
		MargeDOWN:
			cmp MOVSIM, 4						; verification de la valeur de MOVSIM
			JNE movBart							; si pas égale, on regarde le prochain mouvement
				movDOWN Marge+2, Marge+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movBart:				; on effectue le mouvement
		cmp Bart+4, 1			; s'il est malade
		je movLisa				; on ne le déplace pas
		RAND MOVSIM
		BartRIGHT:
			cmp MOVSIM, 3						; verification de la valeur de MOVSIM
			JNE BartLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Bart, Bart+6			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movLisa							; on change de simpson
		BartLeft:
			cmp MOVSIM, 5					; verification de la valeur de MOVSIM
			JNE BartUP							; si pas égale, on regarde le prochain mouvement
				movLEFT Bart, Bart+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movLisa							; on change de simpson
		BartUP:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE BartDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Bart+2, Bart+10			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movLisa							; on change de simpson
		BartDOWN:
			cmp MOVSIM, 4						; verification de la valeur de MOVSIM
			JNE movLisa							; si pas égale, on regarde le prochain mouvement
				movDOWN Bart+2, Bart+12			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movLisa:				; on effectue le mouvement
		cmp Lisa+4, 1			; s'il est malade
		je movMaggie				; on ne le déplace pas
		RAND MOVSIM
		LisaRIGHT:
			cmp MOVSIM, 4						; verification de la valeur de MOVSIM
			JNE LisaLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Lisa, Lisa+6			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movMaggie						; on change de simpson
		LisaLeft:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE LisaUP							; si pas égale, on regarde le prochain mouvement
				movLEFT Lisa, Lisa+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movMaggie						; on change de simpson
		LisaUP:
			cmp MOVSIM, 2						; verification de la valeur de MOVSIM
			JNE LisaDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Lisa+2, Lisa+10			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movMaggie						; on change de simpson
		LisaDOWN:
			cmp MOVSIM, 3						; verification de la valeur de MOVSIM
			JNE movMaggie						; si pas égale, on regarde le prochain mouvement
				movDOWN Lisa+2, Lisa+12			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movMaggie:				; on effectue le mouvement
		cmp Maggie+4, 1			; s'il est malade
		je movBarney				; on ne le déplace pas
		RAND MOVSIM
		MaggieRIGHT:
			cmp MOVSIM, 4						; verification de la valeur de MOVSIM
			JNE MaggieLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Maggie, Maggie+6		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBarney						; on change de simpson
		MaggieLeft:
			cmp MOVSIM, 5						; verification de la valeur de MOVSIM
			JNE MaggieUP						; si pas égale, on regarde le prochain mouvement
				movLEFT Maggie, Maggie+8		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBarney						; on change de simpson
		MaggieUP:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE MaggieDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Maggie+2, Maggie+10		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBarney						; on change de simpson
		MaggieDOWN:
			cmp MOVSIM, 3						; verification de la valeur de MOVSIM
			JNE movBarney						; si pas égale, on regarde le prochain mouvement
				movDOWN Maggie+2, Maggie+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movBarney:				; on effectue le mouvement
		cmp Barney+4, 1			; s'il est malade
		je movFlanders				; on ne le déplace pas
		RAND MOVSIM
		BarneyRIGHT:
			cmp MOVSIM, 2						; verification de la valeur de MOVSIM
			JNE BarneyLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Barney, Barney+6		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movFlanders						; on change de simpson
		BarneyLeft:
			cmp MOVSIM, 5						; verification de la valeur de MOVSIM
			JNE BarneyUP						; si pas égale, on regarde le prochain mouvement
				movLEFT Barney, Barney+8		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movFlanders						; on change de simpson
		BarneyUP:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE BarneyDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Barney+2, Barney+10		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movFlanders						; on change de simpson
		BarneyDOWN:
			cmp MOVSIM, 4
			JNE movFlanders						; si pas égale, on regarde le prochain mouvement
				movDOWN Barney+2, Barney+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movFlanders:				; on effectue le mouvement
		cmp Flanders+4, 1			; s'il est malade
		je movApu				; on ne le déplace pas
		RAND MOVSIM
		FlandersRIGHT:
			cmp MOVSIM, 2							; verification de la valeur de MOVSIM
			JNE FlandersLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Flanders, Flanders+6		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movApu								; on change de simpson
		FlandersLeft:
			cmp MOVSIM, 3							; verification de la valeur de MOVSIM
			JNE FlandersUP							; si pas égale, on regarde le prochain mouvement
				movLEFT Flanders, Flanders+8		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movApu								; on change de simpson
		FlandersUP:
			cmp MOVSIM, 5							; verification de la valeur de MOVSIM
			JNE FlandersDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Flanders+2, Flanders+10		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movApu								; on change de simpson
		FlandersDOWN:
			cmp MOVSIM, 4							; verification de la valeur de MOVSIM
			JNE movApu								; si pas égale, on regarde le prochain mouvement
				movDOWN Flanders+2, Flanders+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movApu:					; on effectue le mouvement
		cmp Apu+4, 1			; s'il est malade
		je movPetitPapaNoel				; on ne le déplace pas
		RAND MOVSIM
		ApuRIGHT:
			cmp MOVSIM, 1						; verification de la valeur de MOVSIM
			JNE ApuLeft							; si pas égale, on regarde le prochain mouvement
				movRIGHT Apu, Apu+6				; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movPetitPapaNoel				; on change de simpson
		ApuLeft:
			cmp MOVSIM, 2						; verification de la valeur de MOVSIM
			JNE ApuUP							; si pas égale, on regarde le prochain mouvement
				movLEFT Apu, Apu+8				; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movPetitPapaNoel				; on change de simpson
		ApuUP:
			cmp MOVSIM, 3						; verification de la valeur de MOVSIM
			JNE ApuDOWN							; si pas égale, on regarde le prochain mouvement
				movUP Apu+2, Apu+10				; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movPetitPapaNoel				; on change de simpson
		ApuDOWN:
			cmp MOVSIM, 3						; verification de la valeur de MOVSIM
			JNE movPetitPapaNoel				; si pas égale, on regarde le prochain mouvement
				movDOWN Apu+2, Apu+12			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movPetitPapaNoel:				; on effectue le mouvement
		cmp PetitPapaNoel+4, 1			; s'il est malade
		je movBouleDeNeige				; on ne le déplace pas
		RAND MOVSIM
		PetitPapaNoelRIGHT:
			cmp MOVSIM, 2										; verification de la valeur de MOVSIM
			JNE PetitPapaNoelLeft								; si pas égale, on regarde le prochain mouvement
				movRIGHT PetitPapaNoel, PetitPapaNoel+6			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBouleDeNeige									; on change de simpson
		PetitPapaNoelLeft:
			cmp MOVSIM, 1										; verification de la valeur de MOVSIM
			JNE PetitPapaNoelUP									; si pas égale, on regarde le prochain mouvement
				movLEFT PetitPapaNoel, PetitPapaNoel+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBouleDeNeige									; on change de simpson
		PetitPapaNoelUP:
			cmp MOVSIM, 4										; verification de la valeur de MOVSIM
			JNE PetitPapaNoelDOWN								; si pas égale, on regarde le prochain mouvement
				movUP PetitPapaNoel+2, PetitPapaNoel+10			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movBouleDeNeige									; on change de simpson
		PetitPapaNoelDOWN:
			cmp MOVSIM, 3										; verification de la valeur de MOVSIM
			JNE movBouleDeNeige									; si pas égale, on regarde le prochain mouvement
				movDOWN PetitPapaNoel+2, PetitPapaNoel+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movBouleDeNeige:				; on effectue le mouvement
		cmp BouleDeNeige+4, 1			; s'il est malade
		je movKrusty				; on ne le déplace pas
		RAND MOVSIM
		BouleDeNeigeRIGHT:
			cmp MOVSIM, 2										; verification de la valeur de MOVSIM
			JNE BouleDeNeigeLeft								; si pas égale, on regarde le prochain mouvement
				movRIGHT BouleDeNeige, BouleDeNeige+6			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movKrusty										; on change de simpson
		BouleDeNeigeLeft:
			cmp MOVSIM, 4										; verification de la valeur de MOVSIM
			JNE BouleDeNeigeUP									; si pas égale, on regarde le prochain mouvement
				movLEFT BouleDeNeige, BouleDeNeige+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movKrusty										; on change de simpson
		BouleDeNeigeUP:
			cmp MOVSIM, 1										; verification de la valeur de MOVSIM
			JNE BouleDeNeigeDOWN								; si pas égale, on regarde le prochain mouvement
				movUP BouleDeNeige+2, BouleDeNeige+10			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movKrusty										; on change de simpson
		BouleDeNeigeDOWN:
			cmp MOVSIM, 5										; verification de la valeur de MOVSIM
			JNE movKrusty										; si pas égale, on regarde le prochain mouvement
				movDOWN BouleDeNeige+2, BouleDeNeige+12			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movKrusty:					; on effectue le mouvement
		cmp Krusty+4, 1			; s'il est malade
		je movTahitiBob				; on ne le déplace pas
		RAND MOVSIM
		KrustyRIGHT:
			cmp MOVSIM, 2						; verification de la valeur de MOVSIM
			JNE KrustyLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT Krusty, Krusty+6		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movTahitiBob					; on change de simpson
		KrustyLeft:
			cmp MOVSIM, 1							; verification de la valeur de MOVSIM
			JNE KrustyUP							; si pas égale, on regarde le prochain mouvement
				movLEFT Krusty, Krusty+8			; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movTahitiBob					; on change de simpson
		KrustyUP:
			cmp MOVSIM, 4						; verification de la valeur de MOVSIM
			JNE KrustyDOWN						; si pas égale, on regarde le prochain mouvement
				movUP Krusty+2, Krusty+10		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp movTahitiBob					; on change de simpson
		KrustyDOWN:
			cmp MOVSIM, 3						; verification de la valeur de MOVSIM
			JNE movTahitiBob					; si pas égale, on regarde le prochain mouvement
				movDOWN Krusty+2, Krusty+12		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)

	movTahitiBob:				; on effectue le mouvement
		cmp TahitiBob+4, 1			; s'il est malade
		je ENDmovSimpsons				; on ne le déplace pas
		RAND MOVSIM
		TahitiBobRIGHT:
			cmp MOVSIM, 0							; verification de la valeur de MOVSIM
			JNE TahitiBobLeft						; si pas égale, on regarde le prochain mouvement
				movRIGHT TahitiBob, TahitiBob+6		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp ENDmovSimpsons						; on change de simpson
		TahitiBobLeft:
			cmp MOVSIM, 3							; verification de la valeur de MOVSIM
			JNE TahitiBobUP							; si pas égale, on regarde le prochain mouvement
				movLEFT TahitiBob, TahitiBob+8		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp ENDmovSimpsons						; on change de simpson
		TahitiBobUP:
			cmp MOVSIM, 4							; verification de la valeur de MOVSIM
			JNE TahitiBobDOWN						; si pas égale, on regarde le prochain mouvement
				movUP TahitiBob+2, TahitiBob+10		; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)
		jmp ENDmovSimpsons						; on change de simpson
		TahitiBobDOWN:
			cmp MOVSIM, 2							; verification de la valeur de MOVSIM
			JNE ENDmovSimpsons						; si pas égale, on regarde le prochain mouvement
				movDOWN TahitiBob+2, TahitiBob+12	; si egale, on effectue le mouvement (s'il est possible en fonction de la zone max)



	ENDmovSimpsons:

ret

; -------------------------------
; Verification de victoire
; -------------------------------
CHECKWIN:
	push ax		; sauvegarde du registre

	mov ax, 0
	add ax, Homer+4
	add ax, Marge+4
	add ax, Bart+4
	add ax, Lisa+4
	add ax, Maggie+4
	add ax, Barney+4
	add ax, Flanders+4
	add ax, Apu+4
	add ax, PetitPapaNoel+4
	add ax, BouleDeNeige+4
	add ax, Krusty+4
	add ax, TahitiBob+4
	cmp ax, 12				; on additionne tous les boolean
	JE winPanel				; et on regarde si le resultat est égale au nombre de simpson

	pop ax		; recuperation du registre
ret

; -------------------------------
; Reinitialisation pour le menu
; -------------------------------
menuSimpsonReset:
	mov Homer, 68				; reinitialisation des paramètres
		mov Homer+2, 34
	mov Marge, 84				; reinitialisation des paramètres
		mov Marge+2, 32
	mov Bart, 100				; reinitialisation des paramètres
		mov Bart+2, 30
	mov Lisa, 116				; reinitialisation des paramètres
		mov Lisa+2, 28
	mov Maggie, 132				; reinitialisation des paramètres
		mov Maggie+2, 26
	mov PetitPapaNoel, 148		; reinitialisation des paramètres
		mov PetitPapaNoel+2, 24
	mov BouleDeNeige, 164		; reinitialisation des paramètres
		mov BouleDeNeige+2, 24
	mov Apu, 180				; reinitialisation des paramètres
		mov Apu+2, 26
	mov Barney, 196				; reinitialisation des paramètres
		mov Barney+2, 28
	mov Flanders, 212			; reinitialisation des paramètres
		mov Flanders+2, 30
	mov Krusty, 228				; reinitialisation des paramètres
		mov Krusty+2, 32
	mov TahitiBob, 244			; reinitialisation des paramètres
		mov TahitiBob+2, 34
ret
