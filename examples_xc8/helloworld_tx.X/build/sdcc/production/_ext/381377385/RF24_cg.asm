;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 3.6.0 #9615 [pic16 port]"
	.file	"../../../RF24_c/RF24_cg.c"
	list	p=18f4620
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_RF24_csn_d
	global	_RF24_ce_d
	global	_RF24_beginTransaction
	global	_RF24_endTransaction
	global	_RF24_read_register_m_d
	global	_RF24_read_register_d
	global	_RF24_write_register_c_d
	global	_RF24_write_register_d
	global	_RF24_flush_tx
	global	_RF24_init
	global	_RF24_setChannel
	global	_RF24_getChannel
	global	_RF24_setPayloadSize
	global	_RF24_getPayloadSize
	global	_RF24_begin
	global	_RF24_startListening
	global	_RF24_stopListening
	global	_RF24_powerDown
	global	_RF24_powerUp
	global	_RF24_write_m
	global	_RF24_write
	global	_RF24_writeBlocking
	global	_RF24_reUseTX
	global	_RF24_writeFast_m
	global	_RF24_writeFast
	global	_RF24_startFastWrite
	global	_RF24_startWrite
	global	_RF24_rxFifoFull
	global	_RF24_txStandBy
	global	_RF24_txStandBy_t
	global	_RF24_maskIRQ
	global	_RF24_getDynamicPayloadSize
	global	_RF24_available
	global	_RF24_available_p
	global	_RF24_read
	global	_RF24_whatHappened
	global	_RF24_openWritingPipe_d
	global	_RF24_openWritingPipe
	global	_RF24_openReadingPipe_d
	global	_RF24_setAddressWidth
	global	_RF24_openReadingPipe
	global	_RF24_closeReadingPipe
	global	_RF24_toggle_features_d
	global	_RF24_enableDynamicPayloads
	global	_RF24_enableAckPayload
	global	_RF24_enableDynamicAck
	global	_RF24_writeAckPayload
	global	_RF24_isAckPayloadAvailable
	global	_RF24_isPVariant
	global	_RF24_setAutoAck
	global	_RF24_setAutoAck_p
	global	_RF24_testCarrier
	global	_RF24_testRPD
	global	_RF24_isValid
	global	_RF24_setPALevel
	global	_RF24_getPALevel
	global	_RF24_setDataRate
	global	_RF24_getDataRate
	global	_RF24_setCRCLength
	global	_RF24_getCRCLength
	global	_RF24_disableCRC
	global	_RF24_setRetries
	global	_RF24_write_payload
	global	_RF24_read_payload
	global	_RF24_spiTrans
	global	_RF24_flush_rx
	global	_RF24_get_status

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrput1
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
	extern	_memcpy
	extern	_digitalWrite
	extern	_pinMode
	extern	_millis
	extern	_delay
	extern	_delayMicroseconds
	extern	_SPI_begin
	extern	_SPI_transfer

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
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
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1

udata_RF24_cg_0	udata
_rf	res	22

udata_RF24_cg_1	udata
_RF24_openWritingPipe_d_value_1_249	res	5

