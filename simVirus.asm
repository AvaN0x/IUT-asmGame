;  __ _                                            _                
; / _(_)_ __ ___  _ __  ___  ___  _ __   ___/\   /(_)_ __ _   _ ___ 
; \ \| | '_ ` _ \| '_ \/ __|/ _ \| '_ \ / _ \ \ / / | '__| | | / __|
; _\ \ | | | | | | |_) \__ \ (_) | | | | (_) \ V /| | |  | |_| \__ \
; \__/_|_| |_| |_| .__/|___/\___/|_| |_|\___/ \_/ |_|_|   \__,_|___/
;                |_|                                                
; By Clément RICATTE & Valentin Azancoth
; -> github.com/AvaN0x

;-------------------------------------------------
	TITLE DISPLAY - SimpsonoVirus
	.286
;------------------------------------STACK SEGMENT
SSEG		SEGMENT	STACK
		DB 32 DUP("STACK---")
SSEG		ENDS
;-------------------------------------DATA SEGMENT
DSEG		SEGMENT


; --------------------------
;// Touches de clavier
; --------------------------

	_RIGHT_ EQU 4dh		; Flèche DROITE
	_DOWN_  EQU 50h		; Flèche BAS
	_UP_    EQU 48h		; Flèche HAUT
	_LEFT_  EQU 4bh		; Flèche GAUCHE
	_KZ_	EQU 2ch		; Z
	_KQ_	EQU 10h		; Q
	_KS_	EQU 1fh		; S
	_KD_	EQU 20h		; D
	_Kent_  EQU 1ch		; ENTER
	_Kspce_	EQU 39h		; SPACE
	_KH_	EQU 23h		; H
	_Kesc_  EQU 01h		; ESCAPE

; --------------------------
; Couleurs
; --------------------------

	_BLACK_		EQU 00h
	_LGRAY_		EQU 07h
	_GRAY_		EQU 08h
	_WHITE_		EQU 0Fh
	_DBLUE_		EQU 68h
	_BLUE_		EQU 37h
	_LBLUE_		EQU 35h
	_GREEN_		EQU 77h
	_LGREEN_	EQU 02h
	_CYAN_		EQU 03h
	_RED_		EQU 04h
	_MAGENTA_	EQU 05h
	_BROWN_		EQU 06h
	_DGRAY_		EQU 12h
	_LCYAN_		EQU 0Bh
	_LRED_		EQU 0Ch
	_LMAGENTA_	EQU 0Dh
	_DPURPLE_	EQU 6Bh
	_PURPLE_	EQU 6Ch
	_LPURPLE_	EQU 24h
	_PINK_		EQU 41h
	_DPINK_		EQU 40h
	_ORANGE_	EQU 2Ah
	_LORANGE_	EQU 2Bh
	_YELLOW_	EQU 0Eh

; --------------------------
; Variables
; --------------------------
					; x, y, nbmove
	PLAYER		DW	152, 96, 0

				; 	x, 		y, boolean sick,   coordmax right, 	left, 	top, 	bottom
	Homer		DW	72, 	40, 		0,				96,		8,		16,		48
	Marge		DW	200, 	80, 		0,				208,	160,	16,		88
	Bart		DW	288, 	128, 		0,				304,	216,	104,	136
	Lisa		DW	240, 	40, 		0,				304,	216,	16,		48
	Maggie		DW	112, 	80, 		0,				152,	104,	16,		88
	Barney		DW	24, 	64, 		0,				96,		8,		56,		88
	Flanders	DW	200, 	112, 		0,				208,	160,	104,	176
	Apu 		DW	24, 	128, 		0,				96,		8,		104,	136
	PetitPapaNoel	DW	112, 112, 		0,				152,	104,	104,	176
	BouleDeNeige	DW	240, 152, 		0,				304,	216,	144,	176
	Krusty		DW	288, 	64, 		0,				304,	216,	56,		88
	TahitiBob	DW	72, 	152, 		0,				96,		8,		144,	176

	RECORDMOVE	DW	0
	MOVSIM		DW	0

	timerMov	DB	0

