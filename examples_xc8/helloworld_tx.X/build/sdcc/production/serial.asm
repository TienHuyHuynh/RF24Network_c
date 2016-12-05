;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 3.6.0 #9615 [pic16 port]"
	.file	"serial.c"
	list	p=18f4620
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_buff
	global	_Serial_begin
	global	_Serial_tx
	global	_Serial_print
	global	_Serial_println
	global	_Serial_rx
	global	_itoa_

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget1
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
	extern	_mtime
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
	extern	_ultoa
	extern	_delay
	extern	__mullong
	extern	__divulong

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTINC1	equ	0xfe6
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

udata_serial_0	udata
_buff	res	10

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_serial__itoa_	code
_itoa_:
	.line	106; serial.c	const char * itoa_(uint32_t val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	.line	111; serial.c	ultoa(val,buff,10);
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_buff)
	MOVWF	POSTDEC1
	MOVLW	LOW(_buff)
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
	.line	113; serial.c	return buff;
	MOVLW	HIGH(_buff)
	MOVWF	r0x01
	MOVLW	LOW(_buff)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_serial__Serial_rx	code
_Serial_rx:
	.line	82; serial.c	unsigned char Serial_rx(unsigned int timeout)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	86; serial.c	if(RCSTAbits.FERR || RCSTAbits.OERR)//trata erro
	BTFSC	_RCSTAbits, 2
	BRA	_00131_DS_
	BTFSS	_RCSTAbits, 1
	BRA	_00147_DS_
_00131_DS_:
	.line	88; serial.c	RCSTAbits.CREN=0;
	BCF	_RCSTAbits, 4
	.line	89; serial.c	RCSTAbits.CREN=1;
	BSF	_RCSTAbits, 4
_00147_DS_:
	.line	92; serial.c	while(((to < timeout)||(!timeout))&&(!PIR1bits.RCIF))
	CLRF	r0x02
	CLRF	r0x03
_00136_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00160_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00160_DS_:
	BNC	_00135_DS_
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00138_DS_
_00135_DS_:
	BTFSC	_PIR1bits, 5
	BRA	_00138_DS_
	.line	94; serial.c	delay(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	95; serial.c	to+=20; 
	MOVLW	0x14
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00136_DS_
_00138_DS_:
	.line	97; serial.c	if(PIR1bits.RCIF)
	BTFSS	_PIR1bits, 5
	BRA	_00140_DS_
	.line	98; serial.c	return RCREG;
	MOVF	_RCREG, W
	BRA	_00142_DS_
_00140_DS_:
	.line	100; serial.c	return 0xA5;
	MOVLW	0xa5
_00142_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_serial__Serial_println	code
_Serial_println:
	.line	76; serial.c	void Serial_println(const char* val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	78; serial.c	Serial_print(val);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	79; serial.c	Serial_print("\r\n");
	MOVLW	UPPER(___str_0)
	MOVWF	r0x02
	MOVLW	HIGH(___str_0)
	MOVWF	r0x01
	MOVLW	LOW(___str_0)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_serial__Serial_print	code
_Serial_print:
	.line	65; serial.c	void Serial_print(const char* val)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	69; serial.c	while(val[i])
	CLRF	r0x03
	CLRF	r0x04
_00118_DS_:
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	MOVF	r0x04, W
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVF	r0x05, W
	BZ	_00121_DS_
	.line	71; serial.c	Serial_tx(val[i]);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Serial_tx
	MOVF	POSTINC1, F
	.line	72; serial.c	i++; 
	INFSNZ	r0x03, F
	INCF	r0x04, F
	BRA	_00118_DS_
_00121_DS_:
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
S_serial__Serial_tx	code
_Serial_tx:
	.line	59; serial.c	void Serial_tx(const unsigned char val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _TXREG
_00110_DS_:
	.line	62; serial.c	while(!TXSTAbits.TRMT);
	BTFSS	_TXSTAbits, 1
	BRA	_00110_DS_
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_serial__Serial_begin	code
_Serial_begin:
	.line	31; serial.c	void Serial_begin(unsigned long baud)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	.line	33; serial.c	TRISCbits.TRISC6=1;
	BSF	_TRISCbits, 6
	.line	34; serial.c	TRISCbits.TRISC7=1;
	BSF	_TRISCbits, 7
	.line	36; serial.c	baud=((_XTAL_FREQ/(4*baud))-1);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0x48
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x04, W
	ADDLW	0xff
	MOVWF	r0x00
	MOVLW	0xff
	ADDWFC	r0x05, W
	MOVWF	r0x01
	MOVLW	0xff
	ADDWFC	r0x06, W
	MOVWF	r0x02
	MOVLW	0xff
	ADDWFC	r0x07, W
	MOVWF	r0x03
	.line	42; serial.c	SPBRG= (0x00FF & baud); //baud rate de 115200 - 32MHz
	MOVF	r0x00, W
	MOVWF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_SPBRG
	.line	43; serial.c	SPBRGH=(0xFF00 & baud)>>8; 
	CLRF	r0x00
	CLRF	r0x02
	CLRF	r0x03
	MOVF	r0x01, W
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	r0x01
	MOVF	r0x03, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVF	r0x00, W
	MOVWF	_SPBRGH
	.line	46; serial.c	TXSTAbits.TX9=0;    //transmissao em 8 bits
	BCF	_TXSTAbits, 6
	.line	47; serial.c	TXSTAbits.SYNC=0;  //modo assincrono
	BCF	_TXSTAbits, 4
	.line	48; serial.c	TXSTAbits.BRGH=1;  //high baud rate
	BSF	_TXSTAbits, 2
	.line	49; serial.c	BAUDCONbits.BRG16=1; //16 bits baud rate
	BSF	_BAUDCONbits, 3
	.line	50; serial.c	RCSTAbits.RX9=0;   //recepcao em 8 bits
	BCF	_RCSTAbits, 6
	.line	51; serial.c	RCSTAbits.CREN=1;  //recepcao continua
	BSF	_RCSTAbits, 4
	.line	52; serial.c	TXSTAbits.TXEN=1;  //habilita transmissao
	BSF	_TXSTAbits, 5
	.line	53; serial.c	RCSTAbits.SPEN=1;  //habilita porta serial - rx
	BSF	_RCSTAbits, 7
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
___str_0:
	DB	0x0d, 0x0a, 0x00


; Statistics:
; code size:	  840 (0x0348) bytes ( 0.64%)
;           	  420 (0x01a4) words
; udata size:	   10 (0x000a) bytes ( 0.26%)
; access size:	    8 (0x0008) bytes


	end
