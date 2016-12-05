;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 3.6.0 #9615 [pic16 port]"
	.file	"../../../RF24_c/utility/XC8/spi.c"
	list	p=18f4620
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_pinMode
	global	_digitalWrite
	global	_digitalRead
	global	_millis
	global	_delay
	global	_delayMicroseconds
	global	_SPI_begin
	global	_SPI_transfer
	global	_mtime

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_DDRDbits
	extern	_TRISDbits
	extern	_DDREbits
	extern	_TRISEbits
	extern	_OSCTUNEbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_EECON1bits
	extern	_RCSTAbits
	extern	_TXSTAbits
	extern	_T3CONbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ECCP1ASbits
	extern	_PWM1CONbits
	extern	_BAUDCONbits
	extern	_BAUDCTLbits
	extern	_CCP2CONbits
	extern	_CCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSPCON2bits
	extern	_SSPCON1bits
	extern	_SSPSTATbits
	extern	_T2CONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_HLVDCONbits
	extern	_LVDCONbits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_stdin
	extern	_stdout
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_DDRD
	extern	_TRISD
	extern	_DDRE
	extern	_TRISE
	extern	_OSCTUNE
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_EECON1
	extern	_EECON2
	extern	_EEDATA
	extern	_EEADR
	extern	_EEADRH
	extern	_RCSTA
	extern	_TXSTA
	extern	_TXREG
	extern	_RCREG
	extern	_SPBRG
	extern	_SPBRGH
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_CMCON
	extern	_CVRCON
	extern	_ECCP1AS
	extern	_PWM1CON
	extern	_BAUDCON
	extern	_BAUDCTL
	extern	_CCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSPCON2
	extern	_SSPCON1
	extern	_SSPSTAT
	extern	_SSPADD
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_HLVDCON
	extern	_LVDCON
	extern	_OSCCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1

udata_spi_0	udata
_mtime	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_spi__SPI_transfer	code
_SPI_transfer:
	.line	250; ../../../RF24_c/utility/XC8/spi.c	uint8_t SPI_transfer(uint8_t data)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	252; ../../../RF24_c/utility/XC8/spi.c	SSPSTATbits.BF = 0;
	BCF	_SSPSTATbits, 0
	.line	253; ../../../RF24_c/utility/XC8/spi.c	SSPBUF = data;  // Put value into SPI buffer
	MOVFF	r0x00, _SSPBUF
_00328_DS_:
	.line	254; ../../../RF24_c/utility/XC8/spi.c	while (!SSPSTATbits.BF);         // Wait for the transfer to finish
	BTFSS	_SSPSTATbits, 0
	BRA	_00328_DS_
	.line	255; ../../../RF24_c/utility/XC8/spi.c	return SSPBUF;
	MOVF	_SSPBUF, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__SPI_begin	code