udata_RF24_cg_2	udata
_RF24_openReadingPipe_d_address_1_254	res	5

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_RF24_cg__RF24_setRetries	code
_RF24_setRetries:
	.line	1580; ../../../RF24_c/RF24_cg.c	void RF24_setRetries( uint8_t delay, uint8_t count)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	1582; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(SETUP_RETR,(delay&0xf)<<ARD | (count&0xf)<<ARC);
	MOVLW	0x0f
	ANDWF	r0x00, F
	SWAPF	r0x00, W
	ANDLW	0xf0
	MOVWF	r0x02
	MOVLW	0x0f
	ANDWF	r0x01, F
	MOVF	r0x01, W
	MOVWF	r0x00
	MOVF	r0x00, W
	IORWF	r0x02, F
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_disableCRC	code
_RF24_disableCRC:
	.line	1573; ../../../RF24_c/RF24_cg.c	void RF24_disableCRC(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1575; ../../../RF24_c/RF24_cg.c	uint8_t disable = RF24_read_register_d(NRF_CONFIG) & ~_BV(EN_CRC) ;
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BCF	r0x00, 3
	.line	1576; ../../../RF24_c/RF24_cg.c	RF24_write_register_d( NRF_CONFIG, disable ) ;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_getCRCLength	code
_RF24_getCRCLength:
	.line	1553; ../../../RF24_c/RF24_cg.c	rf24_crclength_e RF24_getCRCLength(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	1555; ../../../RF24_c/RF24_cg.c	rf24_crclength_e result = RF24_CRC_DISABLED;
	CLRF	r0x00
	.line	1557; ../../../RF24_c/RF24_cg.c	uint8_t config = RF24_read_register_d(NRF_CONFIG) & ( _BV(CRCO) | _BV(EN_CRC)) ;
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	MOVLW	0x0c
	ANDWF	r0x01, F
	.line	1558; ../../../RF24_c/RF24_cg.c	uint8_t AA = RF24_read_register_d(EN_AA);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x02
	MOVF	POSTINC1, F
	.line	1560; ../../../RF24_c/RF24_cg.c	if ( config & _BV(EN_CRC ) || AA)
	BTFSC	r0x01, 3
	BRA	_00923_DS_
	MOVF	r0x02, W
	BZ	_00924_DS_
_00923_DS_:
	.line	1562; ../../../RF24_c/RF24_cg.c	if ( config & _BV(CRCO) )
	BTFSS	r0x01, 2
	BRA	_00921_DS_
	.line	1563; ../../../RF24_c/RF24_cg.c	result = RF24_CRC_16;
	MOVLW	0x02
	MOVWF	r0x00
	BRA	_00924_DS_
_00921_DS_:
	.line	1565; ../../../RF24_c/RF24_cg.c	result = RF24_CRC_8;
	MOVLW	0x01
	MOVWF	r0x00
_00924_DS_:
	.line	1568; ../../../RF24_c/RF24_cg.c	return result;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setCRCLength	code
_RF24_setCRCLength:
	.line	1530; ../../../RF24_c/RF24_cg.c	void RF24_setCRCLength(rf24_crclength_e length)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1532; ../../../RF24_c/RF24_cg.c	uint8_t config = RF24_read_register_d(NRF_CONFIG) & ~( _BV(CRCO) | _BV(EN_CRC)) ;
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	MOVLW	0xf3
	ANDWF	r0x01, F
	.line	1535; ../../../RF24_c/RF24_cg.c	if ( length == RF24_CRC_DISABLED )
	MOVF	r0x00, W
	BZ	_00904_DS_
	.line	1539; ../../../RF24_c/RF24_cg.c	else if ( length == RF24_CRC_8 )
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00900_DS_
	.line	1541; ../../../RF24_c/RF24_cg.c	config |= _BV(EN_CRC);
	BSF	r0x01, 3
	BRA	_00904_DS_
_00900_DS_:
	.line	1545; ../../../RF24_c/RF24_cg.c	config |= _BV(EN_CRC);
	BSF	r0x01, 3
	.line	1546; ../../../RF24_c/RF24_cg.c	config |= _BV( CRCO );
	BSF	r0x01, 2
_00904_DS_:
	.line	1548; ../../../RF24_c/RF24_cg.c	RF24_write_register_d( NRF_CONFIG, config ) ;
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_getDataRate	code
_RF24_getDataRate:
	.line	1503; ../../../RF24_c/RF24_cg.c	rf24_datarate_e RF24_getDataRate(void )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	.line	1506; ../../../RF24_c/RF24_cg.c	uint8_t dr = RF24_read_register_d(RF_SETUP) & (_BV(RF_DR_LOW) | _BV(RF_DR_HIGH));
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x28
	ANDWF	r0x00, F
	.line	1510; ../../../RF24_c/RF24_cg.c	if ( dr == _BV(RF_DR_LOW) )
	MOVF	r0x00, W
	XORLW	0x20
	BNZ	_00880_DS_
	.line	1513; ../../../RF24_c/RF24_cg.c	result = RF24_250KBPS ;
	MOVLW	0x02
	MOVWF	r0x01
	BRA	_00881_DS_
_00880_DS_:
	.line	1515; ../../../RF24_c/RF24_cg.c	else if ( dr == _BV(RF_DR_HIGH) )
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00877_DS_
	.line	1518; ../../../RF24_c/RF24_cg.c	result = RF24_2MBPS ;
	MOVLW	0x01
	MOVWF	r0x01
	BRA	_00881_DS_
_00877_DS_:
	.line	1523; ../../../RF24_c/RF24_cg.c	result = RF24_1MBPS ;
	CLRF	r0x01
_00881_DS_:
	.line	1525; ../../../RF24_c/RF24_cg.c	return result ;
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setDataRate	code
_RF24_setDataRate:
	.line	1453; ../../../RF24_c/RF24_cg.c	uint8_t RF24_setDataRate(rf24_datarate_e speed)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1455; ../../../RF24_c/RF24_cg.c	uint8_t result = 0;
	CLRF	r0x01
	.line	1456; ../../../RF24_c/RF24_cg.c	uint8_t setup = RF24_read_register_d(RF_SETUP) ;
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x02
	MOVF	POSTINC1, F
	.line	1459; ../../../RF24_c/RF24_cg.c	setup &= ~(_BV(RF_DR_LOW) | _BV(RF_DR_HIGH)) ;
	MOVLW	0xd7
	ANDWF	r0x02, F
	.line	1464; ../../../RF24_c/RF24_cg.c	rf.txDelay=85;
	MOVLW	0x55
	BANKSEL	(_rf + 13)
	MOVWF	(_rf + 13), B
	BANKSEL	(_rf + 14)
	CLRF	(_rf + 14), B
	BANKSEL	(_rf + 15)
	CLRF	(_rf + 15), B
	BANKSEL	(_rf + 16)
	CLRF	(_rf + 16), B
	.line	1466; ../../../RF24_c/RF24_cg.c	if( speed == RF24_250KBPS )
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00848_DS_
	.line	1470; ../../../RF24_c/RF24_cg.c	setup |= _BV( RF_DR_LOW ) ;
	BSF	r0x02, 5
	.line	1474; ../../../RF24_c/RF24_cg.c	rf.txDelay=155;
	MOVLW	0x9b
	BANKSEL	(_rf + 13)
	MOVWF	(_rf + 13), B
	BANKSEL	(_rf + 14)
	CLRF	(_rf + 14), B
	BANKSEL	(_rf + 15)
	CLRF	(_rf + 15), B
	BANKSEL	(_rf + 16)
	CLRF	(_rf + 16), B
	BRA	_00849_DS_
_00848_DS_:
	.line	1481; ../../../RF24_c/RF24_cg.c	if ( speed == RF24_2MBPS )
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00849_DS_
	.line	1483; ../../../RF24_c/RF24_cg.c	setup |= _BV(RF_DR_HIGH);
	BSF	r0x02, 3
	.line	1487; ../../../RF24_c/RF24_cg.c	rf.txDelay=65;
	MOVLW	0x41
	BANKSEL	(_rf + 13)
	MOVWF	(_rf + 13), B
	BANKSEL	(_rf + 14)
	CLRF	(_rf + 14), B
	BANKSEL	(_rf + 15)
	CLRF	(_rf + 15), B
	BANKSEL	(_rf + 16)
	CLRF	(_rf + 16), B
_00849_DS_:
	.line	1491; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(RF_SETUP,setup);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1494; ../../../RF24_c/RF24_cg.c	if ( RF24_read_register_d(RF_SETUP) == setup )
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	XORWF	r0x02, W
	BNZ	_00851_DS_
	.line	1496; ../../../RF24_c/RF24_cg.c	result = 1;
	MOVLW	0x01
	MOVWF	r0x01
_00851_DS_:
	.line	1498; ../../../RF24_c/RF24_cg.c	return result;
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_getPALevel	code
_RF24_getPALevel:
	.line	1445; ../../../RF24_c/RF24_cg.c	uint8_t RF24_getPALevel(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1448; ../../../RF24_c/RF24_cg.c	return (RF24_read_register_d(RF_SETUP) & (_BV(RF_PWR_LOW) | _BV(RF_PWR_HIGH))) >> 1 ;
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x06
	ANDWF	r0x00, F
	RRNCF	r0x00, W
	ANDLW	0x7f
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setPALevel	code
_RF24_setPALevel:
	.line	1428; ../../../RF24_c/RF24_cg.c	void RF24_setPALevel(uint8_t level)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1431; ../../../RF24_c/RF24_cg.c	uint8_t setup = RF24_read_register_d(RF_SETUP) & 0b11111000;
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	MOVLW	0xf8
	ANDWF	r0x01, F
	.line	1433; ../../../RF24_c/RF24_cg.c	if(level > 3){  						// If invalid level, go to max PA
	MOVLW	0x04
	SUBWF	r0x00, W
	BNC	_00827_DS_
	.line	1434; ../../../RF24_c/RF24_cg.c	level = (RF24_PA_MAX << 1) + 1;		// +1 to support the SI24R1 chip extra bit
	MOVLW	0x07
	MOVWF	r0x00
	BRA	_00828_DS_
_00827_DS_:
	.line	1436; ../../../RF24_c/RF24_cg.c	level = (level << 1) + 1;	 		// Else set level as requested
	RLNCF	r0x00, W
	ANDLW	0xfe
	MOVWF	r0x02
	INCF	r0x02, W
	MOVWF	r0x00
_00828_DS_:
	.line	1440; ../../../RF24_c/RF24_cg.c	RF24_write_register_d( RF_SETUP, setup |= level ) ;	// Write it to the chip
	MOVF	r0x01, W
	IORWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_isValid	code
_RF24_isValid:
	.line	1420; ../../../RF24_c/RF24_cg.c	uint8_t RF24_isValid(void) 
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	BANKSEL	_rf
	.line	1422; ../../../RF24_c/RF24_cg.c	return rf.ce_pin != 0xff && rf.csn_pin != 0xff; 
	MOVF	_rf, W, B
	XORLW	0xff
	BZ	_00812_DS_
_00819_DS_:
	BANKSEL	(_rf + 1)
	MOVF	(_rf + 1), W, B
	XORLW	0xff
	BNZ	_00813_DS_
_00812_DS_:
	CLRF	r0x00
	BRA	_00814_DS_
_00813_DS_:
	MOVLW	0x01
	MOVWF	r0x00
_00814_DS_:
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_testRPD	code
_RF24_testRPD:
	.line	1413; ../../../RF24_c/RF24_cg.c	uint8_t RF24_testRPD(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1415; ../../../RF24_c/RF24_cg.c	return ( RF24_read_register_d(RPD) & 1 ) ;
	MOVLW	0x09
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x01
	ANDWF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_testCarrier	code
_RF24_testCarrier:
	.line	1406; ../../../RF24_c/RF24_cg.c	uint8_t RF24_testCarrier(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1408; ../../../RF24_c/RF24_cg.c	return ( RF24_read_register_d(CD) & 1 );
	MOVLW	0x09
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x01
	ANDWF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setAutoAck_p	code
_RF24_setAutoAck_p:
	.line	1387; ../../../RF24_c/RF24_cg.c	void RF24_setAutoAck_p( uint8_t pipe, uint8_t enable )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	1389; ../../../RF24_c/RF24_cg.c	if ( pipe <= 6 )
	MOVLW	0x07
	SUBWF	r0x00, W
	BC	_00782_DS_
	.line	1391; ../../../RF24_c/RF24_cg.c	uint8_t en_aa = RF24_read_register_d( EN_AA ) ;
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x02
	MOVF	POSTINC1, F
	.line	1392; ../../../RF24_c/RF24_cg.c	if( enable )
	MOVF	r0x01, W
	BZ	_00778_DS_
	.line	1394; ../../../RF24_c/RF24_cg.c	en_aa |= _BV(pipe) ;
	MOVLW	0x01
	MOVWF	r0x01
	MOVF	r0x00, W
	BZ	_00791_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00792_DS_:
	RLCF	r0x01, F
	ADDLW	0x01
	BNC	_00792_DS_
_00791_DS_:
	MOVF	r0x01, W
	IORWF	r0x02, F
	BRA	_00779_DS_
_00778_DS_:
	.line	1398; ../../../RF24_c/RF24_cg.c	en_aa &= ~_BV(pipe) ;
	MOVLW	0x01
	MOVWF	r0x01
	MOVF	r0x00, W
	BZ	_00794_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00795_DS_:
	RLCF	r0x01, F
	ADDLW	0x01
	BNC	_00795_DS_
_00794_DS_:
	COMF	r0x01, W
	MOVWF	r0x00
	MOVF	r0x00, W
	ANDWF	r0x02, F
_00779_DS_:
	.line	1400; ../../../RF24_c/RF24_cg.c	RF24_write_register_d( EN_AA, en_aa ) ;
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00782_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setAutoAck	code
_RF24_setAutoAck:
	.line	1377; ../../../RF24_c/RF24_cg.c	void RF24_setAutoAck( uint8_t enable)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1379; ../../../RF24_c/RF24_cg.c	if ( enable )
	MOVF	r0x00, W
	BZ	_00770_DS_
	.line	1380; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(EN_AA, 0b111111);
	MOVLW	0x3f
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00772_DS_
_00770_DS_:
	.line	1382; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(EN_AA, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00772_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_isPVariant	code
_RF24_isPVariant:
	.line	1370; ../../../RF24_c/RF24_cg.c	uint8_t RF24_isPVariant(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_rf + 4)
	.line	1372; ../../../RF24_c/RF24_cg.c	return rf.p_variant ;
	MOVF	(_rf + 4), W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_isAckPayloadAvailable	code
_RF24_isAckPayloadAvailable:
	.line	1363; ../../../RF24_c/RF24_cg.c	uint8_t RF24_isAckPayloadAvailable(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1365; ../../../RF24_c/RF24_cg.c	return ! (RF24_read_register_d(FIFO_STATUS) & _BV(RX_EMPTY));
	MOVLW	0x17
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	r0x00
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_writeAckPayload	code
_RF24_writeAckPayload:
	.line	1332; ../../../RF24_c/RF24_cg.c	void RF24_writeAckPayload(uint8_t pipe, const void* buf, uint8_t len)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	1334; ../../../RF24_c/RF24_cg.c	const uint8_t* current = (const uint8_t*)(buf);
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	.line	1336; ../../../RF24_c/RF24_cg.c	uint8_t data_len = rf24_min(len,32);
	MOVLW	0x20
	SUBWF	r0x04, W
	BNC	_00740_DS_
	MOVLW	0x20
	MOVWF	r0x04
_00740_DS_:
	.line	1350; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	1351; ../../../RF24_c/RF24_cg.c	SPI_transfer(W_ACK_PAYLOAD | ( pipe & 0b111 ) );
	MOVLW	0x07
	ANDWF	r0x00, F
	MOVLW	0xa8
	IORWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	.line	1353; ../../../RF24_c/RF24_cg.c	while ( data_len-- )
	MOVFF	r0x01, r0x00
	MOVFF	r0x02, r0x01
	MOVFF	r0x03, r0x02
_00734_DS_:
	MOVFF	r0x04, r0x03
	DECF	r0x04, F
	MOVF	r0x03, W
	BZ	_00736_DS_
	.line	1354; ../../../RF24_c/RF24_cg.c	SPI_transfer(*current++);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x00, F
	BNC	_00754_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00754_DS_:
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	BRA	_00734_DS_
_00736_DS_:
	.line	1355; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_enableDynamicAck	code
_RF24_enableDynamicAck:
	.line	1318; ../../../RF24_c/RF24_cg.c	void RF24_enableDynamicAck(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1323; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(FEATURE,RF24_read_register_d(FEATURE) | _BV(EN_DYN_ACK) );
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BSF	r0x00, 0
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_enableAckPayload	code
_RF24_enableAckPayload:
	.line	1297; ../../../RF24_c/RF24_cg.c	void RF24_enableAckPayload(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1304; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(FEATURE,RF24_read_register_d(FEATURE) | _BV(EN_ACK_PAY) | _BV(EN_DPL) );
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x06
	IORWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1312; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(DYNPD,RF24_read_register_d(DYNPD) | _BV(DPL_P1) | _BV(DPL_P0));
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x03
	IORWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1313; ../../../RF24_c/RF24_cg.c	rf.dynamic_payloads_enabled = 1;
	MOVLW	0x01
	BANKSEL	(_rf + 6)
	MOVWF	(_rf + 6), B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_enableDynamicPayloads	code
_RF24_enableDynamicPayloads:
	.line	1276; ../../../RF24_c/RF24_cg.c	void RF24_enableDynamicPayloads(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1281; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(FEATURE,RF24_read_register_d(FEATURE) | _BV(EN_DPL) );
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BSF	r0x00, 2
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1290; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(DYNPD,RF24_read_register_d(DYNPD) | _BV(DPL_P5) | _BV(DPL_P4) | _BV(DPL_P3) | _BV(DPL_P2) | _BV(DPL_P1) | _BV(DPL_P0));
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x3f
	IORWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1292; ../../../RF24_c/RF24_cg.c	rf.dynamic_payloads_enabled = 1;
	MOVLW	0x01
	BANKSEL	(_rf + 6)
	MOVWF	(_rf + 6), B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_toggle_features_d	code
_RF24_toggle_features_d:
	.line	1266; ../../../RF24_c/RF24_cg.c	void RF24_toggle_features_d(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	1268; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	1269; ../../../RF24_c/RF24_cg.c	SPI_transfer( ACTIVATE );
	MOVLW	0x50
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	.line	1270; ../../../RF24_c/RF24_cg.c	SPI_transfer( 0x73 );
	MOVLW	0x73
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	.line	1271; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_closeReadingPipe	code
_RF24_closeReadingPipe:
	.line	1259; ../../../RF24_c/RF24_cg.c	void RF24_closeReadingPipe(uint8_t pipe )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1261; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(EN_RXADDR,RF24_read_register_d(EN_RXADDR) & ~_BV(pgm_read_byte(&child_pipe_enable[pipe])));
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_child_pipe_enable)
	ADDWF	r0x00, F
	MOVLW	HIGH(_child_pipe_enable)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_child_pipe_enable)
	ADDWFC	r0x03, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVLW	0x01
	MOVWF	r0x02
	MOVF	r0x00, W
	BZ	_00708_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00709_DS_:
	RLCF	r0x02, F
	ADDLW	0x01
	BNC	_00709_DS_
_00708_DS_:
	COMF	r0x02, W
	MOVWF	r0x00
	MOVF	r0x00, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_openReadingPipe	code
_RF24_openReadingPipe:
	.line	1231; ../../../RF24_c/RF24_cg.c	void RF24_openReadingPipe(uint8_t child, const uint8_t *address)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	.line	1236; ../../../RF24_c/RF24_cg.c	if (child == 0){
	MOVF	r0x00, W
	BNZ	_00681_DS_
	.line	1237; ../../../RF24_c/RF24_cg.c	memcpy(rf.pipe0_reading_address,address,rf.addr_width);
	MOVLW	HIGH(_rf + 7)
	MOVWF	r0x05
	MOVLW	LOW(_rf + 7)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x02, W
	MOVWF	r0x08
	MOVF	r0x01, W
	MOVWF	r0x07
	MOVFF	(_rf + 12), r0x0a
	CLRF	r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
_00681_DS_:
	.line	1239; ../../../RF24_c/RF24_cg.c	if (child <= 6)
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00687_DS_
	.line	1242; ../../../RF24_c/RF24_cg.c	if ( child < 2 ){
	MOVLW	0x02
	SUBWF	r0x00, W
	BC	_00683_DS_
	.line	1243; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(pgm_read_byte(&child_pipe[child]), address, rf.addr_width);
	MOVLW	LOW(_child_pipe)
	ADDWF	r0x00, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_child_pipe)
	ADDWFC	r0x05, F
	CLRF	r0x06
	MOVLW	UPPER(_child_pipe)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	BANKSEL	(_rf + 12)
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00684_DS_
_00683_DS_:
	.line	1245; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(pgm_read_byte(&child_pipe[child]), address, 1);
	MOVLW	LOW(_child_pipe)
	ADDWF	r0x00, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_child_pipe)
	ADDWFC	r0x05, F
	CLRF	r0x06
	MOVLW	UPPER(_child_pipe)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
_00684_DS_:
	.line	1247; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(pgm_read_byte(&child_payload_size[child]),rf.payload_size);
	MOVLW	LOW(_child_payload_size)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_child_payload_size)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_child_payload_size)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	BANKSEL	(_rf + 5)
	MOVF	(_rf + 5), W, B
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1252; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(EN_RXADDR,RF24_read_register_d(EN_RXADDR) | _BV(pgm_read_byte(&child_pipe_enable[child])));
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_child_pipe_enable)
	ADDWF	r0x00, F
	MOVLW	HIGH(_child_pipe_enable)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_child_pipe_enable)
	ADDWFC	r0x03, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVLW	0x01
	MOVWF	r0x02
	MOVF	r0x00, W
	BZ	_00700_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00701_DS_:
	RLCF	r0x02, F
	ADDLW	0x01
	BNC	_00701_DS_
_00700_DS_:
	MOVF	r0x02, W
	IORWF	r0x01, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00687_DS_:
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
S_RF24_cg__RF24_setAddressWidth	code
_RF24_setAddressWidth:
	.line	1220; ../../../RF24_c/RF24_cg.c	void RF24_setAddressWidth(uint8_t a_width){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1222; ../../../RF24_c/RF24_cg.c	if(a_width -= 2){
	MOVLW	0xfe
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVFF	r0x01, r0x00
	MOVF	r0x01, W
	BZ	_00675_DS_
	.line	1223; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(SETUP_AW,a_width%4);
	MOVLW	0x03
	ANDWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1224; ../../../RF24_c/RF24_cg.c	rf.addr_width = (a_width%4) + 2;
	INCF	r0x00, F
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_rf + 12)
	MOVWF	(_rf + 12), B
_00675_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_openReadingPipe_d	code
_RF24_openReadingPipe_d:
	.line	1187; ../../../RF24_c/RF24_cg.c	void RF24_openReadingPipe_d(uint8_t child, const raddr_t* address_)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	.line	1191; ../../../RF24_c/RF24_cg.c	for(i=0;i<5;i++)
	CLRF	r0x04
_00644_DS_:
	.line	1193; ../../../RF24_c/RF24_cg.c	address[i]=address_[4-i];
	MOVLW	LOW(_RF24_openReadingPipe_d_address_1_254)
	ADDWF	r0x04, W
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_RF24_openReadingPipe_d_address_1_254)
	ADDWFC	r0x06, F
	MOVFF	r0x04, r0x07
	CLRF	r0x08
	MOVF	r0x07, W
	SUBLW	0x04
	MOVWF	r0x07
	MOVLW	0x00
	SUBFWB	r0x08, F
	CLRF	r0x09
	BTFSC	r0x08, 7
	SETF	r0x09
	MOVF	r0x01, W
	ADDWF	r0x07, F
	MOVF	r0x02, W
	ADDWFC	r0x08, F
	MOVF	r0x03, W
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	r0x07, INDF0
	.line	1191; ../../../RF24_c/RF24_cg.c	for(i=0;i<5;i++)
	INCF	r0x04, F
	MOVLW	0x05
	SUBWF	r0x04, W
	BNC	_00644_DS_
	.line	1198; ../../../RF24_c/RF24_cg.c	if (child == 0){
	MOVF	r0x00, W
	BNZ	_00638_DS_
	.line	1199; ../../../RF24_c/RF24_cg.c	memcpy(rf.pipe0_reading_address,address,rf.addr_width);
	MOVLW	HIGH(_rf + 7)
	MOVWF	r0x02
	MOVLW	LOW(_rf + 7)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	HIGH(_RF24_openReadingPipe_d_address_1_254)
	MOVWF	r0x05
	MOVLW	LOW(_RF24_openReadingPipe_d_address_1_254)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVFF	(_rf + 12), r0x07
	CLRF	r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
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
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
_00638_DS_:
	.line	1202; ../../../RF24_c/RF24_cg.c	if (child <= 6)
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00646_DS_
	.line	1205; ../../../RF24_c/RF24_cg.c	if ( child < 2 )
	MOVLW	0x02
	SUBWF	r0x00, W
	BC	_00640_DS_
	.line	1206; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(pgm_read_byte(&child_pipe[child]), (const uint8_t*)(address), rf.addr_width);
	MOVLW	LOW(_child_pipe)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_child_pipe)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_child_pipe)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVLW	HIGH(_RF24_openReadingPipe_d_address_1_254)
	MOVWF	r0x03
	MOVLW	LOW(_RF24_openReadingPipe_d_address_1_254)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	BANKSEL	(_rf + 12)
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00641_DS_
_00640_DS_:
	.line	1208; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(pgm_read_byte(&child_pipe[child]), (const uint8_t*)(address), 1);
	MOVLW	LOW(_child_pipe)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_child_pipe)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_child_pipe)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVLW	HIGH(_RF24_openReadingPipe_d_address_1_254)
	MOVWF	r0x03
	MOVLW	LOW(_RF24_openReadingPipe_d_address_1_254)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
_00641_DS_:
	.line	1210; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(pgm_read_byte(&child_payload_size[child]),rf.payload_size);
	MOVLW	LOW(_child_payload_size)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_child_payload_size)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_child_payload_size)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	BANKSEL	(_rf + 5)
	MOVF	(_rf + 5), W, B
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1215; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(EN_RXADDR,RF24_read_register_d(EN_RXADDR) | _BV(pgm_read_byte(&child_pipe_enable[child])));
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_child_pipe_enable)
	ADDWF	r0x00, F
	MOVLW	HIGH(_child_pipe_enable)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_child_pipe_enable)
	ADDWFC	r0x03, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVLW	0x01
	MOVWF	r0x02
	MOVF	r0x00, W
	BZ	_00667_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00668_DS_:
	RLCF	r0x02, F
	ADDLW	0x01
	BNC	_00668_DS_