; --------------------------
; Texts
; --------------------------

	; all
	S_ESCAPE	DB "Press Escape to leave", 24h

	; gameMenu
	S_MENU1		DB "Spread the virus to the SIMPSONS !", 24h
	S_MENU2		DB "Press Enter or Space to play", 24H
	S_MENU3		DB "Press H for the Help tab", 24H

	S_CREDIT	DB "By github.com/AvaN0x", 24h
	S_CREDIT2	DB "and Valentin Azancoth", 24h

	; helpPanel

	S_HGOAL1	DB "Your goal is to touch", 24h  
	S_HGOAL2	DB "every Simpsons !", 24h
	S_HMOVE1	DB " ", 1eh, " ", "     Z", 24h
	S_HMOVE2	DB 11h, 1fh, 10h, " or QSD to move", 24h
	S_HESCAPE	DB "ESCAPE to leave", 24h
	S_HCONFIRM	DB "SPACE or ENTER to confirm", 24h
	S_HLEAVE	DB "Press any key to leave", 24h

	; gameMain
	S_NBMOVE	DB " moves", 13, 10, 24h
	S_RECORD	DB "Record: ", 24h

	; winPanel
	S_WIN1		DB "Victory in", 24h
	S_WIN2		DB "moves", 24h
	S_WINRECORD1	DB "You have set your new record!", 24h
	S_WINRECORD2	DB "You beated your old record!", 24h
	S_ENTER		DB "Press Enter or Space to continue", 24h

DSEG		ENDS
;-------------------------------------CODE SEGMENT
CSEG SEGMENT 'CODE'
ASSUME CS:CSEG, SS:SSEG, DS:DSEG
%include    lib/avalib.asm
%include    Sdrawer.asm
%include    function.asm
;-------------------------------------------------
;MAIN
MAIN 	PROC	FAR
;sauver l'adresse de retour
PUSH	DS
PUSH	0
	
;registre
mov	AX, DSEG
mov	DS, AX
;main
call SETGRAPHICS

; --------------------------
; Menu
; --------------------------

gameMenu:
	CLEARSCREEN	_LORANGE_		; on nettoie l'écran entièrement à chaque tour
	FILLSCREEN 1, 1, 38, 23, _BLACK_		; on remplis la zone visuelle

	SETCURSOR 3, 6
	STRINGOUT S_MENU1			; "Spread the virus to the SIMPSONS !"

	SETCURSOR 5, 13
	STRINGOUT S_MENU2			; "Press Enter or Space to play"
	SETCURSOR 7, 15
	STRINGOUT S_MENU3			; "Press H for the Help tab"
	SETCURSOR 9, 17
	STRINGOUT S_ESCAPE			; "Press Escape to leave"


	SETCURSOR 18, 21
	STRINGOUT S_CREDIT			; "By github.com/AvaN0x"
	SETCURSOR 17, 22
	STRINGOUT S_CREDIT2			; "and Valentin Azancoth"


	call menuSimpsonReset		; on donne au simpson la position voulue pour le menu

	; on dessine les simpsons
		call DrawPLAYER

		DrawHomer		_YELLOW_, _LORANGE_	
		DrawMarge		_YELLOW_, _LORANGE_	
		DrawBart		_YELLOW_, _LORANGE_	
		DrawLisa		_YELLOW_, _LORANGE_	
		DrawMaggie		_YELLOW_, _LORANGE_	
		DrawBarney		_YELLOW_, _LORANGE_	
		DrawFlanders	_YELLOW_, _LORANGE_	
		DrawApu			_BROWN_	
		DrawPetitPapaNoel	_ORANGE_, _BROWN_	
		DrawBouleDeNeige	_GRAY_, _DBLUE_	
		DrawKrusty		_YELLOW_, _LORANGE_	
		DrawTahitiBob	_YELLOW_, _LORANGE_	

	SETCURSOR 0, 22		; position du curseur pour le message lorsque le programme s'arrête "Press any key to continue."

	mov ah, 0		; fonction pour recuperer la touche
	int 16h			; get key press

	cmp ah, _Kent_		; if key = ENTER
	je gameSimpsonReset		; on met fin au programme
	cmp ah, _Kspce_		; if key = ENTER
	je gameSimpsonReset		; on met fin au programme

	cmp ah, _KH_		; if key = H
	je helpPanel		; on met fin au programme

	cmp ah, _Kesc_		; if key = ESCAPE
	je ENDPROG			; on met fin au programme

jmp gameMenu			; on retourne dans la boucle jusqu'a trouver une bonne touche