_SPI_begin:
	.line	224; ../../../RF24_c/utility/XC8/spi.c	void SPI_begin(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	235; ../../../RF24_c/utility/XC8/spi.c	TRISCbits.TRISC4=1; 
	BSF	_TRISCbits, 4
	.line	237; ../../../RF24_c/utility/XC8/spi.c	TRISCbits.TRISC3=0;
	BCF	_TRISCbits, 3
	.line	239; ../../../RF24_c/utility/XC8/spi.c	TRISCbits.TRISC5=0;
	BCF	_TRISCbits, 5
	.line	242; ../../../RF24_c/utility/XC8/spi.c	SSPCON1bits.SSPEN=0;
	BCF	_SSPCON1bits, 5
	.line	243; ../../../RF24_c/utility/XC8/spi.c	SSPSTATbits.CKE=1;
	BSF	_SSPSTATbits, 6
	.line	244; ../../../RF24_c/utility/XC8/spi.c	SSPCON1bits.CKP=0;
	BCF	_SSPCON1bits, 4
	.line	245; ../../../RF24_c/utility/XC8/spi.c	SSPSTATbits.SMP=0;//0
	BCF	_SSPSTATbits, 7
	.line	246; ../../../RF24_c/utility/XC8/spi.c	SSPCON1bits.SSPM=1;// FOSC/16
	MOVF	_SSPCON1bits, W
	ANDLW	0xf0
	IORLW	0x01
	MOVWF	_SSPCON1bits
	.line	247; ../../../RF24_c/utility/XC8/spi.c	SSPCON1bits.SSPEN=1;
	BSF	_SSPCON1bits, 5
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__delayMicroseconds	code
_delayMicroseconds:
	.line	210; ../../../RF24_c/utility/XC8/spi.c	void delayMicroseconds(uint8_t d)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	213; ../../../RF24_c/utility/XC8/spi.c	for(i=0;i<d;i++)
	CLRF	r0x01
	CLRF	r0x02
_00301_DS_:
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVF	r0x04, W
	SUBWF	r0x02, W
	BNZ	_00318_DS_
	MOVF	r0x03, W
	SUBWF	r0x01, W
_00318_DS_:
	BC	_00303_DS_
	.line	214; ../../../RF24_c/utility/XC8/spi.c	for (j =0 ; j < UNREP; j++)
	MOVLW	0x08
	MOVWF	r0x03
	CLRF	r0x04
_00299_DS_:
	NOP
	
	MOVF	r0x03, W
	ADDLW	0xff
	MOVWF	r0x05
	MOVLW	0xff
	ADDWFC	r0x04, W
	MOVWF	r0x06
	MOVFF	r0x05, r0x03
	MOVFF	r0x06, r0x04
	.line	214; ../../../RF24_c/utility/XC8/spi.c	for (j =0 ; j < UNREP; j++)
	MOVF	r0x05, W
	IORWF	r0x06, W
	BNZ	_00299_DS_
	.line	213; ../../../RF24_c/utility/XC8/spi.c	for(i=0;i<d;i++)
	INFSNZ	r0x01, F
	INCF	r0x02, F
	BRA	_00301_DS_
_00303_DS_:
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__delay	code
_delay:
	.line	181; ../../../RF24_c/utility/XC8/spi.c	void delay(uint16_t val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	186; ../../../RF24_c/utility/XC8/spi.c	for (i =0; i< val; i++)
	CLRF	r0x02
	CLRF	r0x03
_00273_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00290_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00290_DS_:
	BC	_00275_DS_
	.line	189; ../../../RF24_c/utility/XC8/spi.c	for (j =0 ; j < NREP; j++)
	MOVLW	0x20
	MOVWF	r0x04
	MOVLW	0x03
	MOVWF	r0x05
_00271_DS_:
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	
	MOVF	r0x04, W
	ADDLW	0xff
	MOVWF	r0x06
	MOVLW	0xff
	ADDWFC	r0x05, W
	MOVWF	r0x07
	MOVFF	r0x06, r0x04
	MOVFF	r0x07, r0x05
	.line	189; ../../../RF24_c/utility/XC8/spi.c	for (j =0 ; j < NREP; j++)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00271_DS_
	.line	186; ../../../RF24_c/utility/XC8/spi.c	for (i =0; i< val; i++)
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00273_DS_
_00275_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__millis	code
_millis:
	.line	173; ../../../RF24_c/utility/XC8/spi.c	long millis(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	175; ../../../RF24_c/utility/XC8/spi.c	return mtime;
	MOVFF	(_mtime + 3), FSR0L
	MOVFF	(_mtime + 2), PRODH
	MOVFF	(_mtime + 1), PRODL
	BANKSEL	_mtime
	MOVF	_mtime, W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__digitalRead	code
_digitalRead:
	.line	117; ../../../RF24_c/utility/XC8/spi.c	uint8_t digitalRead(uint8_t pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	119; ../../../RF24_c/utility/XC8/spi.c	uint8_t ret =0;  
	CLRF	r0x01
	.line	121; ../../../RF24_c/utility/XC8/spi.c	switch(pin)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00246_DS_
	MOVLW	0x29
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00246_DS_
	DECF	r0x00, F
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00257_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00257_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00257_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00257_DS_:
	GOTO	_00209_DS_
	GOTO	_00210_DS_
	GOTO	_00211_DS_
	GOTO	_00212_DS_
	GOTO	_00213_DS_
	GOTO	_00214_DS_
	GOTO	_00215_DS_
	GOTO	_00216_DS_
	GOTO	_00217_DS_
	GOTO	_00218_DS_
	GOTO	_00246_DS_
	GOTO	_00246_DS_
	GOTO	_00219_DS_
	GOTO	_00220_DS_
	GOTO	_00221_DS_
	GOTO	_00222_DS_
	GOTO	_00223_DS_
	GOTO	_00224_DS_
	GOTO	_00225_DS_
	GOTO	_00226_DS_
	GOTO	_00227_DS_
	GOTO	_00228_DS_
	GOTO	_00229_DS_
	GOTO	_00230_DS_
	GOTO	_00231_DS_
	GOTO	_00232_DS_
	GOTO	_00233_DS_
	GOTO	_00234_DS_
	GOTO	_00235_DS_
	GOTO	_00236_DS_
	GOTO	_00246_DS_
	GOTO	_00246_DS_
	GOTO	_00237_DS_
	GOTO	_00238_DS_
	GOTO	_00239_DS_
	GOTO	_00240_DS_
	GOTO	_00241_DS_
	GOTO	_00242_DS_
	GOTO	_00243_DS_
	GOTO	_00244_DS_
_00209_DS_:
	.line	123; ../../../RF24_c/utility/XC8/spi.c	case 1: ret= PORTEbits.RE3; break;
	CLRF	r0x00
	BTFSC	_PORTEbits, 3
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00210_DS_:
	.line	124; ../../../RF24_c/utility/XC8/spi.c	case 2: ret= PORTAbits.RA0; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 0
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00211_DS_:
	.line	125; ../../../RF24_c/utility/XC8/spi.c	case 3: ret= PORTAbits.RA1; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 1
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00212_DS_:
	.line	126; ../../../RF24_c/utility/XC8/spi.c	case 4: ret= PORTAbits.RA2; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 2
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00213_DS_:
	.line	127; ../../../RF24_c/utility/XC8/spi.c	case 5: ret= PORTAbits.RA3; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 3
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00214_DS_:
	.line	128; ../../../RF24_c/utility/XC8/spi.c	case 6: ret= PORTAbits.RA4; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 4
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00215_DS_:
	.line	129; ../../../RF24_c/utility/XC8/spi.c	case 7: ret= PORTAbits.RA5; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 5
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00216_DS_:
	.line	130; ../../../RF24_c/utility/XC8/spi.c	case 8: ret= PORTEbits.RE0; break;
	CLRF	r0x00
	BTFSC	_PORTEbits, 0
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00217_DS_:
	.line	131; ../../../RF24_c/utility/XC8/spi.c	case 9: ret= PORTEbits.RE1; break;
	CLRF	r0x00
	BTFSC	_PORTEbits, 1
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00218_DS_:
	.line	132; ../../../RF24_c/utility/XC8/spi.c	case 10: ret= PORTEbits.RE2; break;
	CLRF	r0x00
	BTFSC	_PORTEbits, 2
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00219_DS_:
	.line	136; ../../../RF24_c/utility/XC8/spi.c	case 13: ret= PORTAbits.RA7; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 7
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00220_DS_:
	.line	138; ../../../RF24_c/utility/XC8/spi.c	case 14: ret= PORTAbits.RA6; break;
	CLRF	r0x00
	BTFSC	_PORTAbits, 6
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00221_DS_:
	.line	139; ../../../RF24_c/utility/XC8/spi.c	case 15: ret= PORTCbits.RC0; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 0
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00222_DS_:
	.line	140; ../../../RF24_c/utility/XC8/spi.c	case 16: ret= PORTCbits.RC1; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 1
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00223_DS_:
	.line	141; ../../../RF24_c/utility/XC8/spi.c	case 17: ret= PORTCbits.RC2; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 2
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00224_DS_:
	.line	143; ../../../RF24_c/utility/XC8/spi.c	case 18: ret= PORTCbits.RC3; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 3
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00225_DS_:
	.line	145; ../../../RF24_c/utility/XC8/spi.c	case 19: ret= PORTDbits.RD0; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 0
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00226_DS_:
	.line	146; ../../../RF24_c/utility/XC8/spi.c	case 20: ret= PORTDbits.RD1; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 1
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00227_DS_:
	.line	147; ../../../RF24_c/utility/XC8/spi.c	case 21: ret= PORTDbits.RD2; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 2
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00228_DS_:
	.line	148; ../../../RF24_c/utility/XC8/spi.c	case 22: ret= PORTDbits.RD3; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 3
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00229_DS_:
	.line	149; ../../../RF24_c/utility/XC8/spi.c	case 23: ret= PORTCbits.RC4; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 4
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00230_DS_:
	.line	150; ../../../RF24_c/utility/XC8/spi.c	case 24: ret= PORTCbits.RC5; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 5
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00231_DS_:
	.line	151; ../../../RF24_c/utility/XC8/spi.c	case 25: ret= PORTCbits.RC6; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 6
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00232_DS_:
	.line	152; ../../../RF24_c/utility/XC8/spi.c	case 26: ret= PORTCbits.RC7; break;
	CLRF	r0x00
	BTFSC	_PORTCbits, 7
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00233_DS_:
	.line	153; ../../../RF24_c/utility/XC8/spi.c	case 27: ret= PORTDbits.RD4; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 4
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00234_DS_:
	.line	154; ../../../RF24_c/utility/XC8/spi.c	case 28: ret= PORTDbits.RD5; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 5
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00235_DS_:
	.line	155; ../../../RF24_c/utility/XC8/spi.c	case 29: ret= PORTDbits.RD6; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 6
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00236_DS_:
	.line	156; ../../../RF24_c/utility/XC8/spi.c	case 30: ret= PORTDbits.RD7; break;
	CLRF	r0x00
	BTFSC	_PORTDbits, 7
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00237_DS_:
	.line	159; ../../../RF24_c/utility/XC8/spi.c	case 33: ret= PORTBbits.RB0; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 0
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00238_DS_:
	.line	160; ../../../RF24_c/utility/XC8/spi.c	case 34: ret= PORTBbits.RB1; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 1
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00239_DS_:
	.line	161; ../../../RF24_c/utility/XC8/spi.c	case 35: ret= PORTBbits.RB2; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 2
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00240_DS_:
	.line	162; ../../../RF24_c/utility/XC8/spi.c	case 36: ret= PORTBbits.RB3; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 3
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00241_DS_:
	.line	163; ../../../RF24_c/utility/XC8/spi.c	case 37: ret= PORTBbits.RB4; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 4
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00242_DS_:
	.line	164; ../../../RF24_c/utility/XC8/spi.c	case 38: ret= PORTBbits.RB5; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 5
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00243_DS_:
	.line	165; ../../../RF24_c/utility/XC8/spi.c	case 39: ret= PORTBbits.RB6; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 6
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	BRA	_00246_DS_
_00244_DS_:
	.line	166; ../../../RF24_c/utility/XC8/spi.c	case 40: ret= PORTBbits.RB7; break;
	CLRF	r0x00
	BTFSC	_PORTBbits, 7
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
_00246_DS_:
	.line	170; ../../../RF24_c/utility/XC8/spi.c	return ret;  
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__digitalWrite	code
_digitalWrite:
	.line	62; ../../../RF24_c/utility/XC8/spi.c	void digitalWrite(uint8_t pin,uint8_t mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	64; ../../../RF24_c/utility/XC8/spi.c	switch(pin)
	MOVLW	0x02
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00194_DS_
	MOVLW	0x29
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00194_DS_
	MOVLW	0xfe
	ADDWF	r0x00, F
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00204_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00204_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00204_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00204_DS_:
	GOTO	_00157_DS_
	GOTO	_00158_DS_
	GOTO	_00159_DS_
	GOTO	_00160_DS_
	GOTO	_00161_DS_
	GOTO	_00162_DS_
	GOTO	_00163_DS_
	GOTO	_00164_DS_
	GOTO	_00165_DS_
	GOTO	_00194_DS_
	GOTO	_00194_DS_
	GOTO	_00166_DS_
	GOTO	_00167_DS_
	GOTO	_00168_DS_
	GOTO	_00169_DS_
	GOTO	_00170_DS_
	GOTO	_00171_DS_
	GOTO	_00172_DS_
	GOTO	_00173_DS_
	GOTO	_00174_DS_
	GOTO	_00175_DS_
	GOTO	_00176_DS_
	GOTO	_00177_DS_
	GOTO	_00178_DS_
	GOTO	_00179_DS_
	GOTO	_00180_DS_
	GOTO	_00181_DS_
	GOTO	_00182_DS_
	GOTO	_00183_DS_
	GOTO	_00194_DS_
	GOTO	_00194_DS_
	GOTO	_00184_DS_
	GOTO	_00185_DS_
	GOTO	_00186_DS_
	GOTO	_00187_DS_
	GOTO	_00188_DS_
	GOTO	_00189_DS_
	GOTO	_00190_DS_
	GOTO	_00191_DS_
_00157_DS_:
	.line	67; ../../../RF24_c/utility/XC8/spi.c	case 2: LATAbits.LATA0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00158_DS_:
	.line	68; ../../../RF24_c/utility/XC8/spi.c	case 3: LATAbits.LATA1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00159_DS_:
	.line	69; ../../../RF24_c/utility/XC8/spi.c	case 4: LATAbits.LATA2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00160_DS_:
	.line	70; ../../../RF24_c/utility/XC8/spi.c	case 5: LATAbits.LATA3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00161_DS_:
	.line	71; ../../../RF24_c/utility/XC8/spi.c	case 6: LATAbits.LATA4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00162_DS_:
	.line	72; ../../../RF24_c/utility/XC8/spi.c	case 7: LATAbits.LATA5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00163_DS_:
	.line	73; ../../../RF24_c/utility/XC8/spi.c	case 8: LATEbits.LATE0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATEbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATEbits
	BRA	_00194_DS_
_00164_DS_:
	.line	74; ../../../RF24_c/utility/XC8/spi.c	case 9: LATEbits.LATE1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATEbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATEbits
	BRA	_00194_DS_
_00165_DS_:
	.line	75; ../../../RF24_c/utility/XC8/spi.c	case 10: LATEbits.LATE2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATEbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATEbits
	BRA	_00194_DS_
_00166_DS_:
	.line	79; ../../../RF24_c/utility/XC8/spi.c	case 13: LATAbits.LATA7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00167_DS_:
	.line	81; ../../../RF24_c/utility/XC8/spi.c	case 14: LATAbits.LATA6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00194_DS_
_00168_DS_:
	.line	82; ../../../RF24_c/utility/XC8/spi.c	case 15: LATCbits.LATC0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00169_DS_:
	.line	83; ../../../RF24_c/utility/XC8/spi.c	case 16: LATCbits.LATC1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00170_DS_:
	.line	84; ../../../RF24_c/utility/XC8/spi.c	case 17: LATCbits.LATC2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00171_DS_:
	.line	86; ../../../RF24_c/utility/XC8/spi.c	case 18: LATCbits.LATC3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00172_DS_:
	.line	88; ../../../RF24_c/utility/XC8/spi.c	case 19: LATDbits.LATD0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00173_DS_:
	.line	89; ../../../RF24_c/utility/XC8/spi.c	case 20: LATDbits.LATD1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00174_DS_:
	.line	90; ../../../RF24_c/utility/XC8/spi.c	case 21: LATDbits.LATD2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00175_DS_:
	.line	91; ../../../RF24_c/utility/XC8/spi.c	case 22: LATDbits.LATD3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00176_DS_:
	.line	93; ../../../RF24_c/utility/XC8/spi.c	case 23: LATCbits.LATC4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00177_DS_:
	.line	94; ../../../RF24_c/utility/XC8/spi.c	case 24: LATCbits.LATC5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00178_DS_:
	.line	96; ../../../RF24_c/utility/XC8/spi.c	case 25: LATCbits.LATC6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00179_DS_:
	.line	97; ../../../RF24_c/utility/XC8/spi.c	case 26: LATCbits.LATC7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATCbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_LATCbits
	BRA	_00194_DS_
_00180_DS_:
	.line	98; ../../../RF24_c/utility/XC8/spi.c	case 27: LATDbits.LATD4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00181_DS_:
	.line	99; ../../../RF24_c/utility/XC8/spi.c	case 28: LATDbits.LATD5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00182_DS_:
	.line	100; ../../../RF24_c/utility/XC8/spi.c	case 29: LATDbits.LATD6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00183_DS_:
	.line	101; ../../../RF24_c/utility/XC8/spi.c	case 30: LATDbits.LATD7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATDbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_LATDbits
	BRA	_00194_DS_
_00184_DS_:
	.line	104; ../../../RF24_c/utility/XC8/spi.c	case 33: LATBbits.LATB0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00185_DS_:
	.line	105; ../../../RF24_c/utility/XC8/spi.c	case 34: LATBbits.LATB1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00186_DS_:
	.line	106; ../../../RF24_c/utility/XC8/spi.c	case 35: LATBbits.LATB2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00187_DS_:
	.line	107; ../../../RF24_c/utility/XC8/spi.c	case 36: LATBbits.LATB3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00188_DS_:
	.line	108; ../../../RF24_c/utility/XC8/spi.c	case 37: LATBbits.LATB4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00189_DS_:
	.line	109; ../../../RF24_c/utility/XC8/spi.c	case 38: LATBbits.LATB5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00190_DS_:
	.line	110; ../../../RF24_c/utility/XC8/spi.c	case 39: LATBbits.LATB6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_LATBbits
	BRA	_00194_DS_
_00191_DS_:
	.line	111; ../../../RF24_c/utility/XC8/spi.c	case 40: LATBbits.LATB7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATBbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_LATBbits
_00194_DS_:
	.line	113; ../../../RF24_c/utility/XC8/spi.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_spi__pinMode	code
_pinMode:
	.line	8; ../../../RF24_c/utility/XC8/spi.c	void pinMode(uint8_t pin,uint8_t mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	10; ../../../RF24_c/utility/XC8/spi.c	switch(pin)
	MOVLW	0x02
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00142_DS_
	MOVLW	0x29
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00142_DS_
	MOVLW	0xfe
	ADDWF	r0x00, F
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00152_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00152_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00152_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00152_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
	GOTO	_00111_DS_
	GOTO	_00112_DS_
	GOTO	_00113_DS_
	GOTO	_00142_DS_
	GOTO	_00142_DS_
	GOTO	_00114_DS_
	GOTO	_00115_DS_
	GOTO	_00116_DS_
	GOTO	_00117_DS_
	GOTO	_00118_DS_
	GOTO	_00119_DS_
	GOTO	_00120_DS_
	GOTO	_00121_DS_
	GOTO	_00122_DS_
	GOTO	_00123_DS_
	GOTO	_00124_DS_
	GOTO	_00125_DS_
	GOTO	_00126_DS_
	GOTO	_00127_DS_
	GOTO	_00128_DS_
	GOTO	_00129_DS_
	GOTO	_00130_DS_
	GOTO	_00131_DS_
	GOTO	_00142_DS_
	GOTO	_00142_DS_
	GOTO	_00132_DS_
	GOTO	_00133_DS_
	GOTO	_00134_DS_
	GOTO	_00135_DS_
	GOTO	_00136_DS_
	GOTO	_00137_DS_
	GOTO	_00138_DS_
	GOTO	_00139_DS_
_00105_DS_:
	.line	13; ../../../RF24_c/utility/XC8/spi.c	case 2: TRISAbits.RA0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00106_DS_:
	.line	14; ../../../RF24_c/utility/XC8/spi.c	case 3: TRISAbits.RA1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00107_DS_:
	.line	15; ../../../RF24_c/utility/XC8/spi.c	case 4: TRISAbits.RA2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00108_DS_:
	.line	16; ../../../RF24_c/utility/XC8/spi.c	case 5: TRISAbits.RA3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00109_DS_:
	.line	17; ../../../RF24_c/utility/XC8/spi.c	case 6: TRISAbits.RA4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00110_DS_:
	.line	18; ../../../RF24_c/utility/XC8/spi.c	case 7: TRISAbits.RA5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00111_DS_:
	.line	19; ../../../RF24_c/utility/XC8/spi.c	case 8: TRISEbits.RE0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISEbits
	BRA	_00142_DS_
_00112_DS_:
	.line	20; ../../../RF24_c/utility/XC8/spi.c	case 9: TRISEbits.RE1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISEbits
	BRA	_00142_DS_
_00113_DS_:
	.line	21; ../../../RF24_c/utility/XC8/spi.c	case 10: TRISEbits.RE2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISEbits
	BRA	_00142_DS_
_00114_DS_:
	.line	25; ../../../RF24_c/utility/XC8/spi.c	case 13: TRISAbits.RA7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00115_DS_:
	.line	27; ../../../RF24_c/utility/XC8/spi.c	case 14: TRISAbits.RA6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00142_DS_
_00116_DS_:
	.line	28; ../../../RF24_c/utility/XC8/spi.c	case 15: TRISCbits.RC0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00117_DS_:
	.line	29; ../../../RF24_c/utility/XC8/spi.c	case 16: TRISCbits.RC1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00118_DS_:
	.line	30; ../../../RF24_c/utility/XC8/spi.c	case 17: TRISCbits.RC2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00119_DS_:
	.line	32; ../../../RF24_c/utility/XC8/spi.c	case 18: TRISCbits.RC3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00120_DS_:
	.line	34; ../../../RF24_c/utility/XC8/spi.c	case 19: TRISDbits.RD0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00121_DS_:
	.line	35; ../../../RF24_c/utility/XC8/spi.c	case 20: TRISDbits.RD1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00122_DS_:
	.line	36; ../../../RF24_c/utility/XC8/spi.c	case 21: TRISDbits.RD2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00123_DS_:
	.line	37; ../../../RF24_c/utility/XC8/spi.c	case 22: TRISDbits.RD3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00124_DS_:
	.line	39; ../../../RF24_c/utility/XC8/spi.c	case 23: TRISCbits.RC4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00125_DS_:
	.line	40; ../../../RF24_c/utility/XC8/spi.c	case 24: TRISCbits.RC5=mode; break; 
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00126_DS_:
	.line	42; ../../../RF24_c/utility/XC8/spi.c	case 25: TRISCbits.RC6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00127_DS_:
	.line	43; ../../../RF24_c/utility/XC8/spi.c	case 26: TRISCbits.RC7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISCbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_TRISCbits
	BRA	_00142_DS_
_00128_DS_:
	.line	44; ../../../RF24_c/utility/XC8/spi.c	case 27: TRISDbits.RD4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00129_DS_:
	.line	45; ../../../RF24_c/utility/XC8/spi.c	case 28: TRISDbits.RD5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00130_DS_:
	.line	46; ../../../RF24_c/utility/XC8/spi.c	case 29: TRISDbits.RD6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00131_DS_:
	.line	47; ../../../RF24_c/utility/XC8/spi.c	case 30: TRISDbits.RD7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISDbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_TRISDbits
	BRA	_00142_DS_
_00132_DS_:
	.line	50; ../../../RF24_c/utility/XC8/spi.c	case 33: TRISBbits.RB0=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00133_DS_:
	.line	51; ../../../RF24_c/utility/XC8/spi.c	case 34: TRISBbits.RB1=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00134_DS_:
	.line	52; ../../../RF24_c/utility/XC8/spi.c	case 35: TRISBbits.RB2=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00135_DS_:
	.line	53; ../../../RF24_c/utility/XC8/spi.c	case 36: TRISBbits.RB3=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00136_DS_:
	.line	54; ../../../RF24_c/utility/XC8/spi.c	case 37: TRISBbits.RB4=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00137_DS_:
	.line	55; ../../../RF24_c/utility/XC8/spi.c	case 38: TRISBbits.RB5=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00138_DS_:
	.line	56; ../../../RF24_c/utility/XC8/spi.c	case 39: TRISBbits.RB6=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_TRISBbits
	BRA	_00142_DS_
_00139_DS_:
	.line	57; ../../../RF24_c/utility/XC8/spi.c	case 40: TRISBbits.RB7=mode; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISBbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_TRISBbits
_00142_DS_:
	.line	59; ../../../RF24_c/utility/XC8/spi.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 2894 (0x0b4e) bytes ( 2.21%)
;           	 1447 (0x05a7) words
; udata size:	    4 (0x0004) bytes ( 0.10%)
; access size:	    8 (0x0008) bytes


	end
