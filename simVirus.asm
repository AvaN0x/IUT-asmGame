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
	_KBackspace_	EQU 0Eh		; BACKSPACE

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
	Homer		DW	0, 		0, 			0,			96,		8,		16,		48
	Marge		DW	0, 		0, 			0,			208,	160,	16,		88
	Bart		DW	0, 		0, 			0,			304,	216,	104,	136
	Lisa		DW	0, 		0, 			0,			304,	216,	16,		48
	Maggie		DW	0, 		0, 			0,			152,	104,	16,		88
	Barney		DW	0, 		0, 			0,			96,		8,		56,		88
	Flanders	DW	0, 		0, 			0,			208,	160,	104,	176
	Apu 		DW	0, 		0, 			0,			96,		8,		104,	136
	PetitPapaNoel	DW	0, 	0, 			0,			152,	104,	104,	176
	BouleDeNeige	DW	0, 	0, 			0,			304,	216,	144,	176
	Krusty		DW	0, 		0, 			0,			304,	216,	56,		88
	TahitiBob	DW	0, 		0, 			0,			96,		8,		144,	176

	RECORDMOVE	DW	0
	MENUSTATE	DW	0
	MOVSIM		DW	0
	timerMov	DB	0

; --------------------------
; Texts
; --------------------------

	; all
	S_ESCAPE	DB "Press Escape to leave", 24h

	; gameMenu
	S_MENU1		DB "Spread the virus to the SIMPSONS !", 24h
	S_MENU2		DB "Play", 24H
	S_MENU3		DB "Help", 24H
	S_MENU4		DB "Quit", 24H

	S_CREDIT	DB "By github.com/AvaN0x", 24h
	S_CREDIT2	DB "and github.com/Valaaz", 24h

	; helpPanel

	S_HGOAL1	DB "Your goal is to touch", 24h  
	S_HGOAL2	DB "every Simpsons !", 24h
	S_HMOVE1	DB " ", 1eh, " ", "     Z", 24h
	S_HMOVE2	DB 11h, 1fh, 10h, " or QSD to move", 24h
	S_HESCAPE	DB "ESCAPE or BACKSPACE to leave", 24h
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

	SETCURSOR 18, 12
	STRINGOUT S_MENU2			; "Play"
	SETCURSOR 18, 14
	STRINGOUT S_MENU3			; "Help"
	SETCURSOR 18, 16
	STRINGOUT S_MENU4			; "Quit"


	SETCURSOR 18, 21
	STRINGOUT S_CREDIT			; "By github.com/AvaN0x"
	SETCURSOR 17, 22
	STRINGOUT S_CREDIT2			; "and github.com/Valaaz"

	cmp MENUSTATE, 0
	je playerPosPlay
	cmp MENUSTATE, 1
	je playerPosHelp
	cmp MENUSTATE, 2
	je playerPosQuit
	jmp endPlayerPos

		playerPosPlay:
			mov PLAYER, 128		; x
			mov PLAYER+2, 96	; y
		jmp endPlayerPos

		playerPosHelp:
			mov PLAYER, 128		; x
			mov PLAYER+2, 112	; y
		jmp endPlayerPos

		playerPosQuit:
			mov PLAYER, 128		; x
			mov PLAYER+2, 128	; y
		jmp endPlayerPos

	endPlayerPos:

	; on dessine les simpsons
		call menuSimpsonReset		; on donne au simpson la position voulue pour le menu

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


	cmp ah, _UP_		; if key = UP
	je menuUP			; on fait le déplacement
	cmp ah, _KZ_		; if key = Z
	je menuUP			; on fait le déplacement

	cmp ah, _DOWN_		; if key = DOWN
	je menuDOWN		; on fait le déplacement
	cmp ah, _KS_		; if key = S
	je menuDOWN		; on fait le déplacement

	cmp ah, _Kent_		; if key = ENTER
	je checkMenuState		; on met fin au programme
	cmp ah, _Kspce_		; if key = ENTER
	je checkMenuState		; on met fin au programme
jmp gameMenu			; on retourne dans la boucle jusqu'a trouver une bonne touche


; si on confirme une case du menu
checkMenuState:
	cmp MENUSTATE, 0
	je gameSimpsonReset		; on peut lancer le jeu

	cmp MENUSTATE, 1
	je helpPanel			; on ouvre le panneau d'aide

	cmp MENUSTATE, 2
	je ENDPROG				; on ferme le programme
jmp gameMenu			; cas qui ne devrait pas arriver, mais s'il arrive, on retourne dans le menu

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
		cmp ah, _KBackspace_		; if key = BACKSPACE  
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

		call menuSimpsonReset		; on donne au simpson la position voulue pour le menu
		
		mov PLAYER, 112		; x
		mov PLAYER+2, 64	; y
		call DrawPLAYER
		
		mov PLAYER, 200		; x
		mov PLAYER+2, 64	; y
		call DrawPLAYER

		DrawHomer		_LGREEN_, _GREEN_	
		DrawMarge		_LGREEN_, _GREEN_	
		DrawBart		_LGREEN_, _GREEN_	
		DrawLisa		_LGREEN_, _GREEN_	
		DrawMaggie		_LGREEN_, _GREEN_	
		DrawBarney		_LGREEN_, _GREEN_	
		DrawFlanders	_LGREEN_, _GREEN_	
		DrawApu			_GREEN_	
		DrawPetitPapaNoel	_LGREEN_, _GREEN_	
		DrawBouleDeNeige	_LGREEN_, _GREEN_	
		DrawKrusty		_LGREEN_, _GREEN_	
		DrawTahitiBob	_LGREEN_, _GREEN_	



	SETCURSOR 15, 6
	stringout S_WIN1		; "Victory in"
	SETCURSOR 18, 8
	PRINTNUM player+4		; affichage nombre de deplacement
	SETCURSOR 17, 10
	stringout S_WIN2		; "moves"

	CMP RECORDMOVE, 0					; si le record vaut 0 (set de base)
	jne CheckRecordLess
		SETCURSOR 5, 15
		STRINGOUT S_WINRECORD1		; "You have set your new record !"
		mov ax, PLAYER+4
		mov RECORDMOVE, ax		; on change le record

	CheckRecordLess:
	CMPMEM PLAYER+4, RECORDMOVE		; si le nombre de deplacement est inferieur au record
	jge winPanelContinue
		SETCURSOR 6, 15
		STRINGOUT S_WINRECORD2	; "You beated your old record!"
		mov ax, PLAYER+4
		mov RECORDMOVE, ax		; on change le record

	winPanelContinue:
		SETCURSOR 4, 22
		stringout S_ENTER		; "Press Enter or Space to continue"
		DELAY 0ffffh
		SOUND 2280, 2	;	C	523.25hz
		SOUND 2031, 1	;	D	587.33hz
		SOUND 2280, 2	;	C	523.25hz
		SOUND 2031, 1	;	D	587.33hz
		SOUND 2280, 2	;	C	523.25hz
		SOUND 2031, 1	;	D	587.33hz

	winPanelAskConfirm:
		mov ah, 0		; fonction pour recuperer la touche
		int 16h			; get key press

		cmp ah, _Kent_		; if key = ENTER
		je gameMenu		; on retourne au menu
		cmp ah, _Kspce_		; if key = ESPACE
		je gameMenu		; on retourne au menu

	jmp winPanelAskConfirm			; on retourne dans la boucle jusqu'a trouver la bonne touche

; ;retour
	RET
;fin de la procedure MAIN
	MAIN	ENDP
;fin du code du segment
	CSEG	ENDS
;fin du programme
	END		MAIN
;---------------------------------fin de programme
