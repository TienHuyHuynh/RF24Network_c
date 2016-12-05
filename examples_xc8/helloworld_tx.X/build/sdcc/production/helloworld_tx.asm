;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 3.6.0 #9615 [pic16 port]"
	.file	"helloworld_tx.c"
	list	p=18f4620
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_last_sent
	global	_packets_sent
	global	_setup
	global	_loop
	global	_this_node
	global	_other_node
	global	_interval

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
	extern	_millis
	extern	_RF24NH_init
	extern	_RF24N_init
	extern	_RF24N_update
	extern	_RF24N_write_m
	extern	_RF24N_begin_d
	extern	_RF24_init
	extern	_RF24_begin
	extern	_Serial_begin
	extern	_Serial_print
	extern	_Serial_println

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
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
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1

udata_helloworld_tx_0	udata
_last_sent	res	4

udata_helloworld_tx_1	udata
_packets_sent	res	4

udata_helloworld_tx_2	udata
_loop_payload_2_176	res	8

udata_helloworld_tx_3	udata
_loop_header_2_176	res	8

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_helloworld_tx__loop	code
_loop:
	.line	52; helloworld_tx.c	void loop() {
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	.line	54; helloworld_tx.c	RF24N_update();                          // Check the network regularly
	CALL	_RF24N_update
	.line	57; helloworld_tx.c	now = millis();              // If it's time to send a message, send it!
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BANKSEL	_last_sent
	.line	58; helloworld_tx.c	if ( now - last_sent >= interval  )
	MOVF	_last_sent, W, B
	SUBWF	r0x00, W
	MOVWF	r0x04
	BANKSEL	(_last_sent + 1)
	MOVF	(_last_sent + 1), W, B
	SUBWFB	r0x01, W
	MOVWF	r0x05
	BANKSEL	(_last_sent + 2)
	MOVF	(_last_sent + 2), W, B
	SUBWFB	r0x02, W
	MOVWF	r0x06
	BANKSEL	(_last_sent + 3)
	MOVF	(_last_sent + 3), W, B
	SUBWFB	r0x03, W
	MOVWF	r0x07
	MOVLW	LOW(_interval)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_interval)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_interval)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x08
	TBLRD*+	
	MOVFF	TABLAT, r0x09
	TBLRD*+	
	MOVFF	TABLAT, r0x0a
	TBLRD*+	
	MOVFF	TABLAT, r0x0b
	MOVF	r0x0b, W
	SUBWF	r0x07, W
	BNZ	_00123_DS_
	MOVF	r0x0a, W
	SUBWF	r0x06, W
	BNZ	_00123_DS_
	MOVF	r0x09, W
	SUBWF	r0x05, W
	BNZ	_00123_DS_
	MOVF	r0x08, W
	SUBWF	r0x04, W
_00123_DS_:
	BTFSS	STATUS, 0
	BRA	_00115_DS_
	.line	64; helloworld_tx.c	last_sent = now;
	MOVFF	r0x00, _last_sent
	MOVFF	r0x01, (_last_sent + 1)
	MOVFF	r0x02, (_last_sent + 2)
	MOVFF	r0x03, (_last_sent + 3)
	.line	66; helloworld_tx.c	Serial_print("Sending...");
	MOVLW	UPPER(___str_1)
	MOVWF	r0x02
	MOVLW	HIGH(___str_1)
	MOVWF	r0x01
	MOVLW	LOW(___str_1)
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
	.line	68; helloworld_tx.c	payload.ms=  millis();
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVF	r0x00, W
	BANKSEL	_loop_payload_2_176
	MOVWF	_loop_payload_2_176, B
	MOVF	r0x01, W
	BANKSEL	(_loop_payload_2_176 + 1)
	MOVWF	(_loop_payload_2_176 + 1), B
	MOVF	r0x02, W
	BANKSEL	(_loop_payload_2_176 + 2)
	MOVWF	(_loop_payload_2_176 + 2), B
	MOVF	r0x03, W
	BANKSEL	(_loop_payload_2_176 + 3)
	MOVWF	(_loop_payload_2_176 + 3), B
	.line	69; helloworld_tx.c	payload.counter=packets_sent++;
	MOVFF	_packets_sent, r0x00
	MOVFF	(_packets_sent + 1), r0x01
	MOVFF	(_packets_sent + 2), r0x02
	MOVFF	(_packets_sent + 3), r0x03
	BANKSEL	_packets_sent
	INCF	_packets_sent, F, B
	BNC	_00124_DS_
	BANKSEL	(_packets_sent + 1)
	INCF	(_packets_sent + 1), F, B
	BNC	_00124_DS_
	BANKSEL	(_packets_sent + 2)
	INCFSZ	(_packets_sent + 2), F, B
	BRA	_10110_DS_
	BANKSEL	(_packets_sent + 3)
	INCF	(_packets_sent + 3), F, B