_00667_DS_:
	MOVF	r0x02, W
	IORWF	r0x01, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00646_DS_:
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
S_RF24_cg__RF24_openWritingPipe	code
_RF24_openWritingPipe:
	.line	1163; ../../../RF24_c/RF24_cg.c	void RF24_openWritingPipe(const uint8_t *address)
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
	BANKSEL	(_rf + 12)
	.line	1168; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(RX_ADDR_P0,address, rf.addr_width);
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	(_rf + 12)
	.line	1169; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(TX_ADDR, address, rf.addr_width);
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	(_rf + 5)
	.line	1173; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(RX_PW_P0,rf.payload_size);
	MOVF	(_rf + 5), W, B
	MOVWF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_openWritingPipe_d	code
_RF24_openWritingPipe_d:
	.line	1144; ../../../RF24_c/RF24_cg.c	void RF24_openWritingPipe_d(const raddr_t*  value_)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	1148; ../../../RF24_c/RF24_cg.c	for(i=0;i<5;i++)
	CLRF	r0x03
_00615_DS_:
	.line	1150; ../../../RF24_c/RF24_cg.c	value[i]=value_[4-i];
	MOVLW	LOW(_RF24_openWritingPipe_d_value_1_249)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_RF24_openWritingPipe_d_value_1_249)
	ADDWFC	r0x05, F
	MOVFF	r0x03, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	SUBLW	0x04
	MOVWF	r0x06
	MOVLW	0x00
	SUBFWB	r0x07, F
	CLRF	r0x08
	BTFSC	r0x07, 7
	SETF	r0x08
	MOVF	r0x00, W
	ADDWF	r0x06, F
	MOVF	r0x01, W
	ADDWFC	r0x07, F
	MOVF	r0x02, W
	ADDWFC	r0x08, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x06, INDF0
	.line	1148; ../../../RF24_c/RF24_cg.c	for(i=0;i<5;i++)
	INCF	r0x03, F
	MOVLW	0x05
	SUBWF	r0x03, W
	BNC	_00615_DS_
	.line	1153; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(RX_ADDR_P0, ((uint8_t*)(value)), rf.addr_width);
	MOVLW	HIGH(_RF24_openWritingPipe_d_value_1_249)
	MOVWF	r0x01
	MOVLW	LOW(_RF24_openWritingPipe_d_value_1_249)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_rf + 12)
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	.line	1154; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(TX_ADDR, ((uint8_t*)(value)), rf.addr_width);
	MOVLW	HIGH(_RF24_openWritingPipe_d_value_1_249)
	MOVWF	r0x01
	MOVLW	LOW(_RF24_openWritingPipe_d_value_1_249)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_rf + 12)
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	(_rf + 5)
	.line	1159; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(RX_PW_P0,rf.payload_size);
	MOVF	(_rf + 5), W, B
	MOVWF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
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
S_RF24_cg__RF24_whatHappened	code
_RF24_whatHappened:
	.line	1130; ../../../RF24_c/RF24_cg.c	void RF24_whatHappened( uint8_t * tx_ok,uint8_t * tx_fail,uint8_t * rx_ready)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	.line	1134; ../../../RF24_c/RF24_cg.c	uint8_t status = RF24_write_register_d(NRF_STATUS,_BV(RX_DR) | _BV(TX_DS) | _BV(MAX_RT) );
	MOVLW	0x70
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVWF	r0x09
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1137; ../../../RF24_c/RF24_cg.c	*tx_ok = status & _BV(TX_DS);
	MOVLW	0x20
	ANDWF	r0x09, W
	MOVWF	r0x0a
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	.line	1138; ../../../RF24_c/RF24_cg.c	*tx_fail = status & _BV(MAX_RT);
	MOVLW	0x10
	ANDWF	r0x09, W
	MOVWF	r0x00
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	.line	1139; ../../../RF24_c/RF24_cg.c	*rx_ready = status & _BV(RX_DR);
	MOVLW	0x40
	ANDWF	r0x09, F
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
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
S_RF24_cg__RF24_read	code
_RF24_read:
	.line	1118; ../../../RF24_c/RF24_cg.c	void RF24_read(void* buf, uint8_t len ){
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
	.line	1121; ../../../RF24_c/RF24_cg.c	RF24_read_payload( buf, len );
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_read_payload
	MOVLW	0x04
	ADDWF	FSR1L, F
	.line	1124; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS,_BV(RX_DR) | _BV(MAX_RT) | _BV(TX_DS) );
	MOVLW	0x70
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_available_p	code
_RF24_available_p:
	.line	1098; ../../../RF24_c/RF24_cg.c	uint8_t RF24_available_p(uint8_t* pipe_num)
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
	.line	1100; ../../../RF24_c/RF24_cg.c	if (!( RF24_read_register_d(FIFO_STATUS) & _BV(RX_EMPTY) )){
	MOVLW	0x17
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x03
	MOVF	POSTINC1, F
	BTFSC	r0x03, 0
	BRA	_00590_DS_
	.line	1103; ../../../RF24_c/RF24_cg.c	if ( pipe_num ){
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00588_DS_
	.line	1104; ../../../RF24_c/RF24_cg.c	uint8_t status = RF24_get_status();
	CALL	_RF24_get_status
	MOVWF	r0x03
	.line	1105; ../../../RF24_c/RF24_cg.c	*pipe_num = ( status >> RX_P_NO ) & 0b111;
	RRNCF	r0x03, W
	ANDLW	0x7f
	MOVWF	r0x03
	MOVLW	0x07
	ANDWF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00588_DS_:
	.line	1107; ../../../RF24_c/RF24_cg.c	return 1;
	MOVLW	0x01
	BRA	_00591_DS_
_00590_DS_:
	.line	1111; ../../../RF24_c/RF24_cg.c	return 0;
	CLRF	WREG
_00591_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_available	code
_RF24_available:
	.line	1091; ../../../RF24_c/RF24_cg.c	uint8_t RF24_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1093; ../../../RF24_c/RF24_cg.c	return RF24_available_p(NULL);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_available_p
	MOVWF	r0x00
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_getDynamicPayloadSize	code
_RF24_getDynamicPayloadSize:
	.line	1067; ../../../RF24_c/RF24_cg.c	uint8_t RF24_getDynamicPayloadSize(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	1079; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	1080; ../../../RF24_c/RF24_cg.c	SPI_transfer( R_RX_PL_WID );
	MOVLW	0x60
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	.line	1081; ../../../RF24_c/RF24_cg.c	result = SPI_transfer(0xff);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x00
	MOVF	POSTINC1, F
	.line	1082; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	1085; ../../../RF24_c/RF24_cg.c	if(result > 32) { RF24_flush_rx();; delay(2); return 0; }
	MOVLW	0x21
	SUBWF	r0x00, W
	BNC	_00571_DS_
	CALL	_RF24_flush_rx
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	CLRF	WREG
	BRA	_00572_DS_
_00571_DS_:
	.line	1086; ../../../RF24_c/RF24_cg.c	return result;
	MOVF	r0x00, W
_00572_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_maskIRQ	code
_RF24_maskIRQ:
	.line	1055; ../../../RF24_c/RF24_cg.c	void RF24_maskIRQ(uint8_t tx, uint8_t fail, uint8_t rx){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	1057; ../../../RF24_c/RF24_cg.c	uint8_t config = RF24_read_register_d(NRF_CONFIG);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x03
	MOVF	POSTINC1, F
	.line	1059; ../../../RF24_c/RF24_cg.c	config &= ~(1 << MASK_MAX_RT | 1 << MASK_TX_DS | 1 << MASK_RX_DR);
	MOVLW	0x8f
	ANDWF	r0x03, F
	.line	1061; ../../../RF24_c/RF24_cg.c	config |= fail << MASK_MAX_RT | tx << MASK_TX_DS | rx << MASK_RX_DR;
	SWAPF	r0x01, W
	ANDLW	0xf0
	MOVWF	r0x04
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0xe0
	MOVWF	r0x05
	MOVF	r0x05, W
	IORWF	r0x04, W
	MOVWF	r0x00
	RRNCF	r0x02, W
	RRNCF	WREG, W
	ANDLW	0xc0
	MOVWF	r0x01
	MOVF	r0x01, W
	IORWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x02, W
	IORWF	r0x03, F
	.line	1062; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_CONFIG, config);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_txStandBy_t	code
_RF24_txStandBy_t:
	.line	1018; ../../../RF24_c/RF24_cg.c	uint8_t RF24_txStandBy_t(uint32_t timeout, uint8_t startTx){
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	1021; ../../../RF24_c/RF24_cg.c	if(startTx){
	MOVF	r0x04, W
	BZ	_00533_DS_
	.line	1022; ../../../RF24_c/RF24_cg.c	RF24_stopListening();
	CALL	_RF24_stopListening
	.line	1023; ../../../RF24_c/RF24_cg.c	RF24_ce_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
_00533_DS_:
	.line	1026; ../../../RF24_c/RF24_cg.c	start = millis();
	CALL	_millis
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
_00538_DS_:
	.line	1028; ../../../RF24_c/RF24_cg.c	while( ! (RF24_read_register_d(FIFO_STATUS) & _BV(TX_EMPTY)) ){
	MOVLW	0x17
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x08
	MOVF	POSTINC1, F
	BTFSC	r0x08, 4
	BRA	_00540_DS_
	.line	1029; ../../../RF24_c/RF24_cg.c	if( RF24_get_status() & _BV(MAX_RT)){
	CALL	_RF24_get_status
	MOVWF	r0x08
	BTFSS	r0x08, 4
	BRA	_00538_DS_
	.line	1030; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS,_BV(MAX_RT) );
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1031; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);										  //Set re-transmit
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	1032; ../../../RF24_c/RF24_cg.c	RF24_ce_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	1033; ../../../RF24_c/RF24_cg.c	if(millis() - start >= timeout){
	CALL	_millis
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
	MOVFF	FSR0L, r0x0b
	MOVF	r0x04, W
	SUBWF	r0x08, F
	MOVF	r0x05, W
	SUBWFB	r0x09, F
	MOVF	r0x06, W
	SUBWFB	r0x0a, F
	MOVF	r0x07, W
	SUBWFB	r0x0b, F
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	BNZ	_00560_DS_
	MOVF	r0x02, W
	SUBWF	r0x0a, W
	BNZ	_00560_DS_
	MOVF	r0x01, W
	SUBWF	r0x09, W
	BNZ	_00560_DS_
	MOVF	r0x00, W
	SUBWF	r0x08, W
_00560_DS_:
	BTFSS	STATUS, 0
	BRA	_00538_DS_
	.line	1034; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW); RF24_flush_tx();; return 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	CALL	_RF24_flush_tx
	CLRF	WREG
	BRA	_00541_DS_
_00540_DS_:
	.line	1048; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);				   //Set STANDBY-I mode
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	1049; ../../../RF24_c/RF24_cg.c	return 1;
	MOVLW	0x01
_00541_DS_:
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
S_RF24_cg__RF24_txStandBy	code
_RF24_txStandBy:
	.line	990; ../../../RF24_c/RF24_cg.c	uint8_t RF24_txStandBy(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
_00512_DS_:
	.line	995; ../../../RF24_c/RF24_cg.c	while( ! (RF24_read_register_d(FIFO_STATUS) & _BV(TX_EMPTY)) ){
	MOVLW	0x17
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BTFSC	r0x00, 4
	BRA	_00514_DS_
	.line	996; ../../../RF24_c/RF24_cg.c	if( RF24_get_status() & _BV(MAX_RT)){
	CALL	_RF24_get_status
	MOVWF	r0x00
	BTFSS	r0x00, 4
	BRA	_00512_DS_
	.line	997; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS,_BV(MAX_RT) );
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	998; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	999; ../../../RF24_c/RF24_cg.c	RF24_flush_tx();;    //Non blocking, flush the data
	CALL	_RF24_flush_tx
	.line	1000; ../../../RF24_c/RF24_cg.c	return 0;
	CLRF	WREG
	BRA	_00515_DS_
_00514_DS_:
	.line	1012; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);			   //Set STANDBY-I mode
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	1013; ../../../RF24_c/RF24_cg.c	return 1;
	MOVLW	0x01
_00515_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_rxFifoFull	code
_RF24_rxFifoFull:
	.line	985; ../../../RF24_c/RF24_cg.c	uint8_t RF24_rxFifoFull(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	986; ../../../RF24_c/RF24_cg.c	return RF24_read_register_d(FIFO_STATUS) & _BV(RX_FULL);
	MOVLW	0x17
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	0x02
	ANDWF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_startWrite	code
_RF24_startWrite:
	.line	968; ../../../RF24_c/RF24_cg.c	void RF24_startWrite(const void* buf, uint8_t len, const uint8_t multicast ){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	973; ../../../RF24_c/RF24_cg.c	RF24_write_payload( buf, len,multicast? W_TX_PAYLOAD_NO_ACK : W_TX_PAYLOAD ) ;
	MOVF	r0x04, W
	BZ	_00499_DS_
	MOVLW	0xb0
	MOVWF	r0x04
	BRA	_00500_DS_
_00499_DS_:
	MOVLW	0xa0
	MOVWF	r0x04
_00500_DS_:
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
	CALL	_RF24_write_payload
	MOVLW	0x05
	ADDWF	FSR1L, F
	.line	974; ../../../RF24_c/RF24_cg.c	RF24_ce_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	976; ../../../RF24_c/RF24_cg.c	delayMicroseconds(10);
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_delayMicroseconds
	MOVF	POSTINC1, F
	.line	978; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_startFastWrite	code
_RF24_startFastWrite:
	.line	954; ../../../RF24_c/RF24_cg.c	void RF24_startFastWrite(const void* buf, uint8_t len, const uint8_t multicast, uint8_t startTx){ //TMRh20
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	.line	957; ../../../RF24_c/RF24_cg.c	RF24_write_payload( buf, len,multicast ? W_TX_PAYLOAD_NO_ACK : W_TX_PAYLOAD ) ;
	MOVF	r0x04, W
	BZ	_00491_DS_
	MOVLW	0xb0
	MOVWF	r0x04
	BRA	_00492_DS_
_00491_DS_:
	MOVLW	0xa0
	MOVWF	r0x04
_00492_DS_:
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
	CALL	_RF24_write_payload
	MOVLW	0x05
	ADDWF	FSR1L, F
	.line	958; ../../../RF24_c/RF24_cg.c	if(startTx){
	MOVF	r0x05, W
	BZ	_00489_DS_
	.line	959; ../../../RF24_c/RF24_cg.c	RF24_ce_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
_00489_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_writeFast	code
_RF24_writeFast:
	.line	943; ../../../RF24_c/RF24_cg.c	uint8_t RF24_writeFast(const void* buf, uint8_t len ){
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
	.line	944; ../../../RF24_c/RF24_cg.c	return RF24_writeFast_m(buf,len,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_writeFast_m
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_writeFast_m	code
_RF24_writeFast_m:
	.line	909; ../../../RF24_c/RF24_cg.c	uint8_t RF24_writeFast_m( const void* buf, uint8_t len, const uint8_t multicast )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
_00462_DS_:
	.line	920; ../../../RF24_c/RF24_cg.c	while( ( RF24_get_status()  & ( _BV(TX_FULL) ))) {			  //Blocking only if FIFO is full. This will loop and block until TX is successful or fail
	CALL	_RF24_get_status
	MOVWF	r0x05
	BTFSS	r0x05, 0
	BRA	_00464_DS_
	.line	922; ../../../RF24_c/RF24_cg.c	if( RF24_get_status() & _BV(MAX_RT)){
	CALL	_RF24_get_status
	MOVWF	r0x05
	BTFSS	r0x05, 4
	BRA	_00462_DS_
	.line	924; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS,_BV(MAX_RT) );			  //Clear max retry flag
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	925; ../../../RF24_c/RF24_cg.c	return 0;										  //Return 0. The previous payload has been retransmitted
	CLRF	WREG
	BRA	_00465_DS_
_00464_DS_:
	.line	938; ../../../RF24_c/RF24_cg.c	RF24_startFastWrite(buf,len,multicast,1);
	MOVLW	0x01
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
	CALL	_RF24_startFastWrite
	MOVLW	0x06
	ADDWF	FSR1L, F
	.line	940; ../../../RF24_c/RF24_cg.c	return 1;
	MOVLW	0x01
_00465_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_reUseTX	code
_RF24_reUseTX:
	.line	900; ../../../RF24_c/RF24_cg.c	void RF24_reUseTX(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	901; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS,_BV(MAX_RT) );			  //Clear max retry flag
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	902; ../../../RF24_c/RF24_cg.c	RF24_spiTrans(REUSE_TX_PL );
	MOVLW	0xe3
	MOVWF	POSTDEC1
	CALL	_RF24_spiTrans
	MOVF	POSTINC1, F
	.line	903; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);										  //Re-Transfer packet
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	904; ../../../RF24_c/RF24_cg.c	RF24_ce_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_writeBlocking	code
_RF24_writeBlocking:
	.line	866; ../../../RF24_c/RF24_cg.c	uint8_t RF24_writeBlocking(const void* buf, uint8_t len, uint32_t timeout )
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
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	.line	873; ../../../RF24_c/RF24_cg.c	uint32_t timer = millis();							  //Get the time that the payload transmission started
	CALL	_millis
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
	MOVFF	FSR0L, r0x0b
_00431_DS_:
	.line	875; ../../../RF24_c/RF24_cg.c	while( ( RF24_get_status()  & ( _BV(TX_FULL) ))) {		  //Blocking only if FIFO is full. This will loop and block until TX is successful or timeout
	CALL	_RF24_get_status
	MOVWF	r0x0c
	BTFSS	r0x0c, 0
	BRA	_00433_DS_
	.line	877; ../../../RF24_c/RF24_cg.c	if( RF24_get_status() & _BV(MAX_RT)){					  //If MAX Retries have been reached
	CALL	_RF24_get_status
	MOVWF	r0x0c
	BTFSS	r0x0c, 4
	BRA	_00431_DS_
	.line	878; ../../../RF24_c/RF24_cg.c	RF24_reUseTX();										  //Set re-transmit and clear the MAX_RT interrupt flag
	CALL	_RF24_reUseTX
	.line	879; ../../../RF24_c/RF24_cg.c	if(millis() - timer > timeout){ return 0; }		  //If this payload has exceeded the user-defined timeout, exit and return 0
	CALL	_millis
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVFF	PRODH, r0x0e
	MOVFF	FSR0L, r0x0f
	MOVF	r0x08, W
	SUBWF	r0x0c, F
	MOVF	r0x09, W
	SUBWFB	r0x0d, F
	MOVF	r0x0a, W
	SUBWFB	r0x0e, F
	MOVF	r0x0b, W
	SUBWFB	r0x0f, F
	MOVF	r0x0f, W
	SUBWF	r0x07, W
	BNZ	_00450_DS_
	MOVF	r0x0e, W
	SUBWF	r0x06, W
	BNZ	_00450_DS_
	MOVF	r0x0d, W
	SUBWF	r0x05, W
	BNZ	_00450_DS_
	MOVF	r0x0c, W
	SUBWF	r0x04, W
_00450_DS_:
	BC	_00431_DS_
	CLRF	WREG
	BRA	_00434_DS_
_00433_DS_:
	.line	893; ../../../RF24_c/RF24_cg.c	RF24_startFastWrite(buf,len,0,1);								  //Write the payload if a buffer is clear
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_startFastWrite
	MOVLW	0x06
	ADDWF	FSR1L, F
	.line	895; ../../../RF24_c/RF24_cg.c	return 1;												  //Return 1 to indicate successful transmission
	MOVLW	0x01
_00434_DS_:
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
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
S_RF24_cg__RF24_write	code
_RF24_write:
	.line	860; ../../../RF24_c/RF24_cg.c	uint8_t RF24_write(const void* buf, uint8_t len ){
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
	.line	861; ../../../RF24_c/RF24_cg.c	return RF24_write_m(buf,len,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_write_m
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_write_m	code
_RF24_write_m:
	.line	822; ../../../RF24_c/RF24_cg.c	uint8_t RF24_write_m( const void* buf, uint8_t len, const uint8_t multicast )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	827; ../../../RF24_c/RF24_cg.c	RF24_startFastWrite(buf,len,multicast,1);
	MOVLW	0x01
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
	CALL	_RF24_startFastWrite
	MOVLW	0x06
	ADDWF	FSR1L, F
_00400_DS_:
	.line	834; ../../../RF24_c/RF24_cg.c	while( ! ( RF24_get_status()  & ( _BV(TX_DS) | _BV(MAX_RT) ))) { 
	CALL	_RF24_get_status
	MOVWF	r0x00
	MOVF	r0x00, W
	ANDLW	0x30
	BZ	_00400_DS_
	.line	847; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	849; ../../../RF24_c/RF24_cg.c	status = RF24_write_register_d(NRF_STATUS,_BV(RX_DR) | _BV(TX_DS) | _BV(MAX_RT) );
	MOVLW	0x70
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	852; ../../../RF24_c/RF24_cg.c	if( status & _BV(MAX_RT)){
	BTFSS	r0x00, 4
	BRA	_00404_DS_
	.line	853; ../../../RF24_c/RF24_cg.c	RF24_flush_tx(); //Only going to be 1 packet int the FIFO at a time using this method, so just flush
	CALL	_RF24_flush_tx
	.line	854; ../../../RF24_c/RF24_cg.c	return 0;
	CLRF	WREG
	BRA	_00405_DS_
_00404_DS_:
	.line	857; ../../../RF24_c/RF24_cg.c	return 1;
	MOVLW	0x01
_00405_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_powerUp	code
_RF24_powerUp:
	.line	791; ../../../RF24_c/RF24_cg.c	void RF24_powerUp(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	793; ../../../RF24_c/RF24_cg.c	uint8_t cfg = RF24_read_register_d(NRF_CONFIG);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	.line	796; ../../../RF24_c/RF24_cg.c	if (!(cfg & _BV(PWR_UP))){
	BTFSC	r0x00, 1
	BRA	_00390_DS_
	.line	797; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_CONFIG, cfg | _BV(PWR_UP));
	BSF	r0x00, 1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	802; ../../../RF24_c/RF24_cg.c	delay(5);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00390_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_powerDown	code
_RF24_powerDown:
	.line	782; ../../../RF24_c/RF24_cg.c	void RF24_powerDown(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	784; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW); // Guarantee CE is low on powerDown
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	785; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_CONFIG,RF24_read_register_d(NRF_CONFIG) & ~_BV(PWR_UP));
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BCF	r0x00, 1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_stopListening	code
_RF24_stopListening:
	.line	754; ../../../RF24_c/RF24_cg.c	void RF24_stopListening(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	756; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	BANKSEL	(_rf + 13)
	.line	758; ../../../RF24_c/RF24_cg.c	delayMicroseconds(rf.txDelay);
	MOVF	(_rf + 13), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_delayMicroseconds
	MOVF	POSTINC1, F
	.line	760; ../../../RF24_c/RF24_cg.c	if(RF24_read_register_d(FEATURE) & _BV(EN_ACK_PAY)){
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BTFSS	r0x00, 1
	BRA	_00369_DS_
	BANKSEL	(_rf + 13)
	.line	761; ../../../RF24_c/RF24_cg.c	delayMicroseconds(rf.txDelay); //200
	MOVF	(_rf + 13), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_delayMicroseconds
	MOVF	POSTINC1, F
	.line	762; ../../../RF24_c/RF24_cg.c	RF24_flush_tx();
	CALL	_RF24_flush_tx
_00369_DS_:
	.line	765; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_CONFIG, ( RF24_read_register_d(NRF_CONFIG) ) & ~_BV(PRIM_RX) );
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BCF	r0x00, 0
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	774; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(EN_RXADDR,RF24_read_register_d(EN_RXADDR) | _BV(pgm_read_byte(&child_pipe_enable[0]))); // Enable RX on pipe0
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVLW	LOW(_child_pipe_enable)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_child_pipe_enable)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_child_pipe_enable)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVLW	0x01
	MOVWF	r0x02
	MOVF	r0x01, W
	BZ	_00377_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00378_DS_:
	RLCF	r0x02, F
	ADDLW	0x01
	BNC	_00378_DS_
_00377_DS_:
	MOVF	r0x02, W
	IORWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_startListening	code
_RF24_startListening:
	.line	723; ../../../RF24_c/RF24_cg.c	void RF24_startListening(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	726; ../../../RF24_c/RF24_cg.c	RF24_powerUp();
	CALL	_RF24_powerUp
	.line	728; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_CONFIG, RF24_read_register_d(NRF_CONFIG) | _BV(PRIM_RX));
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BSF	r0x00, 0
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	729; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS, _BV(RX_DR) | _BV(TX_DS) | _BV(MAX_RT) );
	MOVLW	0x70
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	730; ../../../RF24_c/RF24_cg.c	RF24_ce_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	BANKSEL	(_rf + 7)
	.line	732; ../../../RF24_c/RF24_cg.c	if (rf.pipe0_reading_address[0] > 0){
	MOVF	(_rf + 7), W, B
	BZ	_00350_DS_
	.line	733; ../../../RF24_c/RF24_cg.c	RF24_write_register_c_d(RX_ADDR_P0, rf.pipe0_reading_address, rf.addr_width);	
	MOVLW	HIGH(_rf + 7)
	MOVWF	r0x01
	MOVLW	LOW(_rf + 7)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_rf + 12)
	MOVF	(_rf + 12), W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_c_d
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00351_DS_
_00350_DS_:
	.line	735; ../../../RF24_c/RF24_cg.c	RF24_closeReadingPipe(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_closeReadingPipe
	MOVF	POSTINC1, F
_00351_DS_:
	.line	740; ../../../RF24_c/RF24_cg.c	if(RF24_read_register_d(FEATURE) & _BV(EN_ACK_PAY)){
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	BTFSS	r0x00, 1
	BRA	_00354_DS_
	.line	741; ../../../RF24_c/RF24_cg.c	RF24_flush_tx();
	CALL	_RF24_flush_tx
_00354_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_begin	code
_RF24_begin:
	.line	598; ../../../RF24_c/RF24_cg.c	uint8_t RF24_begin(void )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_rf
	.line	640; ../../../RF24_c/RF24_cg.c	if (rf.ce_pin != rf.csn_pin) pinMode(rf.ce_pin,OUTPUT);  
	MOVF	_rf, W, B
	BANKSEL	(_rf + 1)
	XORWF	(_rf + 1), W, B
	BZ	_00316_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	_rf
	MOVF	_rf, W, B
	MOVWF	POSTDEC1
	CALL	_pinMode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00316_DS_:
	.line	643; ../../../RF24_c/RF24_cg.c	if (rf.ce_pin != rf.csn_pin)
	MOVFF	(_rf + 1), r0x00
	BANKSEL	_rf
	MOVF	_rf, W, B
	XORWF	r0x00, W
	BZ	_00318_DS_
	.line	645; ../../../RF24_c/RF24_cg.c	pinMode(rf.csn_pin,OUTPUT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinMode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00318_DS_:
	.line	647; ../../../RF24_c/RF24_cg.c	SPI_begin();
	CALL	_SPI_begin
	.line	648; ../../../RF24_c/RF24_cg.c	RF24_ce_d(LOW);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_ce_d
	MOVF	POSTINC1, F
	.line	649; ../../../RF24_c/RF24_cg.c	RF24_csn_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_csn_d
	MOVF	POSTINC1, F
	.line	661; ../../../RF24_c/RF24_cg.c	delay( 5 ) ;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	664; ../../../RF24_c/RF24_cg.c	RF24_write_register_d( NRF_CONFIG, 0b00001100 ) ;
	MOVLW	0x0c
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	669; ../../../RF24_c/RF24_cg.c	RF24_setRetries(5,15);
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_RF24_setRetries
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	676; ../../../RF24_c/RF24_cg.c	if( RF24_setDataRate( RF24_250KBPS ) )
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_RF24_setDataRate
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	BZ	_00320_DS_
	.line	678; ../../../RF24_c/RF24_cg.c	rf.p_variant = 1 ;
	MOVLW	0x01
	BANKSEL	(_rf + 4)
	MOVWF	(_rf + 4), B
_00320_DS_:
	.line	680; ../../../RF24_c/RF24_cg.c	setup = RF24_read_register_d(RF_SETUP);
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	.line	688; ../../../RF24_c/RF24_cg.c	RF24_setDataRate( RF24_1MBPS ) ;
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setDataRate
	MOVF	POSTINC1, F
	.line	694; ../../../RF24_c/RF24_cg.c	RF24_toggle_features_d();
	CALL	_RF24_toggle_features_d
	.line	695; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(FEATURE,0 );
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1d
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	696; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(DYNPD,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	700; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_STATUS,_BV(RX_DR) | _BV(TX_DS) | _BV(MAX_RT) );
	MOVLW	0x70
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	705; ../../../RF24_c/RF24_cg.c	RF24_setChannel(76);
	MOVLW	0x4c
	MOVWF	POSTDEC1
	CALL	_RF24_setChannel
	MOVF	POSTINC1, F
	.line	708; ../../../RF24_c/RF24_cg.c	RF24_flush_rx();
	CALL	_RF24_flush_rx
	.line	709; ../../../RF24_c/RF24_cg.c	RF24_flush_tx();
	CALL	_RF24_flush_tx
	.line	711; ../../../RF24_c/RF24_cg.c	RF24_powerUp(); //Power up by default when begin() is called
	CALL	_RF24_powerUp
	.line	715; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(NRF_CONFIG, ( RF24_read_register_d(NRF_CONFIG) ) & ~_BV(PRIM_RX) );
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x01
	MOVF	POSTINC1, F
	BCF	r0x01, 0
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	718; ../../../RF24_c/RF24_cg.c	return ( setup != 0 && setup != 0xff );
	MOVF	r0x00, W
	BZ	_00323_DS_
	MOVF	r0x00, W
	XORLW	0xff
	BNZ	_00324_DS_
_00323_DS_:
	CLRF	r0x00
	BRA	_00325_DS_
_00324_DS_:
	MOVLW	0x01
	MOVWF	r0x00
_00325_DS_:
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_getPayloadSize	code
_RF24_getPayloadSize:
	.line	484; ../../../RF24_c/RF24_cg.c	uint8_t RF24_getPayloadSize(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_rf + 5)
	.line	486; ../../../RF24_c/RF24_cg.c	return rf.payload_size;
	MOVF	(_rf + 5), W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setPayloadSize	code
_RF24_setPayloadSize:
	.line	477; ../../../RF24_c/RF24_cg.c	void RF24_setPayloadSize(uint8_t size)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	479; ../../../RF24_c/RF24_cg.c	rf.payload_size = rf24_min(size,32);
	MOVLW	0x20
	SUBWF	r0x00, W
	BNC	_00301_DS_
	MOVLW	0x20
	MOVWF	r0x00
_00301_DS_:
	MOVF	r0x00, W
	BANKSEL	(_rf + 5)
	MOVWF	(_rf + 5), B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_getChannel	code
_RF24_getChannel:
	.line	470; ../../../RF24_c/RF24_cg.c	uint8_t RF24_getChannel(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	473; ../../../RF24_c/RF24_cg.c	return RF24_read_register_d(RF_CH);
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_RF24_read_register_d
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_setChannel	code
_RF24_setChannel:
	.line	464; ../../../RF24_c/RF24_cg.c	void RF24_setChannel( uint8_t channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	467; ../../../RF24_c/RF24_cg.c	RF24_write_register_d(RF_CH,rf24_min(channel,max_channel));
	MOVLW	0x7d
	SUBWF	r0x00, W
	BNC	_00284_DS_
	MOVLW	0x7d
	MOVWF	r0x00
_00284_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_RF24_write_register_d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_init	code
_RF24_init:
	.line	433; ../../../RF24_c/RF24_cg.c	void RF24_init( uint8_t _cepin, uint8_t _cspin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	435; ../../../RF24_c/RF24_cg.c	rf.ce_pin=_cepin;
	MOVF	r0x00, W
	BANKSEL	_rf
	MOVWF	_rf, B
	.line	436; ../../../RF24_c/RF24_cg.c	rf.csn_pin=_cspin;
	MOVF	r0x01, W
	BANKSEL	(_rf + 1)
	MOVWF	(_rf + 1), B
	BANKSEL	(_rf + 4)
	.line	437; ../../../RF24_c/RF24_cg.c	rf.p_variant=0;
	CLRF	(_rf + 4), B
	.line	438; ../../../RF24_c/RF24_cg.c	rf.payload_size=32;
	MOVLW	0x20
	BANKSEL	(_rf + 5)
	MOVWF	(_rf + 5), B
	BANKSEL	(_rf + 6)
	.line	439; ../../../RF24_c/RF24_cg.c	rf.dynamic_payloads_enabled=0;
	CLRF	(_rf + 6), B
	.line	440; ../../../RF24_c/RF24_cg.c	rf.addr_width=ADDR_WIDTH;
	MOVLW	0x05
	BANKSEL	(_rf + 12)
	MOVWF	(_rf + 12), B
	.line	441; ../../../RF24_c/RF24_cg.c	rf.csDelay=5;
	MOVLW	0x05
	BANKSEL	(_rf + 17)
	MOVWF	(_rf + 17), B
	BANKSEL	(_rf + 18)
	CLRF	(_rf + 18), B
	BANKSEL	(_rf + 19)
	CLRF	(_rf + 19), B
	BANKSEL	(_rf + 20)
	CLRF	(_rf + 20), B
	BANKSEL	(_rf + 7)
	.line	442; ../../../RF24_c/RF24_cg.c	rf.pipe0_reading_address[0]=0;
	CLRF	(_rf + 7), B
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_get_status	code
_RF24_get_status:
	.line	355; ../../../RF24_c/RF24_cg.c	uint8_t RF24_get_status(void )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	357; ../../../RF24_c/RF24_cg.c	return RF24_spiTrans( NOP_);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24_spiTrans
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_flush_tx	code
_RF24_flush_tx:
	.line	348; ../../../RF24_c/RF24_cg.c	uint8_t RF24_flush_tx(void )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	350; ../../../RF24_c/RF24_cg.c	return RF24_spiTrans( FLUSH_TX );
	MOVLW	0xe1
	MOVWF	POSTDEC1
	CALL	_RF24_spiTrans
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_flush_rx	code
_RF24_flush_rx:
	.line	341; ../../../RF24_c/RF24_cg.c	uint8_t RF24_flush_rx(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	.line	343; ../../../RF24_c/RF24_cg.c	return RF24_spiTrans( FLUSH_RX );
	MOVLW	0xe2
	MOVWF	POSTDEC1
	CALL	_RF24_spiTrans
	MOVWF	r0x00
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_spiTrans	code
_RF24_spiTrans:
	.line	327; ../../../RF24_c/RF24_cg.c	uint8_t RF24_spiTrans(uint8_t cmd){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	331; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	332; ../../../RF24_c/RF24_cg.c	status = SPI_transfer( cmd );
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x00
	MOVF	POSTINC1, F
	.line	333; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	335; ../../../RF24_c/RF24_cg.c	return status;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_read_payload	code
_RF24_read_payload:
	.line	272; ../../../RF24_c/RF24_cg.c	uint8_t RF24_read_payload(void* buf, uint8_t data_len)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	.line	275; ../../../RF24_c/RF24_cg.c	uint8_t* current = (uint8_t*)(buf);
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	.line	278; ../../../RF24_c/RF24_cg.c	if(data_len > rf.payload_size) data_len = rf.payload_size;
	MOVFF	(_rf + 5), r0x04
	MOVF	r0x03, W
	SUBWF	r0x04, W
	BC	_00219_DS_
	MOVFF	r0x04, r0x03
_00219_DS_:
	BANKSEL	(_rf + 6)
	.line	279; ../../../RF24_c/RF24_cg.c	blank_len = rf.dynamic_payloads_enabled ? 0 : rf.payload_size - data_len;
	MOVF	(_rf + 6), W, B
	BZ	_00228_DS_
	CLRF	r0x05
	BRA	_00229_DS_
_00228_DS_:
	MOVF	r0x03, W
	SUBWF	r0x04, W
	MOVWF	r0x05
_00229_DS_:
	MOVFF	r0x05, r0x04
	.line	311; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	312; ../../../RF24_c/RF24_cg.c	status = SPI_transfer( R_RX_PAYLOAD );
	MOVLW	0x61
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x05
	MOVF	POSTINC1, F
_00220_DS_:
	.line	313; ../../../RF24_c/RF24_cg.c	while ( data_len-- ) {
	MOVFF	r0x03, r0x06
	DECF	r0x03, F
	MOVF	r0x06, W
	BZ	_00235_DS_
	.line	314; ../../../RF24_c/RF24_cg.c	*current++ = SPI_transfer(0xFF);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x06
	MOVF	POSTINC1, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BNC	_00220_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00251_DS_:
	BRA	_00220_DS_
_00235_DS_:
	.line	316; ../../../RF24_c/RF24_cg.c	while ( blank_len-- ) {
	MOVFF	r0x04, r0x00
_00223_DS_:
	MOVFF	r0x00, r0x01
	DECF	r0x00, F
	MOVF	r0x01, W
	BZ	_00225_DS_
	.line	317; ../../../RF24_c/RF24_cg.c	SPI_transfer(0xff);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	BRA	_00223_DS_
_00225_DS_:
	.line	319; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	323; ../../../RF24_c/RF24_cg.c	return status;
	MOVF	r0x05, W
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
S_RF24_cg__RF24_write_payload	code
_RF24_write_payload:
	.line	224; ../../../RF24_c/RF24_cg.c	uint8_t RF24_write_payload(const void* buf, uint8_t data_len, const uint8_t writeType)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	227; ../../../RF24_c/RF24_cg.c	const uint8_t* current = (const uint8_t*)(buf);
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	.line	230; ../../../RF24_c/RF24_cg.c	data_len = rf24_min(data_len, rf.payload_size);
	MOVFF	(_rf + 5), r0x05
	MOVF	r0x05, W
	SUBWF	r0x03, W
	BC	_00188_DS_
	MOVFF	r0x03, r0x06
	BRA	_00189_DS_
_00188_DS_:
	MOVFF	r0x05, r0x06
_00189_DS_:
	MOVFF	r0x06, r0x03
	BANKSEL	(_rf + 6)
	.line	231; ../../../RF24_c/RF24_cg.c	blank_len = rf.dynamic_payloads_enabled ? 0 : rf.payload_size - data_len;
	MOVF	(_rf + 6), W, B
	BZ	_00190_DS_
	CLRF	r0x06
	BRA	_00191_DS_
_00190_DS_:
	MOVF	r0x03, W
	SUBWF	r0x05, W
	MOVWF	r0x06
_00191_DS_:
	MOVFF	r0x06, r0x05
	.line	255; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	256; ../../../RF24_c/RF24_cg.c	status = SPI_transfer( writeType );
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x04
	MOVF	POSTINC1, F
_00180_DS_:
	.line	257; ../../../RF24_c/RF24_cg.c	while ( data_len-- ) {
	MOVFF	r0x03, r0x06
	DECF	r0x03, F
	MOVF	r0x06, W
	BZ	_00197_DS_
	.line	258; ../../../RF24_c/RF24_cg.c	SPI_transfer(*current++);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BNC	_00213_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00213_DS_:
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	BRA	_00180_DS_
_00197_DS_:
	.line	260; ../../../RF24_c/RF24_cg.c	while ( blank_len-- ) {
	MOVFF	r0x05, r0x00
_00183_DS_:
	MOVFF	r0x00, r0x01
	DECF	r0x00, F
	MOVF	r0x01, W
	BZ	_00185_DS_
	.line	261; ../../../RF24_c/RF24_cg.c	SPI_transfer(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	BRA	_00183_DS_
_00185_DS_:
	.line	263; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	267; ../../../RF24_c/RF24_cg.c	return status;
	MOVF	r0x04, W
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
S_RF24_cg__RF24_write_register_d	code
_RF24_write_register_d:
	.line	194; ../../../RF24_c/RF24_cg.c	uint8_t RF24_write_register_d(uint8_t reg, uint8_t value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	212; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	213; ../../../RF24_c/RF24_cg.c	status = SPI_transfer( W_REGISTER | ( REGISTER_MASK & reg ) );
	MOVLW	0x1f
	ANDWF	r0x00, F
	BSF	r0x00, 5
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x00
	MOVF	POSTINC1, F
	.line	214; ../../../RF24_c/RF24_cg.c	SPI_transfer(value);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	.line	215; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	219; ../../../RF24_c/RF24_cg.c	return status;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_write_register_c_d	code
_RF24_write_register_c_d:
	.line	162; ../../../RF24_c/RF24_cg.c	uint8_t RF24_write_register_c_d(uint8_t reg, const uint8_t* buf, uint8_t len)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	181; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	182; ../../../RF24_c/RF24_cg.c	status = SPI_transfer( W_REGISTER | ( REGISTER_MASK & reg ) );
	MOVLW	0x1f
	ANDWF	r0x00, F
	BSF	r0x00, 5
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x00
	MOVF	POSTINC1, F
_00156_DS_:
	.line	183; ../../../RF24_c/RF24_cg.c	while ( len-- )
	MOVFF	r0x04, r0x05
	DECF	r0x04, F
	MOVF	r0x05, W
	BZ	_00158_DS_
	.line	184; ../../../RF24_c/RF24_cg.c	SPI_transfer(*buf++);
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
	MOVWF	r0x05
	INCF	r0x01, F
	BNC	_00170_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00170_DS_:
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	BRA	_00156_DS_
_00158_DS_:
	.line	185; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	189; ../../../RF24_c/RF24_cg.c	return status;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_read_register_d	code
_RF24_read_register_d:
	.line	131; ../../../RF24_c/RF24_cg.c	uint8_t RF24_read_register_d(uint8_t reg)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	150; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	151; ../../../RF24_c/RF24_cg.c	SPI_transfer( R_REGISTER | ( REGISTER_MASK & reg ) );
	MOVLW	0x1f
	ANDWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVF	POSTINC1, F
	.line	152; ../../../RF24_c/RF24_cg.c	result = SPI_transfer(0xff);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x00
	MOVF	POSTINC1, F
	.line	153; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	157; ../../../RF24_c/RF24_cg.c	return result;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_read_register_m_d	code
_RF24_read_register_m_d:
	.line	93; ../../../RF24_c/RF24_cg.c	uint8_t RF24_read_register_m_d(uint8_t reg, uint8_t* buf, uint8_t len)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	.line	117; ../../../RF24_c/RF24_cg.c	RF24_beginTransaction();
	CALL	_RF24_beginTransaction
	.line	118; ../../../RF24_c/RF24_cg.c	status = SPI_transfer( R_REGISTER | ( REGISTER_MASK & reg ) );
	MOVLW	0x1f
	ANDWF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x00
	MOVF	POSTINC1, F
_00133_DS_:
	.line	119; ../../../RF24_c/RF24_cg.c	while ( len-- ){
	MOVFF	r0x04, r0x05
	DECF	r0x04, F
	MOVF	r0x05, W
	BZ	_00135_DS_
	.line	120; ../../../RF24_c/RF24_cg.c	*buf++ = SPI_transfer(0xff);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_SPI_transfer
	MOVWF	r0x05
	MOVF	POSTINC1, F
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrput1
	INCF	r0x01, F
	BNC	_00133_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00146_DS_:
	BRA	_00133_DS_
_00135_DS_:
	.line	122; ../../../RF24_c/RF24_cg.c	RF24_endTransaction();
	CALL	_RF24_endTransaction
	.line	126; ../../../RF24_c/RF24_cg.c	return status;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_endTransaction	code
_RF24_endTransaction:
	.line	84; ../../../RF24_c/RF24_cg.c	void RF24_endTransaction(void) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	85; ../../../RF24_c/RF24_cg.c	RF24_csn_d(HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24_csn_d
	MOVF	POSTINC1, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_beginTransaction	code
_RF24_beginTransaction:
	.line	75; ../../../RF24_c/RF24_cg.c	void RF24_beginTransaction(void ) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	79; ../../../RF24_c/RF24_cg.c	RF24_csn_d(LOW);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_csn_d
	MOVF	POSTINC1, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_ce_d	code
_RF24_ce_d:
	.line	67; ../../../RF24_c/RF24_cg.c	void RF24_ce_d(uint8_t level)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	BANKSEL	_rf
	.line	70; ../../../RF24_c/RF24_cg.c	if (rf.ce_pin != rf.csn_pin) digitalWrite(rf.ce_pin,level);
	MOVF	_rf, W, B
	BANKSEL	(_rf + 1)
	XORWF	(_rf + 1), W, B
	BZ	_00112_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	_rf
	MOVF	_rf, W, B
	MOVWF	POSTDEC1
	CALL	_digitalWrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00112_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24_cg__RF24_csn_d	code
_RF24_csn_d:
	.line	22; ../../../RF24_c/RF24_cg.c	void RF24_csn_d( uint8_t mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	59; ../../../RF24_c/RF24_cg.c	digitalWrite(rf.csn_pin,mode);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_rf + 1)
	MOVF	(_rf + 1), W, B
	MOVWF	POSTDEC1
	CALL	_digitalWrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	(_rf + 17)
	.line	60; ../../../RF24_c/RF24_cg.c	delayMicroseconds(rf.csDelay);
	MOVF	(_rf + 17), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_delayMicroseconds
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block for Ival
	code
_child_pipe_enable:
	DB	0x00, 0x01, 0x02, 0x03, 0x04, 0x05
; ; Starting pCode block for Ival
_child_pipe:
	DB	0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
; ; Starting pCode block for Ival
_child_payload_size:
	DB	0x11, 0x12, 0x13, 0x14, 0x15, 0x16


; Statistics:
; code size:	 8148 (0x1fd4) bytes ( 6.22%)
;           	 4074 (0x0fea) words
; udata size:	   32 (0x0020) bytes ( 0.83%)
; access size:	   16 (0x0010) bytes


	end
