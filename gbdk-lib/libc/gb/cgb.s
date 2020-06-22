	.include "global.s"

	.title	"CGB support"
	.module	CGB

	;; BANKED: checked, imperfect
	.area	_BASE

_set_sprite_palette::		; Non-banked
	PUSH	BC
	LD	C,#.OCPS
	JR	.set_palette

_set_bkg_palette::		; Non-banked
	PUSH	BC
	LD	C,#.BCPS

.set_palette::
	LDA	HL,4(SP)	; Skip return address and registers
	LD	A,(HL+)		; first_palette
	ADD	A		; A *= 8
	ADD	A
	ADD	A
	OR	#0x80		; Set auto-increment
	LDH	(C),A
	INC	C
	LD	A,(HL+)		; D = nb_palettes
	ADD	A		; A *= 8
	ADD	A
	ADD	A
	LD	B,A		; Number of bytes
	LD	A,(HL+)		; rgb_data
	LD	H,(HL)
	LD	L,A
1$:
	LDH	A,(.STAT)
	AND	#0x02
	JR	NZ,1$

	LD	A,(HL+)
	LDH	(C),A
	DEC	B
	JR	NZ,1$

	POP	BC
	RET

	.area	_CODE
_set_sprite_palette_entry::	; Banked
	PUSH	BC
	LD	C,#.OCPS
	JR	.set_palette_entry

_set_bkg_palette_entry::	; Banked
	PUSH	BC
	LD	C,#.BCPS

.set_palette_entry::
	LDA	HL,.BANKOV+2(SP); Skip return address and registers
	LD	A,(HL+)		; first_palette
	ADD	A		; A *= 4
	ADD	A
	LD	B,A
	LD	A,(HL+)		; pal_entry
	ADD	B		; A += first_palette * 4
	ADD	A		; A *= 2
	OR	#0x80		; Set auto-increment
	LDH	(C),A
	INC	C
	LD	A,(HL+)		; rgb_data
	LD	H,(HL)
	LD	L,A
1$:
	LDH	A,(.STAT)
	AND	#0x02
	JR	NZ,1$
	LD	A,L
	LDH	(C),A
	LD	A,H
	LDH	(C),A

	POP	BC
	RET

	.area	_CODE
_cpu_slow::			; Banked
	LDH	A,(.KEY1)
	AND	#0x80		; Is GBC in double speed mode?
	RET	Z		; No, already in single speed

shift_speed:
	LDH	A,(.IE)
	PUSH	AF

	XOR	A		; A = 0
	LDH	(.IE),A		; Disable interrupts
	LDH	(.IF),A

	LD	A,#0x30
	LDH	(.P1),A

	LD	A,#0x01
	LDH	(.KEY1),A

	STOP

	POP	AF
	LDH	(.IE),A

	RET

_cpu_fast::			; Banked
	LDH	A,(.KEY1)
	AND	#0x80		; Is GBC in double speed mode?
	RET	NZ		; Yes, exit
	JR	shift_speed


_cgb_compatibility::		; Banked
	; avoid saving bc
	LD	HL, #.BCPS
	LD	A,#0x80
	LD	(HL),A	; Set default bkg palette
	OR	#0x7f		; 0xff: White
	INC	L		; .BCPD
	LD	(HL),A
	RRA			; 0x7f
	LD	(HL),A
	LD	A,#0xb5		; Light gray
	LD	(HL),A
	LD	A,#0x56
	LD	(HL),A
	LD	A,#0x4a		; Dark gray
	LD	(HL),A
	LD	A,#0x29
	LD	(HL),A
	XOR	A		; Black
	LD	(HL),A
	LD	(HL),A

	LD	A,#0x80
	DEC	L		; .OCPS
	LD	(HL),A	; Set default sprite palette
	OR	#0x7f		; 0xff: White
	INC	L		; .BCPD
	LD	(HL),A
	RRA
	LD	(HL),A
	LD	A,#0xb5		; Light gray
	LD	(HL),A
	LD	A,#0x56
	LD	(HL),A
	LD	A,#0x4a		; Dark gray
	LD	(HL),A
	LD	A,#0x29
	LD	(HL),A
	XOR	A		; Black
	LD	(HL),A
	LD	(HL),A

	RET