; --------------------------
; helpPanel
; --------------------------
helpPanel:
	CLEARSCREEN	_LBLUE_		; on nettoie l'écran entièrement à chaque tour
	FILLSCREEN 1, 1, 38, 23, _BLACK_		; on remplis la zone visuelle

	SETCURSOR 9, 3
	STRINGOUT S_HGOAL1		; "Your goal is to touch"
	SETCURSOR 12, 4
	STRINGOUT S_HGOAL2		;    "every Simpsons !"

	SETCURSOR 4, 8
	STRINGOUT S_HMOVE1		;  "Z"
	SETCURSOR 4, 9
	STRINGOUT S_HMOVE2		; "QSD to move"
	SETCURSOR 4, 12
	STRINGOUT S_HESCAPE		; "ESCAPE to leave"
	SETCURSOR 4, 15
	STRINGOUT S_HCONFIRM	; "SPACE or ENTER to confirm"

	mov PLAYER, 112			; x
	mov PLAYER+2, 176		; y
	call DrawPLAYER


	SETCURSOR 16, 22
	STRINGOUT S_HLEAVE		; "Press any key to leave"

	mov ah, 0		; fonction pour recuperer la touche
	int 16h			; get key press
jmp gameMenu

; --------------------------
; Reinitialisation pour le jeu
; --------------------------

gameSimpsonReset:
	mov PLAYER, 152				; reinitialisation des paramètres
		mov PLAYER+2, 96
		mov PLAYER+4, 0
	mov Homer, 72				; reinitialisation des paramètres
		mov Homer+2, 40
		mov Homer+4, 0
	mov Marge, 200				; reinitialisation des paramètres
		mov Marge+2, 80
		mov Marge+4, 0
	mov Bart, 288				; reinitialisation des paramètres
		mov Bart+2, 128
		mov Bart+4, 0
	mov Lisa, 240				; reinitialisation des paramètres
		mov Lisa+2, 40
		mov Lisa+4, 0
	mov Maggie, 112				; reinitialisation des paramètres
		mov Maggie+2, 80
		mov Maggie+4, 0
	mov Barney, 24				; reinitialisation des paramètres
		mov Barney+2, 64
		mov Barney+4, 0
	mov Flanders, 200			; reinitialisation des paramètres
		mov Flanders+2, 112
		mov Flanders+4, 0
	mov Apu, 24					; reinitialisation des paramètres
		mov Apu+2, 128
		mov Apu+4, 0
	mov PetitPapaNoel, 112		; reinitialisation des paramètres
		mov PetitPapaNoel+2, 112
		mov PetitPapaNoel+4, 0
	mov BouleDeNeige, 240		; reinitialisation des paramètres
		mov BouleDeNeige+2, 152
		mov BouleDeNeige+4, 0
	mov Krusty, 288				; reinitialisation des paramètres
		mov Krusty+2, 64
		mov Krusty+4, 0
	mov TahitiBob, 72			; reinitialisation des paramètres
		mov TahitiBob+2, 152
		mov TahitiBob+4, 0
jmp gameMain

; --------------------------
; Jeu
; --------------------------