_10110_DS_:
_00124_DS_:
	MOVF	r0x00, W
	BANKSEL	(_loop_payload_2_176 + 4)
	MOVWF	(_loop_payload_2_176 + 4), B
	MOVF	r0x01, W
	BANKSEL	(_loop_payload_2_176 + 5)
	MOVWF	(_loop_payload_2_176 + 5), B
	MOVF	r0x02, W
	BANKSEL	(_loop_payload_2_176 + 6)
	MOVWF	(_loop_payload_2_176 + 6), B
	MOVF	r0x03, W
	BANKSEL	(_loop_payload_2_176 + 7)
	MOVWF	(_loop_payload_2_176 + 7), B
	.line	71; helloworld_tx.c	RF24NH_init(&header,/*to node*/ other_node,0);
	MOVLW	HIGH(_loop_header_2_176)
	MOVWF	r0x01
	MOVLW	LOW(_loop_header_2_176)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	LOW(_other_node)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_other_node)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_other_node)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	.line	72; helloworld_tx.c	ok = RF24N_write_m(&header,&payload,sizeof(payload));
	MOVLW	HIGH(_loop_header_2_176)
	MOVWF	r0x01
	MOVLW	LOW(_loop_header_2_176)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_loop_payload_2_176)
	MOVWF	r0x04
	MOVLW	LOW(_loop_payload_2_176)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	73; helloworld_tx.c	if (ok)
	MOVF	r0x00, W
	BZ	_00111_DS_
	.line	74; helloworld_tx.c	Serial_println("ok.");
	MOVLW	UPPER(___str_2)
	MOVWF	r0x02
	MOVLW	HIGH(___str_2)
	MOVWF	r0x01
	MOVLW	LOW(___str_2)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00115_DS_
_00111_DS_:
	.line	76; helloworld_tx.c	Serial_println("failed.");
	MOVLW	UPPER(___str_3)
	MOVWF	r0x02
	MOVLW	HIGH(___str_3)
	MOVWF	r0x01
	MOVLW	LOW(___str_3)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
_00115_DS_:
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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
S_helloworld_tx__setup	code
_setup:
	.line	40; helloworld_tx.c	void setup(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	42; helloworld_tx.c	RF24_init(36,35);
	MOVLW	0x23
	MOVWF	POSTDEC1
	MOVLW	0x24
	MOVWF	POSTDEC1
	CALL	_RF24_init
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	43; helloworld_tx.c	RF24N_init();
	CALL	_RF24N_init
	.line	45; helloworld_tx.c	Serial_begin(57600);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xe1
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_Serial_begin
	MOVLW	0x04
	ADDWF	FSR1L, F
	.line	46; helloworld_tx.c	Serial_println("RF24Network/examples/helloworld_tx/");
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
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	48; helloworld_tx.c	RF24_begin();
	CALL	_RF24_begin
	.line	49; helloworld_tx.c	RF24N_begin_d(/*channel*/ 90, /*node address*/ this_node);
	MOVLW	LOW(_this_node)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_this_node)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_this_node)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x5a
	MOVWF	POSTDEC1
	CALL	_RF24N_begin_d
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block for Ival
	code
_this_node:
	DB	0x01, 0x00
; ; Starting pCode block for Ival
_other_node:
	DB	0x00, 0x00
; ; Starting pCode block for Ival
_interval:
	DB	0xd0, 0x07, 0x00, 0x00
; ; Starting pCode block
___str_0:
	DB	0x52, 0x46, 0x32, 0x34, 0x4e, 0x65, 0x74, 0x77, 0x6f, 0x72, 0x6b, 0x2f
	DB	0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x73, 0x2f, 0x68, 0x65, 0x6c
	DB	0x6c, 0x6f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x5f, 0x74, 0x78, 0x2f, 0x00
; ; Starting pCode block
___str_1:
	DB	0x53, 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2e, 0x2e, 0x2e, 0x00
; ; Starting pCode block
___str_2:
	DB	0x6f, 0x6b, 0x2e, 0x00
; ; Starting pCode block
___str_3:
	DB	0x66, 0x61, 0x69, 0x6c, 0x65, 0x64, 0x2e, 0x00


; Statistics:
; code size:	  764 (0x02fc) bytes ( 0.58%)
;           	  382 (0x017e) words
; udata size:	   24 (0x0018) bytes ( 0.62%)
; access size:	   12 (0x000c) bytes


	end
