	.include        "global.s"
	.area	_SFR (ABS)

	.org	.P1
_P1_REG::	; Joystick: 1.1.P15.P14.P13.P12.P11.P10 */ 
	.ds	1
	.org	.SB
_SB_REG::	; Serial IO data buffer */
	.ds	1
	.org	.SC
_SC_REG::	; Serial IO control register */
	.ds	1
	.org	.DIV
_DIV_REG::	; Divider register */
	.ds	1
	.org	.TIMA
_TIMA_REG::	; Timer counter */
	.ds	1
	.org	.TMA
_TMA_REG::	; Timer modulo */
	.ds	1
	.org	.TAC
_TAC_REG::	; Timer control */
	.ds	1
	.org	.IF
_IF_REG::	; Interrupt flags: 0.0.0.JOY.SIO.TIM.LCD.VBL */ 
	.ds	1
	.org	.NR10
_NR10_REG::	; Sound register */
	.ds	1
	.org	.NR11
_NR11_REG::	; Sound register */
	.ds	1
	.org	.NR12
_NR12_REG::	; Sound register */
	.ds	1
	.org	.NR13
_NR13_REG::	; Sound register */
	.ds	1
	.org	.NR14
_NR14_REG::	; Sound register */
	.ds	1
	.org	.NR21
_NR21_REG::	; Sound register */
	.ds	1
	.org	.NR22
_NR22_REG::	; Sound register */
	.ds	1
	.org	.NR23
_NR23_REG::	; Sound register */
	.ds	1
	.org	.NR24
_NR24_REG::	; Sound register */
	.ds	1
	.org	.NR30
_NR30_REG::	; Sound register */
	.ds	1
	.org	.NR31
_NR31_REG::	; Sound register */
	.ds	1
	.org	.NR32
_NR32_REG::	; Sound register */
	.ds	1
	.org	.NR33
_NR33_REG::	; Sound register */
	.ds	1
	.org	.NR34
_NR34_REG::	; Sound register */
	.ds	1
	.org	.NR41
_NR41_REG::	; Sound register */
	.ds	1
	.org	.NR42
_NR42_REG::	; Sound register */
	.ds	1
	.org	.NR43
_NR43_REG::	; Sound register */
	.ds	1
	.org	.NR44
_NR44_REG::	; Sound register */
	.ds	1
	.org	.NR50
_NR50_REG::	; Sound register */
	.ds	1
	.org	.NR51
_NR51_REG::	; Sound register */
	.ds	1
	.org	.NR52
_NR52_REG::	; Sound register */
	.ds	1
	.org	.LCDC
_LCDC_REG::	; LCD control */
	.ds	1
	.org	.STAT
_STAT_REG::	; LCD status */
	.ds	1
	.org	.SCY
_SCY_REG::	; Scroll Y */
	.ds	1
	.org	.SCX
_SCX_REG::	; Scroll X */
	.ds	1
	.org	.LY
_LY_REG::	; LCDC Y-coordinate */
	.ds	1
	.org	.LYC
_LYC_REG::	; LY compare */
	.ds	1
	.org	.DMA
_DMA_REG::	; DMA transfer */
	.ds	1
	.org	.BGP
_BGP_REG::	; BG palette data */
	.ds	1
	.org	.OBP0
_OBP0_REG::	; OBJ palette 0 data */
	.ds	1
	.org	.OBP1
_OBP1_REG::	; OBJ palette 1 data */
	.ds	1
	.org	.WY
_WY_REG::	; Window Y coordinate */
	.ds	1
	.org	.WX
_WX_REG::	; Window X coordinate */
	.ds	1
	.org	.KEY1
_KEY1_REG::	; CPU speed */
	.ds	1
	.org	.VBK
_VBK_REG::	; VRAM bank */
	.ds	1
	.org	.HDMA1
_HDMA1_REG::	; DMA control 1 */
	.ds	1
	.org	.HDMA2
_HDMA2_REG::	; DMA control 2 */
	.ds	1
	.org	.HDMA3
_HDMA3_REG::	; DMA control 3 */
	.ds	1
	.org	.HDMA4
_HDMA4_REG::	; DMA control 4 */
	.ds	1
	.org	.HDMA5
_HDMA5_REG::	; DMA control 5 */
	.ds	1
	.org	.RP
_RP_REG::	; IR port */
	.ds	1
	.org	.BCPS
_BCPS_REG::	; BG color palette specification */ 
	.ds	1
	.org	.BCPD
_BCPD_REG::	; BG color palette data */
	.ds	1
	.org	.OCPS
_OCPS_REG::	; OBJ color palette specification */ 
	.ds	1
	.org	.OCPD
_OCPD_REG::	; OBJ color palette data 
	.ds	1
	.org	.SVBK
_SVBK_REG::	; WRAM bank */
	.ds	1
	.org	.IE
_IE_REG::	; Interrupt enable */ 
	.ds	1