gameMain:
		DELAY 07fffh

		call CHECKWIN

		CLEARSCREEN	_BLACK_		; on nettoie l'écran entièrement à chaque tour
		FILLSCREEN 1, 2, 38, 22, _DGRAY_		; on remplis la zone de jeu

		PRINTNUM PLAYER+4
		stringout S_NBMOVE		; fin de la phrase

		cmp RECORDMOVE, 0		; comparaison du RECORDMOVE avec 0
		je ENDRECORD			; s'il est égale a 0, on continue le programme
			SETCURSOR 27, 0			; sinon on affiche :
			stringout S_RECORD		; "Record:"
			SETCURSOR 35, 0			;
			PRINTNUM RECORDMOVE		; RECORDMOVE

		ENDRECORD:

		SETCURSOR 18, 24
		stringout S_ESCAPE		; Press Escape to leave

		inc timerMov			; on incrémente le timerMov
		cmp timerMov, 5			; si c'est égale à 5
		jne afterIncTimerMov		; sinon on continue la suite
			mov timerMov, 0		; on remets la valeur a 0
			call movSimpsons	; et on change la position des simpsons

		afterIncTimerMov:
		
		call CHECKWIN

		; dessin des simpsons
		HomerCheckSick:				; verification de l'état d'Homer
			cmp Homer+4, 1							; si boolean = vrai
			JE HomerSick							; jump sur HomerSick
			DrawHomer		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp MargeCheckSick						; on continue avec le prochain
		HomerSick:					; l'afficher en vert s'il est malade
			DrawHomer		_LGREEN_, _GREEN_

		MargeCheckSick:				; verification de l'état de Marge
			cmp Marge+4, 1							; si boolean = vrai
			JE MargeSick							; jump sur MargeSick
			DrawMarge		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp BartCheckSick						; on continue avec le prochain
		MargeSick:					; l'afficher en vert si elle est malade
			DrawMarge		_LGREEN_, _GREEN_

		BartCheckSick:				; verification de l'état de Bart
			cmp Bart+4, 1							; si boolean = vrai
			JE BartSick								; jump sur BartSick
			DrawBart		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp LisaCheckSick						; on continue avec le prochain
		BartSick:					; l'afficher en vert s'il est malade
			DrawBart		_LGREEN_, _GREEN_

		LisaCheckSick:				; verification de l'état de Lisa
			cmp Lisa+4, 1							; si boolean = vrai
			JE LisaSick								; jump sur LisaSick
			DrawLisa		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp MaggieCheckSick						; on continue avec le prochain
		LisaSick:					; l'afficher en vert si elle est malade
			DrawLisa		_LGREEN_, _GREEN_

		MaggieCheckSick:			; verification de l'état de Maggie
			cmp Maggie+4, 1							; si boolean = vrai
			JE MaggieSick							; jump sur MaggieSick
			DrawMaggie		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp BarneyCheckSick						; on arrête les verifications
		MaggieSick:					; l'afficher en vert si elle est malade
			DrawMaggie		_LGREEN_, _GREEN_

		BarneyCheckSick:			; verification de l'état de Barney
			cmp Barney+4, 1							; si boolean = vrai
			JE BarneySick							; jump sur BarneySick
			DrawBarney		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp FlandersCheckSick						; on arrête les verifications
		BarneySick:					; l'afficher en vert s'il est malade
			DrawBarney		_LGREEN_, _GREEN_

		FlandersCheckSick:			; verification de l'état de Flanders
			cmp Flanders+4, 1							; si boolean = vrai
			JE FlandersSick							; jump sur FlandersSick
			DrawFlanders		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp ApuCheckSick						; on arrête les verifications
		FlandersSick:				; l'afficher en vert s'il est malade
			DrawFlanders		_LGREEN_, _GREEN_

		ApuCheckSick:				; verification de l'état de Apu
			cmp Apu+4, 1							; si boolean = vrai
			JE ApuSick							; jump sur ApuSick
			DrawApu		_BROWN_		; SINON on l'affiche normalement
			jmp PetitPapaNoelCheckSick						; on arrête les verifications
		ApuSick:					; l'afficher en vert s'il est malade
			DrawApu		_GREEN_

		PetitPapaNoelCheckSick:		; verification de l'état de PetitPapaNoel
			cmp PetitPapaNoel+4, 1							; si boolean = vrai
			JE PetitPapaNoelSick							; jump sur PetitPapaNoelSick
			DrawPetitPapaNoel		_ORANGE_, _BROWN_		; SINON on l'affiche normalement
			jmp BouleDeNeigeCheckSick						; on arrête les verifications
		PetitPapaNoelSick:			; l'afficher en vert s'il est malade
			DrawPetitPapaNoel		_LGREEN_, _GREEN_

		BouleDeNeigeCheckSick:		; verification de l'état de BouleDeNeige
			cmp BouleDeNeige+4, 1							; si boolean = vrai
			JE BouleDeNeigeSick								; jump sur BouleDeNeigeSick
			DrawBouleDeNeige		_GRAY_, _DBLUE_		; SINON on l'affiche normalement
			jmp KrustyCheckSick						; on arrête les verifications
		BouleDeNeigeSick:			; l'afficher en vert s'il est malade
			DrawBouleDeNeige		_LGREEN_, _GREEN_

		KrustyCheckSick:			; verification de l'état de Krusty
			cmp Krusty+4, 1							; si boolean = vrai
			JE KrustySick							; jump sur KrustySick
			DrawKrusty		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp TahitiBobCheckSick						; on arrête les verifications
		KrustySick:					; l'afficher en vert s'il est malade
			DrawKrusty		_LGREEN_, _GREEN_

		TahitiBobCheckSick:			; verification de l'état de TahitiBob
			cmp TahitiBob+4, 1							; si boolean = vrai
			JE TahitiBobSick							; jump sur Sick
			DrawTahitiBob		_YELLOW_, _LORANGE_		; SINON on l'affiche normalement
			jmp ENDCheckSick						; on arrête les verifications
		TahitiBobSick:				; l'afficher en vert s'il est malade
			DrawTahitiBob		_LGREEN_, _GREEN_

		ENDCheckSick:

		call DrawPLAYER


		mov ah, 01h		; fonction pour verifier si une touche est enfoncée
		int 16h			; get key press
		jz gameMain			; s'il n'y a aucune touche, on relance la boucle

		mov ah, 0		; fonction pour recuperer la touche
		int 16h			; get key press
		cmp ah, _Kesc_		; if key = ESCAPE
		je gameMenu			; on met fin au programme

		cmp ah, _RIGHT_		; if key = RIGHT
		je movPLAYERRIGHT		; on fait le déplacement
		cmp ah, _KD_		; if key = D
		je movPLAYERRIGHT		; on fait le déplacement

		cmp ah, _LEFT_		; if key = LEFT
		je movPLAYERLEFT		; on fait le déplacement
		cmp ah, _KQ_		; if key = Q
		je movPLAYERLEFT		; on fait le déplacement

		cmp ah, _UP_		; if key = UP
		je movPLAYERUP			; on fait le déplacement
		cmp ah, _KZ_		; if key = Z
		je movPLAYERUP			; on fait le déplacement

		cmp ah, _DOWN_		; if key = DOWN
		je movPLAYERDOWN		; on fait le déplacement
		cmp ah, _KS_		; if key = S
		je movPLAYERDOWN		; on fait le déplacement


