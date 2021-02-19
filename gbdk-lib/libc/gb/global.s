	.NEAR_CALLS = 1         ; <near_calls> - tag so that sed can change this
        
	;; Changed by astorgb.pl to 1
	__RGBDS__	= 0

	
	;;  Screen dimensions 
	.MAXCURSPOSX	= 0x13	; In tiles
	.MAXCURSPOSY	= 0x11

	.START		= 0x80
	.SELECT		= 0x40
	.B		= 0x20
	.A		= 0x10
	.DOWN		= 0x08
	.UP		= 0x04
	.LEFT		= 0x02
	.RIGHT		= 0x01

	.SCREENWIDTH	= 0xA0
	.SCREENHEIGHT	= 0x90
	.MINWNDPOSX	= 0x07
	.MINWNDPOSY	= 0x00
	.MAXWNDPOSX	= 0xA6
	.MAXWNDPOSY	= 0x8F

	.VBL_IFLAG	= 0x01
	.LCD_IFLAG	= 0x02
	.TIM_IFLAG	= 0x04
	.SIO_IFLAG	= 0x08
	.JOY_IFLAG	= 0x10
 
	.P1		= 0xFF00	; Joystick: 1.1.P15.P14.P13.P12.P11.P10
	.SB		= 0xFF01	; Serial IO data buffer
	.SC		= 0xFF02	; Serial IO control register
	.DIV		= 0xFF04	; Divider register
	.TIMA		= 0xFF05	; Timer counter
	.TMA		= 0xFF06	; Timer modulo
	.TAC		= 0xFF07	; Timer control
	.IF		= 0xFF0F	; Interrupt flags: 0.0.0.JST.SIO.TIM.LCD.VBL
	.NR10		= 0xFF10	; Sound register
	.NR11		= 0xFF11	; Sound register
	.NR12		= 0xFF12	; Sound register
	.NR13		= 0xFF13	; Sound register
	.NR14		= 0xFF14	; Sound register
	.NR21		= 0xFF16	; Sound register
	.NR22		= 0xFF17	; Sound register
	.NR23		= 0xFF18	; Sound register
	.NR24		= 0xFF19	; Sound register
	.NR30		= 0xFF1A	; Sound register
	.NR31		= 0xFF1B	; Sound register
	.NR32		= 0xFF1C	; Sound register
	.NR33		= 0xFF1D	; Sound register
	.NR34		= 0xFF1E	; Sound register
	.NR41		= 0xFF20	; Sound register
	.NR42		= 0xFF21	; Sound register
	.NR43		= 0xFF22	; Sound register
	.NR44		= 0xFF23	; Sound register
	.NR50		= 0xFF24	; Sound register
	.NR51		= 0xFF25	; Sound register
	.NR52		= 0xFF26	; Sound register
	.LCDC		= 0xFF40	; LCD control
	.STAT		= 0xFF41	; LCD status
	.SCY		= 0xFF42	; Scroll Y
	.SCX		= 0xFF43	; Scroll X
	.LY		= 0xFF44	; LCDC Y-coordinate
	.LYC		= 0xFF45	; LY compare
	.DMA		= 0xFF46	; DMA transfer
	.BGP		= 0xFF47	; BG palette data
	.OBP0		= 0xFF48	; OBJ palette 0 data
	.OBP1		= 0xFF49	; OBJ palette 1 data
	.WY		= 0xFF4A	; Window Y coordinate
	.WX		= 0xFF4B	; Window X coordinate
	.KEY1		= 0xFF4D	; CPU speed
	.VBK		= 0xFF4F	; VRAM bank
	.HDMA1		= 0xFF51	; DMA control 1
	.HDMA2		= 0xFF52	; DMA control 2
	.HDMA3		= 0xFF53	; DMA control 3
	.HDMA4		= 0xFF54	; DMA control 4
	.HDMA5		= 0xFF55	; DMA control 5
	.RP		= 0xFF56	; IR port
	.BCPS		= 0xFF68	; BG color palette specification
	.BCPD		= 0xFF69	; BG color palette data
	.OCPS		= 0xFF6A	; OBJ color palette specification
	.OCPD		= 0xFF6B	; OBJ color palette data
	.SVBK		= 0xFF70	; WRAM bank
	.IE		= 0xFFFF	; Interrupt enable

	.G_MODE		= 0x01	; Graphic mode
	.T_MODE		= 0x02	; Text mode (bit 2)
	.T_MODE_OUT	= 0x02	; Text mode output only
	.T_MODE_INOUT	= 0x03	; Text mode with input
	.M_NO_SCROLL	= 0x04	; Disables scrolling of the screen in text mode
	.M_NO_INTERP	= 0x08	; Disables special character interpretation

	.MBC1_ROM_PAGE	= 0x2000 ; Address to write to for MBC1 switching
	
	;; Status codes for IO
	.IO_IDLE	= 0x00
	.IO_SENDING	= 0x01
	.IO_RECEIVING	= 0x02
	.IO_ERROR	= 0x04

	;; Type of IO data
	.DT_IDLE	= 0x66
	.DT_RECEIVING	= 0x55

	;; Table of routines for modes
	.MODE_TABLE	= 0x01E0

	;; C related
	;; Overheap of a banked call.  Used for parameters
	;;  = ret + real ret + bank

	.if .NEAR_CALLS
	.BANKOV		= 2

	.else
	.BANKOV		= 6

	.endif

	.globl  __current_bank
	.globl	__shadow_OAM_base
	
	;; Global variables
	.globl	.mode

	.globl	__cpu

	;; Global routines
;	.globl	.set_mode	;; don't link mode.o by default

	.globl	.reset

	.globl	.display_off

	.globl	.wait_vbl_done

	;; Interrupt routines 
	.globl	.add_VBL
;	.globl	.add_LCD	;; don't link LCD.o by default
;	.globl	.add_TIM	;; don't link TIM.o by default
;	.globl	.add_SIO	;; don't link serial.o by default
;	.globl	.add_JOY	;; don't link JOY.o by default

	;; Symbols defined at link time
	.globl	.STACK
	.globl	_shadow_OAM
	.globl	.refresh_OAM

	;; Main user routine	
	.globl	_main

	;; Macro definitions

.macro WAIT_STAT ?lbl
lbl:	LDH	A, (.STAT)
	AND	#0x02		; Check if in LCD modes 0 or 1
	JR 	NZ, lbl
.endm

.macro ADD_A_REG16 regH regL
	ADD	regL
	LD	regL, A
	ADC	regH
	SUB	regL
	LD	regH, A
.endm

.macro SIGNED_ADD_A_REG16 regH regL ?lbl
	; If A is negative, we need to subtract 1 from upper byte of 16-bit value
	BIT	7, A		; set z if a signed bit is 0
	JR	Z, lbl		; if z is set jump to positive
	dec	regH		; if negative decrement upper byte
lbl:
	ADD_A_REG16	regH, regL
.endm

.macro SIGNED_SUB_A_REG16 regH regL ?lbl
	; negate A then add to 16-bit value
	CPL
	INC	A
	SIGNED_ADD_A_REG16	regH, regL
.endm

.macro MUL_DE_BY_A_RET_HL ?lbl1 ?lbl2 ?lbl3
	; Multiply DE by A, return result in HL; preserves: BC
	LD	HL, #0
lbl1:
	SRL	A
	JR	NC, lbl2
	ADD	HL, DE
lbl2:
	JR	Z, lbl3
	SLA	E
	RL	D
	JR	lbl1
lbl3:
.endm