jmp gameMain			; on retourne dans la boucle jusqu'a trouver une bonne touche

movPLAYERRIGHT:
	cmp PLAYER, 304		; si position actuelle est à la derniere case à droite		; PLAYER = PLAYER[0]
	je gameMain			; alors on retourne dans la boucle
	add PLAYER, 8		; sinon on peut se décaler à droite
	inc PLAYER+4		; on ajoute au nombre de deplacement
	call CheckCase		; on part verifier la case ou on a fini
jmp gameMain

movPLAYERLEFT:
	cmp PLAYER, 8		; si position actuelle est à la derniere case à gauche		; PLAYER = PLAYER[0]
	je gameMain			; alors on retourne dans la boucle
	add PLAYER, -8		; sinon on peut se décaler à gauche
	inc PLAYER+4		; on ajoute au nombre de deplacement
	call CheckCase		; on part verifier la case ou on a fini
jmp gameMain

movPLAYERUP:
	cmp PLAYER+2, 16	; si position actuelle est à la derniere case en haut		; PLAYER+2 = PLAYER[1]
	je gameMain			; alors on retourne dans la boucle
	add PLAYER+2, -8	; sinon on peut se décaler en haut
	inc PLAYER+4		; on ajoute au nombre de deplacement
	call CheckCase		; on part verifier la case ou on a fini
jmp gameMain		

movPLAYERDOWN:
	cmp PLAYER+2, 176	; si position actuelle est à la derniere case en bas		; PLAYER+2 = PLAYER[1]
	je gameMain			; alors on retourne dans la boucle
	add PLAYER+2, 8		; sinon on peut se décaler en bas
	inc PLAYER+4		; on ajoute au nombre de deplacement
	call CheckCase		; on part verifier la case ou on a fini
jmp gameMain

; --------------------------
; Ecran de victoire	
; --------------------------

winPanel:
	CLEARSCREEN	_GREEN_		; on nettoie l'écran entièrement à chaque tour
	FILLSCREEN 1, 1, 38, 23, _BLACK_		; on remplis la zone visuelle

	SETCURSOR 15, 5
	stringout S_WIN1		; "Victory in"
	SETCURSOR 18, 7
	PRINTNUM player+4		; affichage nombre de deplacement
	SETCURSOR 17, 9
	stringout S_WIN2		; "moves"

	CMP RECORDMOVE, 0					; si le record vaut 0 (set de base)
	jne CheckRecordLess
		SETCURSOR 5, 14
		STRINGOUT S_WINRECORD1		; "You have set your new record !"
		mov ax, PLAYER+4
		mov RECORDMOVE, ax		; on change le record

	CheckRecordLess:
	CMPMEM PLAYER+4, RECORDMOVE		; si le nombre de deplacement est inferieur au record
	jge winPanelContinue
		SETCURSOR 6, 13
		STRINGOUT S_WINRECORD2	; "You beated your old record!"
		mov ax, PLAYER+4
		mov RECORDMOVE, ax		; on change le record

	winPanelContinue:
		SETCURSOR 4, 22
		stringout S_ENTER		; "Press Enter or Space to continue"

		mov ah, 0		; fonction pour recuperer la touche
		int 16h			; get key press

		cmp ah, _Kent_		; if key = ENTER
		je gameMenu		; on retourne au menu
		cmp ah, _Kspce_		; if key = ESPACE
		je gameMenu		; on retourne au menu

	jmp winPanelContinue			; on retourne dans la boucle jusqu'a trouver la bonne touche

; ;retour
	RET
;fin de la procedure MAIN
	MAIN	ENDP
;fin du code du segment
	CSEG	ENDS
;fin du programme
	END		MAIN
;---------------------------------fin de programme

