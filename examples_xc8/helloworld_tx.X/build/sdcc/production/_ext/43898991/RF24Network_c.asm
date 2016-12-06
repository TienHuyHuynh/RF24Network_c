;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 3.6.0 #9615 [pic16 port]"
	.file	"../../RF24Network_c.c"
	list	p=18f4620
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_RF24NH_init
	global	_RF24N_init
	global	_RF24N_begin_d
	global	_RF24N_update
	global	_RF24N_enqueue
	global	_RF24N_available
	global	_RF24N_parent
	global	_RF24N_peek
	global	_RF24N_read
	global	_RF24N_multicast
	global	_RF24N_write_m
	global	_RF24N_write_
	global	_RF24N__write
	global	_RF24N_write
	global	_RF24N_logicalToPhysicalAddress
	global	_RF24N_write_to_pipe
	global	_RF24N_is_direct_child
	global	_RF24N_is_descendant
	global	_RF24N_setup_address
	global	_RF24N_addressOfPipe
	global	_RF24N_direct_child_route_to
	global	_RF24N_is_valid_address
	global	_RF24N_multicastLevel
	global	_RF24N_levelToAddress
	global	_RF24N_pipe_address
	global	_RF24N_begin
	global	_RF24N_getFrame_buffer
	global	_RF24N_setReturnSysMsgs
	global	_RF24N_getNetworkFlags
	global	_RF24N_setNetworkFlags
	global	_RF24N_getRouteTimeout
	global	_RF24N_getFrag_ptr
	global	_RF24N_setMulticastRelay

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrput2
	extern	__gptrput1
	extern	__gptrget2
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
	extern	_memmove
	extern	_millis
	extern	_delay
	extern	_delayMicroseconds
	extern	_RF24_startListening
	extern	_RF24_stopListening
	extern	_RF24_read
	extern	_RF24_available_p
	extern	_RF24_writeFast_m
	extern	_RF24_txStandBy_t
	extern	_RF24_isValid
	extern	_RF24_setRetries
	extern	_RF24_setChannel
	extern	_RF24_getDynamicPayloadSize
	extern	_RF24_enableDynamicPayloads
	extern	_RF24_setAutoAck_p
	extern	_RF24_openReadingPipe_d
	extern	_RF24_openWritingPipe_d
	extern	__moduint
	extern	__mullong
	extern	__divuint
	extern	__mulint

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
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


	idata
_next_id	db	0x01, 0x00
_RF24N_pipe_address_address_translation_1_315	db	0xc3, 0x3c, 0x33, 0xce, 0x3e, 0xe3, 0xec


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
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1
r0x16	res	1
r0x17	res	1
r0x18	res	1
r0x19	res	1
r0x1a	res	1

udata_RF24Network_c_0	udata
_rn	res	373

udata_RF24Network_c_1	udata
_RF24N_begin_d_addr_2_185	res	5

udata_RF24Network_c_2	udata
_RF24N_update_pipe_num_1_186	res	1

udata_RF24Network_c_3	udata
_RF24N_enqueue_message_size_1_210	res	2

udata_RF24Network_c_4	udata
_RF24N_peek_msg_size_2_234	res	2

udata_RF24Network_c_5	udata
_RF24N_read_bufsize_1_236	res	2

udata_RF24Network_c_6	udata
_RF24N_write_conversion_1_270	res	4

udata_RF24Network_c_7	udata
_RF24N_write_to_pipe_out_pipe_1_285	res	5

udata_RF24Network_c_8	udata
_RF24N_multicastLevel_addr_1_309	res	5

udata_RF24Network_c_9	udata
_RF24N_pipe_address_result_1_315	res	5

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_RF24Network_c__RF24N_setMulticastRelay	code
_RF24N_setMulticastRelay:
	.line	1446; ../../RF24Network_c.c	void  RF24N_setMulticastRelay(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	1448; ../../RF24Network_c.c	rn.multicastRelay=1;
	MOVLW	0x01
	BANKSEL	_rn
	MOVWF	_rn, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_getFrag_ptr	code
_RF24N_getFrag_ptr:
	.line	1439; ../../RF24Network_c.c	RF24NetworkFrame* RF24N_getFrag_ptr(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	1440; ../../RF24Network_c.c	return rn.frag_ptr;
	MOVFF	(_rn + 41), PRODH
	MOVFF	(_rn + 40), PRODL
	BANKSEL	(_rn + 39)
	MOVF	(_rn + 39), W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_getRouteTimeout	code
_RF24N_getRouteTimeout:
	.line	1433; ../../RF24Network_c.c	uint16_t RF24N_getRouteTimeout(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	1434; ../../RF24Network_c.c	return rn.routeTimeout; 
	MOVFF	(_rn + 6), PRODL
	BANKSEL	(_rn + 5)
	MOVF	(_rn + 5), W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_setNetworkFlags	code
_RF24N_setNetworkFlags:
	.line	1428; ../../RF24Network_c.c	void RF24N_setNetworkFlags(uint8_t nf){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1429; ../../RF24Network_c.c	rn.networkFlags=nf; 
	MOVF	r0x00, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_getNetworkFlags	code
_RF24N_getNetworkFlags:
	.line	1424; ../../RF24Network_c.c	uint8_t RF24N_getNetworkFlags(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_rn + 43)
	.line	1425; ../../RF24Network_c.c	return rn.networkFlags; 
	MOVF	(_rn + 43), W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_setReturnSysMsgs	code
_RF24N_setReturnSysMsgs:
	.line	1419; ../../RF24Network_c.c	void    RF24N_setReturnSysMsgs(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	1420; ../../RF24Network_c.c	rn.returnSysMsgs=1;
	MOVLW	0x01
	BANKSEL	(_rn + 42)
	MOVWF	(_rn + 42), B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_getFrame_buffer	code
_RF24N_getFrame_buffer:
	.line	1413; ../../RF24Network_c.c	uint8_t * RF24N_getFrame_buffer(void){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	1414; ../../RF24Network_c.c	return rn.frame_buffer;
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_begin	code
_RF24N_begin:
	.line	1407; ../../RF24Network_c.c	void RF24N_begin(uint16_t _node_address){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	.line	1408; ../../RF24Network_c.c	RF24N_begin_d(USE_CURRENT_CHANNEL,_node_address);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24N_begin_d
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_pipe_address	code
_RF24N_pipe_address:
	.line	1359; ../../RF24Network_c.c	void RF24N_pipe_address( uint16_t node, uint8_t pipe ,raddr_t * address)
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
	MOVFF	r0x10, POSTDEC1
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
	.line	1363; ../../RF24Network_c.c	raddr_t result[5] = {0xCC,0xCC,0xCC,0xCC,0xCC};
	MOVLW	0xcc
	BANKSEL	_RF24N_pipe_address_result_1_315
	MOVWF	_RF24N_pipe_address_result_1_315, B
	MOVLW	0xcc
	BANKSEL	(_RF24N_pipe_address_result_1_315 + 1)
	MOVWF	(_RF24N_pipe_address_result_1_315 + 1), B
	MOVLW	0xcc
	BANKSEL	(_RF24N_pipe_address_result_1_315 + 2)
	MOVWF	(_RF24N_pipe_address_result_1_315 + 2), B
	MOVLW	0xcc
	BANKSEL	(_RF24N_pipe_address_result_1_315 + 3)
	MOVWF	(_RF24N_pipe_address_result_1_315 + 3), B
	MOVLW	0xcc
	BANKSEL	(_RF24N_pipe_address_result_1_315 + 4)
	MOVWF	(_RF24N_pipe_address_result_1_315 + 4), B
	.line	1364; ../../RF24Network_c.c	uint8_t* out = (uint8_t*)(result);
	MOVLW	HIGH(_RF24N_pipe_address_result_1_315)
	MOVWF	r0x07
	MOVLW	LOW(_RF24N_pipe_address_result_1_315)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	.line	1369; ../../RF24Network_c.c	uint8_t count = 1; uint16_t dec = node;
	MOVFF	r0x00, r0x09
	MOVFF	r0x01, r0x0a
	.line	1371; ../../RF24Network_c.c	while(dec){
	MOVLW	0x01
	MOVWF	r0x0b
_00931_DS_:
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00933_DS_
	.line	1373; ../../RF24Network_c.c	if(pipe != 0 || !node)
	MOVF	r0x02, W
	BNZ	_00928_DS_
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00929_DS_
_00928_DS_:
	.line	1375; ../../RF24Network_c.c	out[count]=address_translation[(dec % 8)];		// Convert our decimal values to octal, translate them to address bytes, and set our address
	MOVF	r0x0b, W
	ADDWF	r0x06, W
	MOVWF	r0x0c
	CLRF	WREG
	ADDWFC	r0x07, W
	MOVWF	r0x0d
	CLRF	WREG
	ADDWFC	r0x08, W
	MOVWF	r0x0e
	MOVLW	0x07
	ANDWF	r0x09, W
	MOVWF	r0x0f
	CLRF	r0x10
	MOVLW	LOW(_RF24N_pipe_address_address_translation_1_315)
	ADDWF	r0x0f, F
	MOVLW	HIGH(_RF24N_pipe_address_address_translation_1_315)
	ADDWFC	r0x10, F
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, FSR0H
	MOVFF	INDF0, r0x0f
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
_00929_DS_:
	.line	1377; ../../RF24Network_c.c	dec /= 8;	
	BCF	STATUS, 0
	RRCF	r0x0a, F
	RRCF	r0x09, F
	BCF	STATUS, 0
	RRCF	r0x0a, F
	RRCF	r0x09, F
	BCF	STATUS, 0
	RRCF	r0x0a, F
	RRCF	r0x09, F
	.line	1378; ../../RF24Network_c.c	count++;
	INCF	r0x0b, F
	BRA	_00931_DS_
_00933_DS_:
	.line	1382; ../../RF24Network_c.c	if(pipe != 0 || !node)
	MOVF	r0x02, W
	BNZ	_00934_DS_
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00935_DS_
_00934_DS_:
	.line	1384; ../../RF24Network_c.c	out[0] = address_translation[pipe];
	CLRF	r0x00
	MOVLW	LOW(_RF24N_pipe_address_address_translation_1_315)
	ADDWF	r0x02, F
	MOVLW	HIGH(_RF24N_pipe_address_address_translation_1_315)
	ADDWFC	r0x00, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x00, FSR0H
	MOVFF	INDF0, r0x02
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
	BRA	_00947_DS_
_00935_DS_:
	.line	1387; ../../RF24Network_c.c	out[1] = address_translation[count-1];
	INCF	r0x06, F
	BNC	_00961_DS_
	INFSNZ	r0x07, F
	INCF	r0x08, F
_00961_DS_:
	DECF	r0x0b, F
	CLRF	r0x00
	MOVLW	LOW(_RF24N_pipe_address_address_translation_1_315)
	ADDWF	r0x0b, F
	MOVLW	HIGH(_RF24N_pipe_address_address_translation_1_315)
	ADDWFC	r0x00, F
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x00, FSR0H
	MOVFF	INDF0, r0x0b
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
_00947_DS_:
	.line	1399; ../../RF24Network_c.c	for(i=0;i<5;i++)
	CLRF	r0x00
_00939_DS_:
	.line	1401; ../../RF24Network_c.c	address[i]=result[4-i];
	MOVF	r0x00, W
	ADDWF	r0x03, W
	MOVWF	r0x01
	CLRF	WREG
	ADDWFC	r0x04, W
	MOVWF	r0x02
	CLRF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x06
	MOVF	r0x00, W
	SUBLW	0x04
	MOVWF	r0x07
	CLRF	r0x08
	MOVLW	LOW(_RF24N_pipe_address_result_1_315)
	ADDWF	r0x07, F
	MOVLW	HIGH(_RF24N_pipe_address_result_1_315)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	INDF0, r0x07
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	.line	1399; ../../RF24Network_c.c	for(i=0;i<5;i++)
	INCF	r0x00, F
	MOVLW	0x05
	SUBWF	r0x00, W
	BNC	_00939_DS_
	MOVFF	PREINC1, r0x10
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
S_RF24Network_c__RF24N_levelToAddress	code
_RF24N_levelToAddress:
	.line	1346; ../../RF24Network_c.c	uint16_t RF24N_levelToAddress(uint8_t level){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1349; ../../RF24Network_c.c	if(level){
	MOVF	r0x00, W
	BZ	_00913_DS_
	.line	1350; ../../RF24Network_c.c	levelAddr = levelAddr << ((level-1) * 3);
	CLRF	r0x01
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x01
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	r0x03
	MOVF	r0x00, W
	BZ	_00914_DS_
	BN	_00923_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00921_DS_:
	RLCF	r0x02, F
	RLCF	r0x03, F
	ADDLW	0x01
	BNC	_00921_DS_
	BRA	_00914_DS_
_00923_DS_:
	BCF	STATUS, 0
_00922_DS_:
	RRCF	r0x03, F
	RRCF	r0x02, F
	ADDLW	0x01
	BNC	_00922_DS_
_00920_DS_:
	BRA	_00914_DS_
_00913_DS_:
	.line	1352; ../../RF24Network_c.c	return 0;		
	CLRF	PRODL
	CLRF	WREG
	BRA	_00915_DS_
_00914_DS_:
	.line	1354; ../../RF24Network_c.c	return levelAddr;
	MOVFF	r0x03, PRODL
	MOVF	r0x02, W
_00915_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_multicastLevel	code
_RF24N_multicastLevel:
	.line	1337; ../../RF24Network_c.c	void RF24N_multicastLevel(uint8_t level){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	.line	1339; ../../RF24Network_c.c	rn.multicast_level = level;
	MOVF	r0x00, W
	BANKSEL	(_rn + 48)
	MOVWF	(_rn + 48), B
	.line	1341; ../../RF24Network_c.c	RF24N_pipe_address(RF24N_levelToAddress(level),0,addr);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_levelToAddress
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	POSTINC1, F
	MOVLW	HIGH(_RF24N_multicastLevel_addr_1_309)
	MOVWF	r0x03
	MOVLW	LOW(_RF24N_multicastLevel_addr_1_309)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_pipe_address
	MOVLW	0x06
	ADDWF	FSR1L, F
	.line	1342; ../../RF24Network_c.c	RF24_openReadingPipe_d(0,addr);
	MOVLW	HIGH(_RF24N_multicastLevel_addr_1_309)
	MOVWF	r0x01
	MOVLW	LOW(_RF24N_multicastLevel_addr_1_309)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_openReadingPipe_d
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_is_valid_address	code
_RF24N_is_valid_address:
	.line	1312; ../../RF24Network_c.c	uint8_t RF24N_is_valid_address( uint16_t node )
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
	.line	1314; ../../RF24Network_c.c	uint8_t result = 1;
	MOVLW	0x01
	MOVWF	r0x02
_00887_DS_:
	.line	1316; ../../RF24Network_c.c	while(node)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00889_DS_
	.line	1318; ../../RF24Network_c.c	uint8_t digit = node & 0x07;
	MOVLW	0x07
	ANDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	.line	1322; ../../RF24Network_c.c	if (/*(digit < 0) ||*/ (digit > 5))	//Allow our out of range multicast address
	MOVLW	0x06
	SUBWF	r0x03, W
	BNC	_00886_DS_
	.line	1325; ../../RF24Network_c.c	result = 0;
	CLRF	r0x02
	.line	1327; ../../RF24Network_c.c	break;
	BRA	_00889_DS_
_00886_DS_:
	.line	1329; ../../RF24Network_c.c	node >>= 3;
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BRA	_00887_DS_
_00889_DS_:
	.line	1332; ../../RF24Network_c.c	return result;
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_direct_child_route_to	code
_RF24N_direct_child_route_to:
	.line	1286; ../../RF24Network_c.c	uint16_t RF24N_direct_child_route_to( uint16_t node )
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
	BANKSEL	(_rn + 57)
	.line	1289; ../../RF24Network_c.c	uint16_t child_mask = ( rn.node_mask << 3 ) | 0x07;
	MOVF	(_rn + 57), W, B
	MOVWF	r0x02
	ADDWF	r0x02, F
	BANKSEL	(_rn + 58)
	RLCF	(_rn + 58), W, B
	MOVWF	r0x03
	BCF	STATUS, 0
	RLCF	r0x02, F
	RLCF	r0x03, F
	BCF	STATUS, 0
	RLCF	r0x02, F
	RLCF	r0x03, F
	MOVLW	0x07
	IORWF	r0x02, F
	.line	1290; ../../RF24Network_c.c	return node & child_mask;
	MOVF	r0x02, W
	ANDWF	r0x00, F
	MOVF	r0x03, W
	ANDWF	r0x01, F
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_addressOfPipe	code
_RF24N_addressOfPipe:
	.line	1269; ../../RF24Network_c.c	uint16_t RF24N_addressOfPipe( uint16_t node, uint8_t pipeNo )
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
	.line	1274; ../../RF24Network_c.c	uint16_t m = rn.node_mask >> 3;
	BCF	STATUS, 0
	BANKSEL	(_rn + 58)
	RRCF	(_rn + 58), W, B
	MOVWF	r0x04
	BANKSEL	(_rn + 57)
	RRCF	(_rn + 57), W, B
	MOVWF	r0x03
	BCF	STATUS, 0
	RRCF	r0x04, F
	RRCF	r0x03, F
	BCF	STATUS, 0
	RRCF	r0x04, F
	RRCF	r0x03, F
	.line	1277; ../../RF24Network_c.c	while (m){ 	   //While there are bits left in the node mask
	CLRF	r0x05
_00862_DS_:
	MOVF	r0x03, W
	IORWF	r0x04, W
	BZ	_00864_DS_
	.line	1278; ../../RF24Network_c.c	m>>=1;     //Shift to the right
	BCF	STATUS, 0
	RRCF	r0x04, F
	RRCF	r0x03, F
	.line	1279; ../../RF24Network_c.c	i++;       //Count the # of increments
	INCF	r0x05, F
	BRA	_00862_DS_
_00864_DS_:
	.line	1281; ../../RF24Network_c.c	return node | (pipeNo << i);	
	CLRF	r0x03
	MOVFF	r0x02, r0x04
	MOVFF	r0x03, r0x06
	MOVF	r0x05, W
	BZ	_00874_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00875_DS_:
	RLCF	r0x04, F
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00875_DS_
_00874_DS_:
	MOVF	r0x04, W
	MOVWF	r0x05
	MOVF	r0x06, W
	MOVWF	r0x07
	MOVF	r0x05, W
	IORWF	r0x00, F
	MOVF	r0x07, W
	IORWF	r0x01, F
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
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
S_RF24Network_c__RF24N_setup_address	code
_RF24N_setup_address:
	.line	1225; ../../RF24Network_c.c	void RF24N_setup_address(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	.line	1228; ../../RF24Network_c.c	uint16_t node_mask_check = 0xFFFF;  
	MOVLW	0xff
	MOVWF	r0x00
	MOVWF	r0x01
	.line	1236; ../../RF24Network_c.c	while ( rn.node_address & node_mask_check ){
	CLRF	r0x02
_00851_DS_:
	MOVF	r0x00, W
	BANKSEL	(_rn + 49)
	ANDWF	(_rn + 49), W, B
	MOVWF	r0x03
	MOVF	r0x01, W
	BANKSEL	(_rn + 50)
	ANDWF	(_rn + 50), W, B
	MOVWF	r0x04
	MOVF	r0x03, W
	IORWF	r0x04, W
	BZ	_00853_DS_
	.line	1237; ../../RF24Network_c.c	node_mask_check <<= 3;
	MOVF	r0x00, W
	ADDWF	r0x00, F
	RLCF	r0x01, F
	BCF	STATUS, 0
	RLCF	r0x00, F
	RLCF	r0x01, F
	BCF	STATUS, 0
	RLCF	r0x00, F
	RLCF	r0x01, F
	.line	1239; ../../RF24Network_c.c	count++;
	INCF	r0x02, F
	BRA	_00851_DS_
_00853_DS_:
	.line	1241; ../../RF24Network_c.c	rn.multicast_level = count;
	MOVF	r0x02, W
	BANKSEL	(_rn + 48)
	MOVWF	(_rn + 48), B
	.line	1246; ../../RF24Network_c.c	rn.node_mask = ~ node_mask_check;
	COMF	r0x00, F
	COMF	r0x01, F
	MOVF	r0x00, W
	BANKSEL	(_rn + 57)
	MOVWF	(_rn + 57), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 58)
	MOVWF	(_rn + 58), B
	.line	1249; ../../RF24Network_c.c	parent_mask = rn.node_mask >> 3;
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	.line	1252; ../../RF24Network_c.c	rn.parent_node = rn.node_address & parent_mask;
	MOVF	r0x00, W
	BANKSEL	(_rn + 49)
	ANDWF	(_rn + 49), W, B
	MOVWF	r0x02
	MOVF	r0x01, W
	BANKSEL	(_rn + 50)
	ANDWF	(_rn + 50), W, B
	MOVWF	r0x03
	MOVF	r0x02, W
	BANKSEL	(_rn + 54)
	MOVWF	(_rn + 54), B
	MOVF	r0x03, W
	BANKSEL	(_rn + 55)
	MOVWF	(_rn + 55), B
	.line	1255; ../../RF24Network_c.c	i = rn.node_address;
	MOVFF	(_rn + 49), r0x02
	MOVFF	(_rn + 50), r0x03
_00854_DS_:
	.line	1257; ../../RF24Network_c.c	while (m)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00856_DS_
	.line	1259; ../../RF24Network_c.c	i >>= 3;
	BCF	STATUS, 0
	RRCF	r0x03, F
	RRCF	r0x02, F
	BCF	STATUS, 0
	RRCF	r0x03, F
	RRCF	r0x02, F
	BCF	STATUS, 0
	RRCF	r0x03, F
	RRCF	r0x02, F
	.line	1260; ../../RF24Network_c.c	m >>= 3;
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BRA	_00854_DS_
_00856_DS_:
	.line	1262; ../../RF24Network_c.c	rn.parent_pipe = i;
	MOVF	r0x02, W
	BANKSEL	(_rn + 56)
	MOVWF	(_rn + 56), B
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_is_descendant	code
_RF24N_is_descendant:
	.line	1218; ../../RF24Network_c.c	uint8_t RF24N_is_descendant( uint16_t node )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	BANKSEL	(_rn + 57)
	.line	1220; ../../RF24Network_c.c	return ( node & rn.node_mask ) == rn.node_address;
	MOVF	(_rn + 57), W, B
	ANDWF	r0x00, F
	BANKSEL	(_rn + 58)
	MOVF	(_rn + 58), W, B
	ANDWF	r0x01, F
	MOVF	r0x00, W
	BANKSEL	(_rn + 49)
	XORWF	(_rn + 49), W, B
	BNZ	_00845_DS_
	MOVF	r0x01, W
	BANKSEL	(_rn + 50)
	XORWF	(_rn + 50), W, B
	BNZ	_00845_DS_
	CLRF	r0x00
	INCF	r0x00, F
	BRA	_00846_DS_
_00845_DS_:
	CLRF	r0x00
_00846_DS_:
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_is_direct_child	code
_RF24N_is_direct_child:
	.line	1196; ../../RF24Network_c.c	uint8_t RF24N_is_direct_child( uint16_t node )
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
	.line	1198; ../../RF24Network_c.c	uint8_t result = 0;
	CLRF	r0x02
	.line	1207; ../../RF24Network_c.c	if ( RF24N_is_descendant(node) )
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_is_descendant
	MOVWF	r0x03
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x03, W
	BZ	_00829_DS_
	BANKSEL	(_rn + 57)
	.line	1210; ../../RF24Network_c.c	uint16_t child_node_mask = ( ~ rn.node_mask ) << 3;
	COMF	(_rn + 57), W, B
	MOVWF	r0x03
	BANKSEL	(_rn + 58)
	COMF	(_rn + 58), W, B
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x05
	ADDWF	r0x05, F
	RLCF	r0x04, W
	MOVWF	r0x06
	BCF	STATUS, 0
	RLCF	r0x05, F
	RLCF	r0x06, F
	BCF	STATUS, 0
	RLCF	r0x05, F
	RLCF	r0x06, F
	.line	1211; ../../RF24Network_c.c	result = ( node & child_node_mask ) == 0 ;
	MOVF	r0x05, W
	ANDWF	r0x00, F
	MOVF	r0x06, W
	ANDWF	r0x01, F
	CLRF	r0x02
	MOVF	r0x00, W
	BNZ	_00829_DS_
	MOVF	r0x01, W
	BNZ	_00829_DS_
	INCF	r0x02, F
_00829_DS_:
	.line	1213; ../../RF24Network_c.c	return result;
	MOVF	r0x02, W
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
S_RF24Network_c__RF24N_write_to_pipe	code
_RF24N_write_to_pipe:
	.line	1143; ../../RF24Network_c.c	uint8_t RF24N_write_to_pipe( uint16_t node, uint8_t pipe, uint8_t multicast )
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
	.line	1147; ../../RF24Network_c.c	RF24N_pipe_address( node, pipe, out_pipe);
	MOVLW	HIGH(_RF24N_write_to_pipe_out_pipe_1_285)
	MOVWF	r0x05
	MOVLW	LOW(_RF24N_write_to_pipe_out_pipe_1_285)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_pipe_address
	MOVLW	0x06
	ADDWF	FSR1L, F
	BANKSEL	(_rn + 43)
	.line	1153; ../../RF24Network_c.c	if(!(rn.networkFlags & FLAG_FAST_FRAG)){
	BTFSC	(_rn + 43), 2
	BRA	_00805_DS_
	.line	1154; ../../RF24Network_c.c	RF24_stopListening();
	CALL	_RF24_stopListening
_00805_DS_:
	.line	1157; ../../RF24Network_c.c	if(multicast){ RF24_setAutoAck_p(0,0);}else{RF24_setAutoAck_p(0,1);}
	MOVF	r0x03, W
	BZ	_00807_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setAutoAck_p
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00808_DS_
_00807_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setAutoAck_p
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00808_DS_:
	.line	1159; ../../RF24Network_c.c	RF24_openWritingPipe_d(out_pipe);
	MOVLW	HIGH(_RF24N_write_to_pipe_out_pipe_1_285)
	MOVWF	r0x01
	MOVLW	LOW(_RF24N_write_to_pipe_out_pipe_1_285)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_openWritingPipe_d
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	1161; ../../RF24Network_c.c	ok = RF24_writeFast_m(rn.frame_buffer, rn.frame_size,0);
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 51)
	MOVF	(_rn + 51), W, B
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
	BANKSEL	(_rn + 43)
	.line	1163; ../../RF24Network_c.c	if(!(rn.networkFlags & FLAG_FAST_FRAG)){
	BTFSC	(_rn + 43), 2
	BRA	_00810_DS_
	.line	1164; ../../RF24Network_c.c	ok = RF24_txStandBy_t(rn.txTimeout,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 4)
	MOVF	(_rn + 4), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 3)
	MOVF	(_rn + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 2)
	MOVF	(_rn + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 1)
	MOVF	(_rn + 1), W, B
	MOVWF	POSTDEC1
	CALL	_RF24_txStandBy_t
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	.line	1165; ../../RF24Network_c.c	RF24_setAutoAck_p(0,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setAutoAck_p
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00810_DS_:
	.line	1181; ../../RF24Network_c.c	return ok;
	MOVF	r0x00, W
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
S_RF24Network_c__RF24N_logicalToPhysicalAddress	code
_RF24N_logicalToPhysicalAddress:
	.line	1093; ../../RF24Network_c.c	uint8_t RF24N_logicalToPhysicalAddress( logicalToPhysicalStruct *conversionInfo){
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
	.line	1098; ../../RF24Network_c.c	uint16_t *to_node = &conversionInfo->send_node;
	MOVFF	r0x00, r0x03
	MOVFF	r0x01, r0x04
	MOVFF	r0x02, r0x05
	.line	1099; ../../RF24Network_c.c	uint8_t *directTo = &conversionInfo->send_pipe;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	.line	1100; ../../RF24Network_c.c	uint8_t *multicast = &conversionInfo->multicast;    
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	.line	1103; ../../RF24Network_c.c	uint16_t pre_conversion_send_node = rn.parent_node; 
	MOVFF	(_rn + 54), r0x0c
	MOVFF	(_rn + 55), r0x0d
	.line	1106; ../../RF24Network_c.c	uint8_t pre_conversion_send_pipe = rn.parent_pipe;
	MOVFF	(_rn + 56), r0x0e
	.line	1108; ../../RF24Network_c.c	if(*directTo > TX_ROUTED ){    
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget1
	MOVWF	r0x0f
	MOVLW	0x02
	SUBWF	r0x0f, W
	BNC	_00786_DS_
	.line	1109; ../../RF24Network_c.c	pre_conversion_send_node = *to_node;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	.line	1110; ../../RF24Network_c.c	*multicast = 1;
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
	.line	1112; ../../RF24Network_c.c	pre_conversion_send_pipe=0;
	CLRF	r0x0e
	BRA	_00787_DS_
_00786_DS_:
	.line	1117; ../../RF24Network_c.c	if ( RF24N_is_direct_child(*to_node) )
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_RF24N_is_direct_child
	MOVWF	r0x09
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x09, W
	BZ	_00783_DS_
	.line	1120; ../../RF24Network_c.c	pre_conversion_send_node = *to_node;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	.line	1122; ../../RF24Network_c.c	pre_conversion_send_pipe = 5;
	MOVLW	0x05
	MOVWF	r0x0e
	BRA	_00787_DS_
_00783_DS_:
	.line	1127; ../../RF24Network_c.c	else if ( RF24N_is_descendant(*to_node) )
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_RF24N_is_descendant
	MOVWF	r0x09
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x09, W
	BZ	_00787_DS_
	.line	1129; ../../RF24Network_c.c	pre_conversion_send_node = RF24N_direct_child_route_to(*to_node);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_direct_child_route_to
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	1130; ../../RF24Network_c.c	pre_conversion_send_pipe = 5;
	MOVLW	0x05
	MOVWF	r0x0e
_00787_DS_:
	.line	1133; ../../RF24Network_c.c	*to_node = pre_conversion_send_node;
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
	.line	1134; ../../RF24Network_c.c	*directTo = pre_conversion_send_pipe;
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
	.line	1136; ../../RF24Network_c.c	return 1;
	MOVLW	0x01
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
S_RF24Network_c__RF24N_write	code
_RF24N_write:
	.line	981; ../../RF24Network_c.c	uint8_t RF24N_write( uint16_t to_node, uint8_t directTo)  // Direct To: 0 = First Payload, standard routing, 1=routed payload, 2=directRoute to host, 3=directRoute to Route
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	984; ../../RF24Network_c.c	uint8_t isAckType = 0;
	CLRF	r0x03
	.line	988; ../../RF24Network_c.c	if(rn.frame_buffer[6] > 64 && rn.frame_buffer[6] < 192 ){ isAckType=1; }
	MOVFF	(_rn + 13), r0x04
	MOVLW	0x41
	SUBWF	r0x04, W
	BNC	_00686_DS_
	MOVLW	0xc0
	SUBWF	r0x04, W
	BC	_00686_DS_
	MOVLW	0x01
	MOVWF	r0x03
_00686_DS_:
	.line	995; ../../RF24Network_c.c	if ( !RF24N_is_valid_address(to_node) )
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_is_valid_address
	MOVWF	r0x04
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x04, W
	BNZ	_00689_DS_
	.line	996; ../../RF24Network_c.c	return 0;  
	CLRF	WREG
	BRA	_00710_DS_
_00689_DS_:
	.line	999; ../../RF24Network_c.c	conversion.send_node= to_node;
	MOVF	r0x00, W
	BANKSEL	_RF24N_write_conversion_1_270
	MOVWF	_RF24N_write_conversion_1_270, B
	MOVF	r0x01, W
	BANKSEL	(_RF24N_write_conversion_1_270 + 1)
	MOVWF	(_RF24N_write_conversion_1_270 + 1), B
	.line	1000; ../../RF24Network_c.c	conversion.send_pipe=directTo;
	MOVF	r0x02, W
	BANKSEL	(_RF24N_write_conversion_1_270 + 2)
	MOVWF	(_RF24N_write_conversion_1_270 + 2), B
	BANKSEL	(_RF24N_write_conversion_1_270 + 3)
	.line	1001; ../../RF24Network_c.c	conversion.multicast=0;
	CLRF	(_RF24N_write_conversion_1_270 + 3), B
	.line	1002; ../../RF24Network_c.c	RF24N_logicalToPhysicalAddress( &conversion);
	MOVLW	HIGH(_RF24N_write_conversion_1_270)
	MOVWF	r0x05
	MOVLW	LOW(_RF24N_write_conversion_1_270)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_RF24N_logicalToPhysicalAddress
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	(_RF24N_write_conversion_1_270 + 3)
	.line	1010; ../../RF24Network_c.c	ok=RF24N_write_to_pipe(conversion.send_node, conversion.send_pipe, conversion.multicast);  	
	MOVF	(_RF24N_write_conversion_1_270 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_RF24N_write_conversion_1_270 + 2)
	MOVF	(_RF24N_write_conversion_1_270 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_RF24N_write_conversion_1_270 + 1)
	MOVF	(_RF24N_write_conversion_1_270 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_RF24N_write_conversion_1_270
	MOVF	_RF24N_write_conversion_1_270, W, B
	MOVWF	POSTDEC1
	CALL	_RF24N_write_to_pipe
	MOVWF	r0x04
	MOVLW	0x04
	ADDWF	FSR1L, F
	.line	1022; ../../RF24Network_c.c	if( directTo == TX_ROUTED && ok && conversion.send_node == to_node && isAckType){
	MOVF	r0x02, W
	XORLW	0x01
	BZ	_00763_DS_
	BRA	_00691_DS_
_00763_DS_:
	MOVF	r0x04, W
	BTFSC	STATUS, 2
	BRA	_00691_DS_
	BANKSEL	_RF24N_write_conversion_1_270
	MOVF	_RF24N_write_conversion_1_270, W, B
	XORWF	r0x00, W
	BNZ	_00764_DS_
	BANKSEL	(_RF24N_write_conversion_1_270 + 1)
	MOVF	(_RF24N_write_conversion_1_270 + 1), W, B
	XORWF	r0x01, W
	BZ	_00765_DS_
_00764_DS_:
	BRA	_00691_DS_
_00765_DS_:
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00691_DS_
	.line	1024; ../../RF24Network_c.c	RF24NetworkHeader* header = (RF24NetworkHeader*)rn.frame_buffer;
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x05
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	.line	1025; ../../RF24Network_c.c	header->type = NETWORK_ACK;				    // Set the payload type to NETWORK_ACK			
	MOVF	r0x05, W
	ADDLW	0x06
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0a
	MOVLW	0xc1
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
	.line	1026; ../../RF24Network_c.c	header->to_node = header->from_node;          // Change the 'to' address to the 'from' address			
	MOVF	r0x05, W
	ADDLW	0x02
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0a
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, PRODH
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput2
	.line	1028; ../../RF24Network_c.c	conversion.send_node = header->from_node;
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget2
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVF	r0x05, W
	BANKSEL	_RF24N_write_conversion_1_270
	MOVWF	_RF24N_write_conversion_1_270, B
	MOVF	r0x06, W
	BANKSEL	(_RF24N_write_conversion_1_270 + 1)
	MOVWF	(_RF24N_write_conversion_1_270 + 1), B
	.line	1029; ../../RF24Network_c.c	conversion.send_pipe = TX_ROUTED;
	MOVLW	0x01
	BANKSEL	(_RF24N_write_conversion_1_270 + 2)
	MOVWF	(_RF24N_write_conversion_1_270 + 2), B
	BANKSEL	(_RF24N_write_conversion_1_270 + 3)
	.line	1030; ../../RF24Network_c.c	conversion.multicast = 0;
	CLRF	(_RF24N_write_conversion_1_270 + 3), B
	.line	1031; ../../RF24Network_c.c	RF24N_logicalToPhysicalAddress(&conversion);
	MOVLW	HIGH(_RF24N_write_conversion_1_270)
	MOVWF	r0x06
	MOVLW	LOW(_RF24N_write_conversion_1_270)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_RF24N_logicalToPhysicalAddress
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	1034; ../../RF24Network_c.c	rn.frame_size = sizeof(RF24NetworkHeader);
	MOVLW	0x08
	BANKSEL	(_rn + 51)
	MOVWF	(_rn + 51), B
	BANKSEL	(_RF24N_write_conversion_1_270 + 3)
	.line	1035; ../../RF24Network_c.c	RF24N_write_to_pipe(conversion.send_node, conversion.send_pipe, conversion.multicast);
	MOVF	(_RF24N_write_conversion_1_270 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_RF24N_write_conversion_1_270 + 2)
	MOVF	(_RF24N_write_conversion_1_270 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_RF24N_write_conversion_1_270 + 1)
	MOVF	(_RF24N_write_conversion_1_270 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_RF24N_write_conversion_1_270
	MOVF	_RF24N_write_conversion_1_270, W, B
	MOVWF	POSTDEC1
	CALL	_RF24N_write_to_pipe
	MOVLW	0x04
	ADDWF	FSR1L, F
_00691_DS_:
	.line	1047; ../../RF24Network_c.c	if( ok && conversion.send_node != to_node && (directTo==0 || directTo==3) && isAckType){
	MOVF	r0x04, W
	BTFSC	STATUS, 2
	BRA	_00703_DS_
	BANKSEL	_RF24N_write_conversion_1_270
	MOVF	_RF24N_write_conversion_1_270, W, B
	XORWF	r0x00, W
	BNZ	_00767_DS_
	BANKSEL	(_RF24N_write_conversion_1_270 + 1)
	MOVF	(_RF24N_write_conversion_1_270 + 1), W, B
	XORWF	r0x01, W
	BNZ	_00767_DS_
	BRA	_00703_DS_
_00767_DS_:
	MOVF	r0x02, W
	BZ	_00707_DS_
	MOVF	r0x02, W
	XORLW	0x03
	BZ	_00707_DS_
	BRA	_00703_DS_
_00707_DS_:
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00703_DS_
	BANKSEL	(_rn + 43)
	.line	1050; ../../RF24Network_c.c	if(rn.networkFlags & FLAG_FAST_FRAG){
	BTFSS	(_rn + 43), 2
	BRA	_00696_DS_
	.line	1051; ../../RF24Network_c.c	RF24_txStandBy_t(rn.txTimeout,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 4)
	MOVF	(_rn + 4), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 3)
	MOVF	(_rn + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 2)
	MOVF	(_rn + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 1)
	MOVF	(_rn + 1), W, B
	MOVWF	POSTDEC1
	CALL	_RF24_txStandBy_t
	MOVLW	0x05
	ADDWF	FSR1L, F
	.line	1052; ../../RF24Network_c.c	rn.networkFlags &= ~FLAG_FAST_FRAG;
	MOVLW	0xfb
	BANKSEL	(_rn + 43)
	ANDWF	(_rn + 43), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	.line	1053; ../../RF24Network_c.c	RF24_setAutoAck_p(0,0); 
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setAutoAck_p
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00696_DS_:
	.line	1055; ../../RF24Network_c.c	RF24_startListening();
	CALL	_RF24_startListening
	.line	1057; ../../RF24Network_c.c	reply_time = millis(); 
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
_00699_DS_:
	.line	1059; ../../RF24Network_c.c	while( RF24N_update() != NETWORK_ACK){
	CALL	_RF24N_update
	MOVWF	r0x05
	MOVF	r0x05, W
	XORLW	0xc1
	BZ	_00703_DS_
	.line	1063; ../../RF24Network_c.c	if(millis() - reply_time > rn.routeTimeout){
	CALL	_millis
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVFF	FSR0L, r0x08
	MOVF	r0x00, W
	SUBWF	r0x05, F
	MOVF	r0x01, W
	SUBWFB	r0x06, F
	MOVF	r0x02, W
	SUBWFB	r0x07, F
	MOVF	r0x03, W
	SUBWFB	r0x08, F
	MOVFF	(_rn + 5), r0x09
	MOVFF	(_rn + 6), r0x0a
	CLRF	r0x0b
	CLRF	r0x0c
	MOVF	r0x08, W
	SUBWF	r0x0c, W
	BNZ	_00774_DS_
	MOVF	r0x07, W
	SUBWF	r0x0b, W
	BNZ	_00774_DS_
	MOVF	r0x06, W
	SUBWF	r0x0a, W
	BNZ	_00774_DS_
	MOVF	r0x05, W
	SUBWF	r0x09, W
_00774_DS_:
	BC	_00699_DS_
	.line	1069; ../../RF24Network_c.c	ok=0;
	CLRF	r0x04
_00703_DS_:
	BANKSEL	(_rn + 43)
	.line	1074; ../../RF24Network_c.c	if( !(rn.networkFlags & FLAG_FAST_FRAG) ){
	BTFSC	(_rn + 43), 2
	BRA	_00709_DS_
	.line	1077; ../../RF24Network_c.c	RF24_startListening();
	CALL	_RF24_startListening
_00709_DS_:
	.line	1087; ../../RF24Network_c.c	return ok;
	MOVF	r0x04, W
_00710_DS_:
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
S_RF24Network_c__RF24N__write	code
_RF24N__write:
	.line	925; ../../RF24Network_c.c	uint8_t RF24N__write(RF24NetworkHeader * header,const void* message, uint16_t len, uint16_t writeDirect)
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
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	.line	928; ../../RF24Network_c.c	header->from_node = rn.node_address;
	MOVFF	(_rn + 49), r0x0a
	MOVFF	(_rn + 50), r0x0b
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
	.line	931; ../../RF24Network_c.c	memcpy(rn.frame_buffer,header,sizeof(RF24NetworkHeader));
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x0b
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
	MOVF	r0x02, W
	MOVWF	r0x0f
	MOVF	r0x01, W
	MOVWF	r0x0e
	MOVF	r0x00, W
	MOVWF	r0x0d
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	938; ../../RF24Network_c.c	if (len){
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00654_DS_
	.line	945; ../../RF24Network_c.c	memcpy(rn.frame_buffer + sizeof(RF24NetworkHeader),message,len);
	MOVLW	HIGH(_rn + 15)
	MOVWF	r0x0b
	MOVLW	LOW(_rn + 15)
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
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
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
_00654_DS_:
	.line	964; ../../RF24Network_c.c	if(writeDirect != 070){		
	MOVF	r0x08, W
	XORLW	0x38
	BNZ	_00676_DS_
	MOVF	r0x09, W
	BZ	_00660_DS_
_00676_DS_:
	.line	965; ../../RF24Network_c.c	uint8_t sendType = USER_TX_TO_LOGICAL_ADDRESS; // Payload is multicast to the first node, and routed normally to the next
	MOVLW	0x03
	MOVWF	r0x03
	.line	967; ../../RF24Network_c.c	if(header->to_node == 0100){
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVF	r0x04, W
	XORLW	0x40
	BNZ	_00677_DS_
	MOVF	r0x05, W
	BZ	_00678_DS_
_00677_DS_:
	BRA	_00656_DS_
_00678_DS_:
	.line	968; ../../RF24Network_c.c	sendType = USER_TX_MULTICAST;
	MOVLW	0x04
	MOVWF	r0x03
_00656_DS_:
	.line	970; ../../RF24Network_c.c	if(header->to_node == writeDirect){
	MOVF	r0x04, W
	XORWF	r0x08, W
	BNZ	_00679_DS_
	MOVF	r0x05, W
	XORWF	r0x09, W
	BZ	_00680_DS_
_00679_DS_:
	BRA	_00658_DS_
_00680_DS_:
	.line	971; ../../RF24Network_c.c	sendType = USER_TX_TO_PHYSICAL_ADDRESS; // Payload is multicast to the first node, which is the recipient
	MOVLW	0x02
	MOVWF	r0x03
_00658_DS_:
	.line	973; ../../RF24Network_c.c	return RF24N_write(writeDirect,sendType);				
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVWF	r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BRA	_00661_DS_
_00660_DS_:
	.line	975; ../../RF24Network_c.c	return RF24N_write(header->to_node,TX_NORMAL);
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVWF	r0x00
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
_00661_DS_:
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
S_RF24Network_c__RF24N_write_	code
_RF24N_write_:
	.line	795; ../../RF24Network_c.c	uint8_t RF24N_write_( RF24NetworkHeader* header,const void* message, uint16_t len, uint16_t writeDirect){
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
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x17, POSTDEC1
	MOVFF	r0x18, POSTDEC1
	MOVFF	r0x19, POSTDEC1
	MOVFF	r0x1a, POSTDEC1
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
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
_00547_DS_:
	.line	803; ../../RF24Network_c.c	while(millis()-rn.txTime < 25){ if(RF24N_update() > 127){break;} }
	CALL	_millis
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	BANKSEL	(_rn + 44)
	MOVF	(_rn + 44), W, B
	SUBWF	r0x0a, F
	BANKSEL	(_rn + 45)
	MOVF	(_rn + 45), W, B
	SUBWFB	r0x0b, F
	BANKSEL	(_rn + 46)
	MOVF	(_rn + 46), W, B
	SUBWFB	r0x0c, F
	BANKSEL	(_rn + 47)
	MOVF	(_rn + 47), W, B
	SUBWFB	r0x0d, F
	MOVLW	0x00
	SUBWF	r0x0d, W
	BNZ	_00637_DS_
	MOVLW	0x00
	SUBWF	r0x0c, W
	BNZ	_00637_DS_
	MOVLW	0x00
	SUBWF	r0x0b, W
	BNZ	_00637_DS_
	MOVLW	0x19
	SUBWF	r0x0a, W
_00637_DS_:
	BC	_00549_DS_
	CALL	_RF24N_update
	MOVWF	r0x0a
	MOVLW	0x80
	SUBWF	r0x0a, W
	BNC	_00547_DS_
_00549_DS_:
	.line	804; ../../RF24Network_c.c	delayMicroseconds(200);
	MOVLW	0xc8
	MOVWF	POSTDEC1
	CALL	_delayMicroseconds
	MOVF	POSTINC1, F
	.line	812; ../../RF24Network_c.c	if(len <= rn.max_frame_payload_size){
	MOVFF	(_rn + 52), r0x0a
	MOVFF	(_rn + 53), r0x0b
	MOVF	r0x07, W
	SUBWF	r0x0b, W
	BNZ	_00639_DS_
	MOVF	r0x06, W
	SUBWF	r0x0a, W
_00639_DS_:
	BTFSS	STATUS, 0
	BRA	_00553_DS_
	.line	814; ../../RF24Network_c.c	rn.frame_size = len + sizeof(RF24NetworkHeader);
	MOVF	r0x06, W
	MOVWF	r0x0c
	MOVLW	0x08
	ADDWF	r0x0c, F
	MOVF	r0x0c, W
	BANKSEL	(_rn + 51)
	MOVWF	(_rn + 51), B
	.line	815; ../../RF24Network_c.c	if(RF24N__write(header,message,len,writeDirect)){
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
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N__write
	MOVWF	r0x0c
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x0c, W
	BZ	_00551_DS_
	.line	816; ../../RF24Network_c.c	return 1;
	MOVLW	0x01
	BRA	_00579_DS_
_00551_DS_:
	.line	818; ../../RF24Network_c.c	rn.txTime = millis();
	CALL	_millis
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVFF	PRODH, r0x0e
	MOVFF	FSR0L, r0x0f
	MOVF	r0x0c, W
	BANKSEL	(_rn + 44)
	MOVWF	(_rn + 44), B
	MOVF	r0x0d, W
	BANKSEL	(_rn + 45)
	MOVWF	(_rn + 45), B
	MOVF	r0x0e, W
	BANKSEL	(_rn + 46)
	MOVWF	(_rn + 46), B
	MOVF	r0x0f, W
	BANKSEL	(_rn + 47)
	MOVWF	(_rn + 47), B
	.line	819; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	BRA	_00579_DS_
_00553_DS_:
	.line	822; ../../RF24Network_c.c	if (len > MAX_PAYLOAD_SIZE) {
	MOVLW	0x00
	SUBWF	r0x07, W
	BNZ	_00640_DS_
	MOVLW	0x91
	SUBWF	r0x06, W
_00640_DS_:
	BNC	_00555_DS_
	.line	824; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	BRA	_00579_DS_
_00555_DS_:
	.line	828; ../../RF24Network_c.c	fragment_id = (len % rn.max_frame_payload_size != 0) + ((len ) / rn.max_frame_payload_size);  //the number of fragments to send = ceil(len/max_frame_payload_size)
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	__moduint
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0c, W
	IORWF	r0x0d, W
	BZ	_00581_DS_
	MOVLW	0x01
	MOVWF	r0x0c
	BRA	_00582_DS_
_00581_DS_:
	CLRF	r0x0c
_00582_DS_:
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	.line	834; ../../RF24Network_c.c	if(header->to_node != 0100){
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVF	r0x0b, W
	XORLW	0x40
	BNZ	_00642_DS_
	MOVF	r0x0c, W
	BZ	_00557_DS_
_00642_DS_:
	.line	835; ../../RF24Network_c.c	rn.networkFlags |= FLAG_FAST_FRAG;
	MOVLW	0x04
	BANKSEL	(_rn + 43)
	IORWF	(_rn + 43), W, B
	MOVWF	r0x0b
	MOVF	r0x0b, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	.line	837; ../../RF24Network_c.c	RF24_stopListening();
	CALL	_RF24_stopListening
_00557_DS_:
	.line	841; ../../RF24Network_c.c	retriesPerFrag = 0;
	CLRF	r0x0b
	.line	842; ../../RF24Network_c.c	type = header->type;
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0e
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget1
	MOVWF	r0x0f
	.line	843; ../../RF24Network_c.c	ok = 0;
	CLRF	r0x10
	.line	845; ../../RF24Network_c.c	while (fragment_id > 0) {
	MOVFF	r0x0a, r0x11
	CLRF	r0x12
_00570_DS_:
	MOVF	r0x11, W
	BTFSC	STATUS, 2
	BRA	_00602_DS_
	.line	851; ../../RF24Network_c.c	header->reserved = fragment_id;
	MOVF	r0x00, W
	ADDLW	0x07
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x15
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrput1
	.line	853; ../../RF24Network_c.c	if (fragment_id == 1) {
	MOVF	r0x11, W
	XORLW	0x01
	BNZ	_00562_DS_
	.line	854; ../../RF24Network_c.c	header->type = NETWORK_LAST_FRAGMENT;  //Set the last fragment flag to indicate the last fragment
	MOVLW	0x96
	MOVWF	POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
	.line	855; ../../RF24Network_c.c	header->reserved = type; //The reserved field is used to transmit the header type
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrput1
	BRA	_00563_DS_
_00562_DS_:
	.line	857; ../../RF24Network_c.c	if (msgCount == 0) {
	MOVF	r0x12, W
	BNZ	_00559_DS_
	.line	858; ../../RF24Network_c.c	header->type = NETWORK_FIRST_FRAGMENT;
	MOVLW	0x94
	MOVWF	POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
	BRA	_00563_DS_
_00559_DS_:
	.line	860; ../../RF24Network_c.c	header->type = NETWORK_MORE_FRAGMENTS; //Set the more fragments flag to indicate a fragmented frame
	MOVLW	0x95
	MOVWF	POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
_00563_DS_:
	.line	864; ../../RF24Network_c.c	offset = msgCount*rn.max_frame_payload_size;
	MOVFF	(_rn + 52), r0x13
	MOVFF	(_rn + 53), r0x14
	MOVFF	r0x12, r0x15
	CLRF	r0x16
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x15
	MOVFF	PRODL, r0x16
	MOVLW	0x04
	ADDWF	FSR1L, F
	.line	865; ../../RF24Network_c.c	fragmentLen = rf24_min((uint16_t)(len-offset),rn.max_frame_payload_size);
	MOVF	r0x15, W
	SUBWF	r0x06, W
	MOVWF	r0x17
	MOVF	r0x16, W
	SUBWFB	r0x07, W
	MOVWF	r0x18
	MOVF	r0x14, W
	SUBWF	r0x18, W
	BNZ	_00646_DS_
	MOVF	r0x13, W
	SUBWF	r0x17, W
_00646_DS_:
	BNC	_00584_DS_
	MOVFF	r0x13, r0x17
	MOVFF	r0x14, r0x18
_00584_DS_:
	.line	868; ../../RF24Network_c.c	rn.frame_size = sizeof(RF24NetworkHeader)+fragmentLen;
	MOVF	r0x17, W
	MOVWF	r0x13
	MOVLW	0x08
	ADDWF	r0x13, F
	MOVF	r0x13, W
	BANKSEL	(_rn + 51)
	MOVWF	(_rn + 51), B
	.line	869; ../../RF24Network_c.c	ok = RF24N__write(header,((char *)message)+offset,fragmentLen,writeDirect);
	MOVF	r0x05, W
	MOVWF	r0x19
	MOVF	r0x04, W
	MOVWF	r0x14
	MOVF	r0x03, W
	MOVWF	r0x13
	CLRF	r0x1a
	MOVF	r0x13, W
	ADDWF	r0x15, F
	MOVF	r0x14, W
	ADDWFC	r0x16, F
	MOVF	r0x19, W
	ADDWFC	r0x1a, F
	MOVF	r0x1a, W
	MOVWF	r0x1a
	MOVF	r0x16, W
	MOVWF	r0x16
	MOVF	r0x15, W
	MOVWF	r0x15
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x18, W
	MOVWF	POSTDEC1
	MOVF	r0x17, W
	MOVWF	POSTDEC1
	MOVF	r0x1a, W
	MOVWF	POSTDEC1
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N__write
	MOVWF	r0x10
	MOVLW	0x0a
	ADDWF	FSR1L, F
	.line	871; ../../RF24Network_c.c	if (!ok) {
	MOVF	r0x10, W
	BNZ	_00565_DS_
	.line	872; ../../RF24Network_c.c	delay(2);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	873; ../../RF24Network_c.c	++retriesPerFrag;
	INCF	r0x0b, F
	BRA	_00566_DS_
_00565_DS_:
	.line	876; ../../RF24Network_c.c	retriesPerFrag = 0;
	CLRF	r0x0b
	.line	877; ../../RF24Network_c.c	fragment_id--;
	DECF	r0x11, F
	.line	878; ../../RF24Network_c.c	msgCount++;
	INCF	r0x12, F
_00566_DS_:
	.line	883; ../../RF24Network_c.c	if (!ok && retriesPerFrag >= 3) {
	MOVF	r0x10, W
	BTFSS	STATUS, 2
	BRA	_00570_DS_
	MOVLW	0x03
	SUBWF	r0x0b, W
	BTFSS	STATUS, 0
	BRA	_00570_DS_
_00602_DS_:
	.line	885; ../../RF24Network_c.c	break;
	MOVFF	r0x11, r0x0a
	.line	896; ../../RF24Network_c.c	header->type = type;
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
	BANKSEL	(_rn + 43)
	.line	898; ../../RF24Network_c.c	if(rn.networkFlags & FLAG_FAST_FRAG){	
	BTFSS	(_rn + 43), 2
	BRA	_00574_DS_
	.line	899; ../../RF24Network_c.c	ok = RF24_txStandBy_t(rn.txTimeout,0);  
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 4)
	MOVF	(_rn + 4), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 3)
	MOVF	(_rn + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 2)
	MOVF	(_rn + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 1)
	MOVF	(_rn + 1), W, B
	MOVWF	POSTDEC1
	CALL	_RF24_txStandBy_t
	MOVWF	r0x10
	MOVLW	0x05
	ADDWF	FSR1L, F
	.line	900; ../../RF24Network_c.c	RF24_startListening();
	CALL	_RF24_startListening
	.line	901; ../../RF24Network_c.c	RF24_setAutoAck_p(0,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setAutoAck_p
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00574_DS_:
	.line	903; ../../RF24Network_c.c	rn.networkFlags &= ~FLAG_FAST_FRAG;
	MOVLW	0xfb
	BANKSEL	(_rn + 43)
	ANDWF	(_rn + 43), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	.line	905; ../../RF24Network_c.c	if(!ok){
	MOVF	r0x10, W
	BNZ	_00576_DS_
	.line	906; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	BRA	_00579_DS_
_00576_DS_:
	.line	915; ../../RF24Network_c.c	if(fragment_id > 0){
	MOVF	r0x0a, W
	BZ	_00578_DS_
	.line	916; ../../RF24Network_c.c	rn.txTime = millis();
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVF	r0x00, W
	BANKSEL	(_rn + 44)
	MOVWF	(_rn + 44), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 45)
	MOVWF	(_rn + 45), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 46)
	MOVWF	(_rn + 46), B
	MOVF	r0x03, W
	BANKSEL	(_rn + 47)
	MOVWF	(_rn + 47), B
	.line	917; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	BRA	_00579_DS_
_00578_DS_:
	.line	919; ../../RF24Network_c.c	return 1;
	MOVLW	0x01
_00579_DS_:
	MOVFF	PREINC1, r0x1a
	MOVFF	PREINC1, r0x19
	MOVFF	PREINC1, r0x18
	MOVFF	PREINC1, r0x17
	MOVFF	PREINC1, r0x16
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
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
S_RF24Network_c__RF24N_write_m	code
_RF24N_write_m:
	.line	791; ../../RF24Network_c.c	uint8_t RF24N_write_m(RF24NetworkHeader* header,const void* message, uint16_t len){    
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	.line	792; ../../RF24Network_c.c	return RF24N_write_(header,message,len,070);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x38
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_
	MOVWF	r0x00
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x00, W
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
S_RF24Network_c__RF24N_multicast	code
_RF24N_multicast:
	.line	782; ../../RF24Network_c.c	uint8_t RF24N_multicast(RF24NetworkHeader* header,const void* message, uint16_t len, uint8_t level){
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
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	.line	784; ../../RF24Network_c.c	header->to_node = 0100;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput2
	.line	785; ../../RF24Network_c.c	header->from_node = rn.node_address;
	MOVFF	(_rn + 49), r0x09
	MOVFF	(_rn + 50), r0x0a
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
	.line	786; ../../RF24Network_c.c	return RF24N_write_(header, message, len, RF24N_levelToAddress(level));
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_RF24N_levelToAddress
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVF	POSTINC1, F
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
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_
	MOVWF	r0x00
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x00, W
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
S_RF24Network_c__RF24N_read	code
_RF24N_read:
	.line	726; ../../RF24Network_c.c	uint16_t RF24N_read( RF24NetworkHeader* header,void* message, uint16_t maxlen)
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
	BANKSEL	_RF24N_read_bufsize_1_236
	.line	728; ../../RF24Network_c.c	uint16_t bufsize = 0;
	CLRF	_RF24N_read_bufsize_1_236, B
	BANKSEL	(_RF24N_read_bufsize_1_236 + 1)
	CLRF	(_RF24N_read_bufsize_1_236 + 1), B
	.line	747; ../../RF24Network_c.c	if ( RF24N_available() )
	CALL	_RF24N_available
	MOVWF	r0x08
	MOVF	r0x08, W
	BTFSC	STATUS, 2
	BRA	_00513_DS_
	.line	751; ../../RF24Network_c.c	memcpy(header,rn.frame_queue,8);
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	HIGH(_rn + 59)
	MOVWF	r0x09
	MOVLW	LOW(_rn + 59)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	752; ../../RF24Network_c.c	memcpy(&bufsize,rn.frame_queue+8,2);
	MOVLW	HIGH(_RF24N_read_bufsize_1_236)
	MOVWF	r0x01
	MOVLW	LOW(_RF24N_read_bufsize_1_236)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_rn + 67)
	MOVWF	r0x09
	MOVLW	LOW(_rn + 67)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	754; ../../RF24Network_c.c	if (maxlen > 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00509_DS_
	BANKSEL	(_RF24N_read_bufsize_1_236 + 1)
	.line	756; ../../RF24Network_c.c	maxlen = rf24_min(maxlen,bufsize);
	MOVF	(_RF24N_read_bufsize_1_236 + 1), W, B
	SUBWF	r0x07, W
	BNZ	_00530_DS_
	BANKSEL	_RF24N_read_bufsize_1_236
	MOVF	_RF24N_read_bufsize_1_236, W, B
	SUBWF	r0x06, W
_00530_DS_:
	BC	_00516_DS_
	MOVFF	r0x06, r0x00
	MOVFF	r0x07, r0x01
	BRA	_00517_DS_
_00516_DS_:
	MOVFF	_RF24N_read_bufsize_1_236, r0x00
	MOVFF	(_RF24N_read_bufsize_1_236 + 1), r0x01
_00517_DS_:
	MOVFF	r0x00, r0x06
	MOVFF	r0x01, r0x07
	.line	757; ../../RF24Network_c.c	memcpy(message,rn.frame_queue+10,maxlen);
	MOVLW	HIGH(_rn + 69)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 69)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
_00509_DS_:
	BANKSEL	_RF24N_read_bufsize_1_236
	.line	764; ../../RF24Network_c.c	rn.next_frame-=bufsize+10;
	MOVF	_RF24N_read_bufsize_1_236, W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_RF24N_read_bufsize_1_236 + 1)
	ADDWFC	(_RF24N_read_bufsize_1_236 + 1), W, B
	MOVWF	r0x01
	CLRF	r0x02
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	SUBWF	(_rn + 213), W, B
	MOVWF	r0x00
	MOVF	r0x01, W
	BANKSEL	(_rn + 214)
	SUBWFB	(_rn + 214), W, B
	MOVWF	r0x01
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	SUBWFB	(_rn + 215), W, B
	MOVWF	r0x02
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
	BANKSEL	_RF24N_read_bufsize_1_236
	.line	767; ../../RF24Network_c.c	if( (padding = (bufsize+10)%4) ){
	MOVF	_RF24N_read_bufsize_1_236, W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_RF24N_read_bufsize_1_236 + 1)
	ADDWFC	(_RF24N_read_bufsize_1_236 + 1), W, B
	MOVWF	r0x01
	MOVLW	0x03
	ANDWF	r0x00, F
	CLRF	r0x01
	MOVFF	r0x00, r0x01
	MOVF	r0x00, W
	BZ	_00511_DS_
	.line	768; ../../RF24Network_c.c	padding = 4-padding;
	MOVF	r0x01, W
	SUBLW	0x04
	MOVWF	r0x01
	.line	769; ../../RF24Network_c.c	rn.next_frame -= padding;
	MOVFF	r0x01, r0x00
	CLRF	r0x02
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	SUBWF	(_rn + 213), W, B
	MOVWF	r0x00
	MOVF	r0x02, W
	BANKSEL	(_rn + 214)
	SUBWFB	(_rn + 214), W, B
	MOVWF	r0x02
	MOVF	r0x03, W
	BANKSEL	(_rn + 215)
	SUBWFB	(_rn + 215), W, B
	MOVWF	r0x03
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x03, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
_00511_DS_:
	.line	772; ../../RF24Network_c.c	memmove(rn.frame_queue,rn.frame_queue+bufsize+10+padding,sizeof(rn.frame_queue)- bufsize);
	MOVLW	HIGH(_rn + 59)
	MOVWF	r0x02
	MOVLW	LOW(_rn + 59)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	LOW(_rn + 59)
	BANKSEL	_RF24N_read_bufsize_1_236
	ADDWF	_RF24N_read_bufsize_1_236, W, B
	MOVWF	r0x04
	MOVLW	HIGH(_rn + 59)
	BANKSEL	(_RF24N_read_bufsize_1_236 + 1)
	ADDWFC	(_RF24N_read_bufsize_1_236 + 1), W, B
	MOVWF	r0x05
	MOVLW	0x0a
	ADDWF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	CLRF	r0x06
	MOVF	r0x04, W
	ADDWF	r0x01, F
	MOVF	r0x05, W
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x04
	BANKSEL	_RF24N_read_bufsize_1_236
	MOVF	_RF24N_read_bufsize_1_236, W, B
	SUBLW	0x9a
	MOVWF	r0x05
	MOVLW	0x00
	BANKSEL	(_RF24N_read_bufsize_1_236 + 1)
	SUBFWB	(_RF24N_read_bufsize_1_236 + 1), W, B
	MOVWF	r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memmove
	MOVLW	0x08
	ADDWF	FSR1L, F
_00513_DS_:
	.line	776; ../../RF24Network_c.c	return bufsize;
	MOVFF	(_RF24N_read_bufsize_1_236 + 1), PRODL
	BANKSEL	_RF24N_read_bufsize_1_236
	MOVF	_RF24N_read_bufsize_1_236, W, B
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
S_RF24Network_c__RF24N_peek	code
_RF24N_peek:
	.line	705; ../../RF24Network_c.c	uint16_t RF24N_peek( RF24NetworkHeader* header)
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
	.line	707; ../../RF24Network_c.c	if ( RF24N_available() )
	CALL	_RF24N_available
	MOVWF	r0x03
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00502_DS_
	.line	715; ../../RF24Network_c.c	RF24NetworkFrame *frame = (RF24NetworkFrame*)(rn.frame_queue);
	MOVLW	LOW(_rn + 59)
	MOVWF	r0x03
	MOVLW	HIGH(_rn + 59)
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	.line	716; ../../RF24Network_c.c	memcpy(header,&frame->header,sizeof(RF24NetworkHeader));
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x03
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
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	717; ../../RF24Network_c.c	memcpy(&msg_size,rn.frame_queue+8,2);
	MOVLW	HIGH(_RF24N_peek_msg_size_2_234)
	MOVWF	r0x01
	MOVLW	LOW(_RF24N_peek_msg_size_2_234)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_rn + 67)
	MOVWF	r0x04
	MOVLW	LOW(_rn + 67)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
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
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	718; ../../RF24Network_c.c	return msg_size;
	MOVFF	(_RF24N_peek_msg_size_2_234 + 1), PRODL
	BANKSEL	_RF24N_peek_msg_size_2_234
	MOVF	_RF24N_peek_msg_size_2_234, W, B
	BRA	_00503_DS_
_00502_DS_:
	.line	721; ../../RF24Network_c.c	return 0;
	CLRF	PRODL
	CLRF	WREG
_00503_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_parent	code
_RF24N_parent:
	.line	691; ../../RF24Network_c.c	uint16_t RF24N_parent(void) 
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_rn + 49)
	.line	693; ../../RF24Network_c.c	if ( rn.node_address == 0 )
	MOVF	(_rn + 49), W, B
	BANKSEL	(_rn + 50)
	IORWF	(_rn + 50), W, B
	BNZ	_00494_DS_
	.line	694; ../../RF24Network_c.c	return -1;
	SETF	PRODL
	SETF	WREG
	BRA	_00496_DS_
_00494_DS_:
	.line	696; ../../RF24Network_c.c	return rn.parent_node;
	MOVFF	(_rn + 55), PRODL
	BANKSEL	(_rn + 54)
	MOVF	(_rn + 54), W, B
_00496_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_available	code
_RF24N_available:
	.line	679; ../../RF24Network_c.c	uint8_t RF24N_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	685; ../../RF24Network_c.c	return (rn.next_frame > rn.frame_queue);
	MOVLW	HIGH(_rn + 59)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 59)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_rn + 215)
	MOVF	(_rn + 215), W, B
	SUBWF	r0x02, W
	BNZ	_00488_DS_
	BANKSEL	(_rn + 214)
	MOVF	(_rn + 214), W, B
	SUBWF	r0x01, W
	BNZ	_00488_DS_
	BANKSEL	(_rn + 213)
	MOVF	(_rn + 213), W, B
	SUBWF	r0x00, W
_00488_DS_:
	BTG	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_enqueue	code
_RF24N_enqueue:
	.line	527; ../../RF24Network_c.c	uint8_t RF24N_enqueue( RF24NetworkHeader* header)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	530; ../../RF24Network_c.c	uint16_t message_size = rn.frame_size - sizeof(RF24NetworkHeader);
	MOVFF	(_rn + 51), r0x03
	CLRF	r0x04
	MOVLW	0xf8
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x03, _RF24N_enqueue_message_size_1_210
	MOVFF	r0x04, (_RF24N_enqueue_message_size_1_210 + 1)
	.line	537; ../../RF24Network_c.c	isFragment = header->type == NETWORK_FIRST_FRAGMENT || header->type == NETWORK_MORE_FRAGMENTS || header->type == NETWORK_LAST_FRAGMENT || header->type == NETWORK_MORE_FRAGMENTS_NACK ;
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVF	r0x08, W
	XORLW	0x94
	BZ	_00370_DS_
	MOVF	r0x08, W
	XORLW	0x95
	BZ	_00370_DS_
	MOVF	r0x08, W
	XORLW	0x96
	BZ	_00370_DS_
	MOVF	r0x08, W
	XORLW	0xc8
	BZ	_00370_DS_
	GOTO	_00360_DS_
_00370_DS_:
	.line	541; ../../RF24Network_c.c	if(header->type == NETWORK_FIRST_FRAGMENT){
	MOVF	r0x08, W
	XORLW	0x94
	BZ	_00450_DS_
	BRA	_00355_DS_
_00450_DS_:
	.line	543; ../../RF24Network_c.c	if(header->reserved > (MAX_PAYLOAD_SIZE / rn.max_frame_payload_size) ){
	MOVF	r0x00, W
	ADDLW	0x07
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget1
	MOVWF	r0x09
	BANKSEL	(_rn + 53)
	MOVF	(_rn + 53), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 52)
	MOVF	(_rn + 52), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0a, W
	SUBLW	0x9a
	MOVWF	r0x0a
	MOVLW	0x00
	SUBFWB	r0x0b, F
	MOVFF	r0x09, r0x0c
	CLRF	r0x0d
	MOVF	r0x0d, W
	SUBWF	r0x0b, W
	BNZ	_00451_DS_
	MOVF	r0x0c, W
	SUBWF	r0x0a, W
_00451_DS_:
	BC	_00330_DS_
	BANKSEL	(_rn + 223)
	.line	548; ../../RF24Network_c.c	rn.frag_queue.header.reserved = 0;
	CLRF	(_rn + 223), B
	.line	549; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	GOTO	_00367_DS_
_00330_DS_:
	.line	551; ../../RF24Network_c.c	if(rn.frag_queue.header.id == header->id && rn.frag_queue.header.from_node == header->from_node){
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0c
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	BANKSEL	(_rn + 220)
	MOVF	(_rn + 220), W, B
	XORWF	r0x0a, W
	BNZ	_00452_DS_
	BANKSEL	(_rn + 221)
	MOVF	(_rn + 221), W, B
	XORWF	r0x0b, W
	BZ	_00453_DS_
_00452_DS_:
	BRA	_00331_DS_
_00453_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	BANKSEL	(_rn + 216)
	MOVF	(_rn + 216), W, B
	XORWF	r0x0a, W
	BNZ	_00454_DS_
	BANKSEL	(_rn + 217)
	MOVF	(_rn + 217), W, B
	XORWF	r0x0b, W
	BZ	_00455_DS_
_00454_DS_:
	BRA	_00331_DS_
_00455_DS_:
	.line	552; ../../RF24Network_c.c	return 1;
	MOVLW	0x01
	GOTO	_00367_DS_
; ;multiply lit val:0x18 by variable r0x09 and store in r0x09
_00331_DS_:
	.line	555; ../../RF24Network_c.c	if( (header->reserved * 24) > (MAX_PAYLOAD_SIZE - (rn.next_frame-rn.frame_queue)) ){
	MOVF	r0x09, W
	MULLW	0x18
	MOVF	PRODH, W
	MOVWF	r0x0a
	MOVFF	PRODL, r0x09
	MOVLW	LOW(_rn + 59)
	BANKSEL	(_rn + 213)
	SUBWF	(_rn + 213), W, B
	MOVWF	r0x0b
	MOVLW	HIGH(_rn + 59)
	BANKSEL	(_rn + 214)
	SUBWFB	(_rn + 214), W, B
	MOVWF	r0x0c
	MOVF	r0x0b, W
	SUBLW	0x90
	MOVWF	r0x0b
	MOVLW	0x00
	SUBFWB	r0x0c, F
	MOVF	r0x0c, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x0a, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00456_DS_
	MOVF	r0x09, W
	SUBWF	r0x0b, W
_00456_DS_:
	BC	_00333_DS_
	.line	556; ../../RF24Network_c.c	rn.networkFlags |= FLAG_HOLD_INCOMING;
	MOVLW	0x01
	BANKSEL	(_rn + 43)
	IORWF	(_rn + 43), W, B
	MOVWF	r0x09
	MOVF	r0x09, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	.line	557; ../../RF24Network_c.c	RF24_stopListening();
	CALL	_RF24_stopListening
_00333_DS_:
	.line	560; ../../RF24Network_c.c	memcpy(&rn.frag_queue,rn.frame_buffer,8);
	MOVLW	HIGH(_rn + 216)
	MOVWF	r0x0a
	MOVLW	LOW(_rn + 216)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x0d
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	(_rn + 228)
	.line	561; ../../RF24Network_c.c	memcpy(rn.frag_queue.message_buffer,rn.frame_buffer+sizeof(RF24NetworkHeader),message_size);
	MOVF	(_rn + 228), W, B
	MOVWF	r0x0b
	BANKSEL	(_rn + 227)
	MOVF	(_rn + 227), W, B
	MOVWF	r0x0a
	BANKSEL	(_rn + 226)
	MOVF	(_rn + 226), W, B
	MOVWF	r0x09
	MOVLW	HIGH(_rn + 15)
	MOVWF	r0x0d
	MOVLW	LOW(_rn + 15)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	565; ../../RF24Network_c.c	rn.frag_queue.message_size = message_size;
	MOVF	r0x03, W
	BANKSEL	(_rn + 224)
	MOVWF	(_rn + 224), B
	MOVF	r0x04, W
	BANKSEL	(_rn + 225)
	MOVWF	(_rn + 225), B
	BANKSEL	(_rn + 223)
	.line	566; ../../RF24Network_c.c	--rn.frag_queue.header.reserved;
	DECF	(_rn + 223), W, B
	MOVWF	r0x09
	MOVF	r0x09, W
	BANKSEL	(_rn + 223)
	MOVWF	(_rn + 223), B
	.line	570; ../../RF24Network_c.c	return 1;		
	MOVLW	0x01
	GOTO	_00367_DS_
_00355_DS_:
	.line	573; ../../RF24Network_c.c	if(header->type == NETWORK_LAST_FRAGMENT || header->type == NETWORK_MORE_FRAGMENTS || header->type == NETWORK_MORE_FRAGMENTS_NACK){
	MOVF	r0x08, W
	XORLW	0x96
	BZ	_00350_DS_
	MOVF	r0x08, W
	XORLW	0x95
	BZ	_00350_DS_
	MOVF	r0x08, W
	XORLW	0xc8
	BZ	_00350_DS_
	BRA	_00361_DS_
_00350_DS_:
	.line	575; ../../RF24Network_c.c	if(rn.frag_queue.message_size + message_size > MAX_PAYLOAD_SIZE){
	MOVFF	(_rn + 224), r0x09
	MOVFF	(_rn + 225), r0x0a
	MOVF	r0x03, W
	ADDWF	r0x09, W
	MOVWF	r0x0b
	MOVF	r0x04, W
	ADDWFC	r0x0a, W
	MOVWF	r0x0c
	MOVLW	0x00
	SUBWF	r0x0c, W
	BNZ	_00464_DS_
	MOVLW	0x91
	SUBWF	r0x0b, W
_00464_DS_:
	BNC	_00335_DS_
	BANKSEL	(_rn + 223)
	.line	580; ../../RF24Network_c.c	rn.frag_queue.header.reserved=0;
	CLRF	(_rn + 223), B
	.line	581; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	GOTO	_00367_DS_
_00335_DS_:
	.line	583; ../../RF24Network_c.c	if(  rn.frag_queue.header.reserved == 0 || (header->type != NETWORK_LAST_FRAGMENT && header->reserved != rn.frag_queue.header.reserved ) || rn.frag_queue.header.id != header->id ){
	MOVFF	(_rn + 223), r0x0b
	MOVF	r0x0b, W
	BZ	_00336_DS_
	MOVF	r0x08, W
	XORLW	0x96
	BZ	_00340_DS_
	MOVF	r0x00, W
	ADDLW	0x07
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0e
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget1
	MOVWF	r0x0c
	MOVF	r0x0c, W
	XORWF	r0x0b, W
	BNZ	_00336_DS_
_00340_DS_:
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	BANKSEL	(_rn + 220)
	MOVF	(_rn + 220), W, B
	XORWF	r0x0b, W
	BNZ	_00336_DS_
	BANKSEL	(_rn + 221)
	MOVF	(_rn + 221), W, B
	XORWF	r0x0c, W
	BZ	_00337_DS_
_00336_DS_:
	.line	589; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	GOTO	_00367_DS_
_00337_DS_:
	.line	592; ../../RF24Network_c.c	memcpy(rn.frag_queue.message_buffer+rn.frag_queue.message_size,rn.frame_buffer+sizeof(RF24NetworkHeader),message_size);
	CLRF	r0x0b
	BANKSEL	(_rn + 226)
	MOVF	(_rn + 226), W, B
	ADDWF	r0x09, F
	BANKSEL	(_rn + 227)
	MOVF	(_rn + 227), W, B
	ADDWFC	r0x0a, F
	BANKSEL	(_rn + 228)
	MOVF	(_rn + 228), W, B
	ADDWFC	r0x0b, F
	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVLW	HIGH(_rn + 15)
	MOVWF	r0x0d
	MOVLW	LOW(_rn + 15)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	593; ../../RF24Network_c.c	rn.frag_queue.message_size += message_size;
	MOVF	r0x03, W
	BANKSEL	(_rn + 224)
	ADDWF	(_rn + 224), W, B
	MOVWF	r0x09
	MOVF	r0x04, W
	BANKSEL	(_rn + 225)
	ADDWFC	(_rn + 225), W, B
	MOVWF	r0x0a
	MOVF	r0x09, W
	BANKSEL	(_rn + 224)
	MOVWF	(_rn + 224), B
	MOVF	r0x0a, W
	BANKSEL	(_rn + 225)
	MOVWF	(_rn + 225), B
	.line	595; ../../RF24Network_c.c	if(header->type != NETWORK_LAST_FRAGMENT){
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVF	r0x05, W
	XORLW	0x96
	BZ	_00342_DS_
_00472_DS_:
	BANKSEL	(_rn + 223)
	.line	596; ../../RF24Network_c.c	--rn.frag_queue.header.reserved;
	DECF	(_rn + 223), W, B
	MOVWF	r0x05
	MOVF	r0x05, W
	BANKSEL	(_rn + 223)
	MOVWF	(_rn + 223), B
	.line	597; ../../RF24Network_c.c	return 1;
	MOVLW	0x01
	GOTO	_00367_DS_
_00342_DS_:
	BANKSEL	(_rn + 223)
	.line	599; ../../RF24Network_c.c	rn.frag_queue.header.reserved = 0;
	CLRF	(_rn + 223), B
	.line	600; ../../RF24Network_c.c	rn.frag_queue.header.type = header->reserved;
	MOVLW	0x07
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_rn + 222)
	MOVWF	(_rn + 222), B
	.line	606; ../../RF24Network_c.c	if(rn.frag_queue.header.type == EXTERNAL_DATA_TYPE){
	MOVF	r0x00, W
	XORLW	0x83
	BNZ	_00344_DS_
	.line	607; ../../RF24Network_c.c	return 2;
	MOVLW	0x02
	GOTO	_00367_DS_
_00344_DS_:
	.line	613; ../../RF24Network_c.c	if(MAX_PAYLOAD_SIZE - (rn.next_frame-rn.frame_queue) >= rn.frag_queue.message_size){
	MOVFF	(_rn + 213), r0x00
	MOVFF	(_rn + 214), r0x01
	MOVFF	(_rn + 215), r0x02
	MOVLW	LOW(_rn + 59)
	SUBWF	r0x00, W
	MOVWF	r0x05
	MOVLW	HIGH(_rn + 59)
	SUBWFB	r0x01, W
	MOVWF	r0x06
	MOVF	r0x05, W
	SUBLW	0x90
	MOVWF	r0x05
	MOVLW	0x00
	SUBFWB	r0x06, F
	BANKSEL	(_rn + 225)
	MOVF	(_rn + 225), W, B
	SUBWF	r0x06, W
	BNZ	_00475_DS_
	BANKSEL	(_rn + 224)
	MOVF	(_rn + 224), W, B
	SUBWF	r0x05, W
_00475_DS_:
	BTFSS	STATUS, 0
	BRA	_00348_DS_
	.line	615; ../../RF24Network_c.c	memcpy(rn.next_frame,&rn.frag_queue,10);
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	HIGH(_rn + 216)
	MOVWF	r0x06
	MOVLW	LOW(_rn + 216)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	(_rn + 213)
	.line	616; ../../RF24Network_c.c	memcpy(rn.next_frame+10,rn.frag_queue.message_buffer,rn.frag_queue.message_size);
	MOVF	(_rn + 213), W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_rn + 214)
	ADDWFC	(_rn + 214), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_rn + 215)
	ADDWFC	(_rn + 215), W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	BANKSEL	(_rn + 228)
	MOVF	(_rn + 228), W, B
	MOVWF	r0x07
	BANKSEL	(_rn + 227)
	MOVF	(_rn + 227), W, B
	MOVWF	r0x06
	BANKSEL	(_rn + 226)
	MOVF	(_rn + 226), W, B
	MOVWF	r0x05
	BANKSEL	(_rn + 225)
	MOVF	(_rn + 225), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 224)
	MOVF	(_rn + 224), W, B
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	(_rn + 224)
	.line	617; ../../RF24Network_c.c	rn.next_frame += (10+rn.frag_queue.message_size);
	MOVF	(_rn + 224), W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_rn + 225)
	ADDWFC	(_rn + 225), W, B
	MOVWF	r0x01
	CLRF	r0x02
	BANKSEL	(_rn + 213)
	MOVF	(_rn + 213), W, B
	ADDWF	r0x00, F
	BANKSEL	(_rn + 214)
	MOVF	(_rn + 214), W, B
	ADDWFC	r0x01, F
	BANKSEL	(_rn + 215)
	MOVF	(_rn + 215), W, B
	ADDWFC	r0x02, F
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
	BANKSEL	(_rn + 224)
	.line	619; ../../RF24Network_c.c	if((padding = (rn.frag_queue.message_size+10)%4)){
	MOVF	(_rn + 224), W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_rn + 225)
	ADDWFC	(_rn + 225), W, B
	MOVWF	r0x01
	MOVLW	0x03
	ANDWF	r0x00, F
	CLRF	r0x01
	MOVFF	r0x00, r0x01
	MOVF	r0x00, W
	BZ	_00346_DS_
	.line	620; ../../RF24Network_c.c	rn.next_frame += 4 - padding;
	CLRF	r0x00
	MOVF	r0x01, W
	SUBLW	0x04
	MOVWF	r0x01
	MOVLW	0x00
	SUBFWB	r0x00, F
	CLRF	r0x02
	BTFSC	r0x00, 7
	SETF	r0x02
	BANKSEL	(_rn + 213)
	MOVF	(_rn + 213), W, B
	ADDWF	r0x01, F
	BANKSEL	(_rn + 214)
	MOVF	(_rn + 214), W, B
	ADDWFC	r0x00, F
	BANKSEL	(_rn + 215)
	MOVF	(_rn + 215), W, B
	ADDWFC	r0x02, F
	MOVF	r0x01, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x00, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
_00346_DS_:
	.line	624; ../../RF24Network_c.c	return 1;
	MOVLW	0x01
	BRA	_00367_DS_
_00348_DS_:
	.line	626; ../../RF24Network_c.c	RF24_stopListening();
	CALL	_RF24_stopListening
	.line	627; ../../RF24Network_c.c	rn.networkFlags |= FLAG_HOLD_INCOMING;          
	MOVLW	0x01
	BANKSEL	(_rn + 43)
	IORWF	(_rn + 43), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	.line	630; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	BRA	_00367_DS_
_00360_DS_:
	.line	640; ../../RF24Network_c.c	if(header->type == EXTERNAL_DATA_TYPE){
	MOVF	r0x08, W
	XORLW	0x83
	BZ	_00479_DS_
	BRA	_00361_DS_
_00479_DS_:
	.line	641; ../../RF24Network_c.c	memcpy(&rn.frag_queue,rn.frame_buffer,8);
	MOVLW	HIGH(_rn + 216)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 216)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x06
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	.line	642; ../../RF24Network_c.c	rn.frag_queue.message_buffer = rn.frame_buffer+sizeof(RF24NetworkHeader);
	MOVLW	HIGH(_rn + 15)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 15)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x00, W
	BANKSEL	(_rn + 226)
	MOVWF	(_rn + 226), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 227)
	MOVWF	(_rn + 227), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 228)
	MOVWF	(_rn + 228), B
	.line	643; ../../RF24Network_c.c	rn.frag_queue.message_size = message_size;
	MOVF	r0x03, W
	BANKSEL	(_rn + 224)
	MOVWF	(_rn + 224), B
	MOVF	r0x04, W
	BANKSEL	(_rn + 225)
	MOVWF	(_rn + 225), B
	.line	644; ../../RF24Network_c.c	return 2;
	MOVLW	0x02
	BRA	_00367_DS_
_00361_DS_:
	.line	651; ../../RF24Network_c.c	if(message_size + (rn.next_frame-rn.frame_queue) <= MAIN_BUFFER_SIZE){
	MOVFF	(_rn + 213), r0x00
	MOVFF	(_rn + 214), r0x01
	MOVFF	(_rn + 215), r0x02
	MOVLW	LOW(_rn + 59)
	SUBWF	r0x00, W
	MOVWF	r0x05
	MOVLW	HIGH(_rn + 59)
	SUBWFB	r0x01, W
	MOVWF	r0x06
	MOVF	r0x05, W
	ADDWF	r0x03, F
	MOVF	r0x06, W
	ADDWFC	r0x04, F
	MOVLW	0x00
	SUBWF	r0x04, W
	BNZ	_00480_DS_
	MOVLW	0x9b
	SUBWF	r0x03, W
_00480_DS_:
	BTFSC	STATUS, 0
	BRA	_00365_DS_
	.line	653; ../../RF24Network_c.c	memcpy(rn.next_frame,rn.frame_buffer,8);
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x04
	MOVLW	LOW(_rn + 7)
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
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	(_rn + 213)
	.line	654; ../../RF24Network_c.c	memcpy(rn.next_frame+8,&message_size,2);
	MOVF	(_rn + 213), W, B
	ADDLW	0x08
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_rn + 214)
	ADDWFC	(_rn + 214), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_rn + 215)
	ADDWFC	(_rn + 215), W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	HIGH(_RF24N_enqueue_message_size_1_210)
	MOVWF	r0x04
	MOVLW	LOW(_RF24N_enqueue_message_size_1_210)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
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
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	(_rn + 213)
	.line	655; ../../RF24Network_c.c	memcpy(rn.next_frame+10,rn.frame_buffer+8,message_size);
	MOVF	(_rn + 213), W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_rn + 214)
	ADDWFC	(_rn + 214), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_rn + 215)
	ADDWFC	(_rn + 215), W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	HIGH(_rn + 15)
	MOVWF	r0x04
	MOVLW	LOW(_rn + 15)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	BANKSEL	(_RF24N_enqueue_message_size_1_210 + 1)
	MOVF	(_RF24N_enqueue_message_size_1_210 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_RF24N_enqueue_message_size_1_210
	MOVF	_RF24N_enqueue_message_size_1_210, W, B
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
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	_RF24N_enqueue_message_size_1_210
	.line	659; ../../RF24Network_c.c	rn.next_frame += (message_size + 10);
	MOVF	_RF24N_enqueue_message_size_1_210, W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_RF24N_enqueue_message_size_1_210 + 1)
	ADDWFC	(_RF24N_enqueue_message_size_1_210 + 1), W, B
	MOVWF	r0x01
	CLRF	r0x02
	BANKSEL	(_rn + 213)
	MOVF	(_rn + 213), W, B
	ADDWF	r0x00, F
	BANKSEL	(_rn + 214)
	MOVF	(_rn + 214), W, B
	ADDWFC	r0x01, F
	BANKSEL	(_rn + 215)
	MOVF	(_rn + 215), W, B
	ADDWFC	r0x02, F
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
	BANKSEL	_RF24N_enqueue_message_size_1_210
	.line	661; ../../RF24Network_c.c	if((padding = (message_size+10)%4)){
	MOVF	_RF24N_enqueue_message_size_1_210, W, B
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_RF24N_enqueue_message_size_1_210 + 1)
	ADDWFC	(_RF24N_enqueue_message_size_1_210 + 1), W, B
	MOVWF	r0x01
	MOVLW	0x03
	ANDWF	r0x00, F
	CLRF	r0x01
	MOVFF	r0x00, r0x01
	MOVF	r0x00, W
	BZ	_00363_DS_
	.line	662; ../../RF24Network_c.c	rn.next_frame += 4 - padding;
	CLRF	r0x00
	MOVF	r0x01, W
	SUBLW	0x04
	MOVWF	r0x01
	MOVLW	0x00
	SUBFWB	r0x00, F
	CLRF	r0x02
	BTFSC	r0x00, 7
	SETF	r0x02
	BANKSEL	(_rn + 213)
	MOVF	(_rn + 213), W, B
	ADDWF	r0x01, F
	BANKSEL	(_rn + 214)
	MOVF	(_rn + 214), W, B
	ADDWFC	r0x00, F
	BANKSEL	(_rn + 215)
	MOVF	(_rn + 215), W, B
	ADDWFC	r0x02, F
	MOVF	r0x01, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x00, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
_00363_DS_:
	.line	667; ../../RF24Network_c.c	result = 1;
	MOVLW	0x01
	MOVWF	r0x00
	BRA	_00366_DS_
_00365_DS_:
	.line	669; ../../RF24Network_c.c	result = 0;
	CLRF	r0x00
_00366_DS_:
	.line	672; ../../RF24Network_c.c	return result;
	MOVF	r0x00, W
_00367_DS_:
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
S_RF24Network_c__RF24N_update	code
_RF24N_update:
	.line	226; ../../RF24Network_c.c	uint8_t RF24N_update()
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
	.line	230; ../../RF24Network_c.c	uint8_t returnVal = 0;
	CLRF	r0x00
	.line	237; ../../RF24Network_c.c	if(!(rn.networkFlags & FLAG_BYPASS_HOLDS)){
	MOVFF	(_rn + 43), r0x01
	BTFSC	r0x01, 1
	BRA	_00197_DS_
	.line	238; ../../RF24Network_c.c	if( (rn.networkFlags & FLAG_HOLD_INCOMING) || (rn.next_frame-rn.frame_queue) + 34 > MAIN_BUFFER_SIZE ){
	BTFSC	r0x01, 0
	BRA	_00151_DS_
	MOVLW	LOW(_rn + 59)
	BANKSEL	(_rn + 213)
	SUBWF	(_rn + 213), W, B
	MOVWF	r0x01
	MOVLW	HIGH(_rn + 59)
	BANKSEL	(_rn + 214)
	SUBWFB	(_rn + 214), W, B
	MOVWF	r0x02
	MOVLW	0x22
	ADDWF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00285_DS_
	MOVLW	0x9b
	SUBWF	r0x01, W
_00285_DS_:
	BNC	_00197_DS_
_00151_DS_:
	.line	239; ../../RF24Network_c.c	if(!RF24N_available()){
	CALL	_RF24N_available
	MOVWF	r0x01
	MOVF	r0x01, W
	BNZ	_00149_DS_
	.line	240; ../../RF24Network_c.c	rn.networkFlags &= ~FLAG_HOLD_INCOMING;
	MOVLW	0xfe
	BANKSEL	(_rn + 43)
	ANDWF	(_rn + 43), W, B
	MOVWF	r0x01
	MOVF	r0x01, W
	BANKSEL	(_rn + 43)
	MOVWF	(_rn + 43), B
	BRA	_00197_DS_
_00149_DS_:
	.line	242; ../../RF24Network_c.c	return 0;
	CLRF	WREG
	GOTO	_00200_DS_
_00197_DS_:
	.line	248; ../../RF24Network_c.c	while ( RF24_isValid() && RF24_available_p(&pipe_num) ){
	CALL	_RF24_isValid
	MOVWF	r0x01
	MOVF	r0x01, W
	BTFSC	STATUS, 2
	GOTO	_00199_DS_
	MOVLW	HIGH(_RF24N_update_pipe_num_1_186)
	MOVWF	r0x02
	MOVLW	LOW(_RF24N_update_pipe_num_1_186)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_available_p
	MOVWF	r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x01, W
	BTFSC	STATUS, 2
	BRA	_00199_DS_
	.line	252; ../../RF24Network_c.c	if( (rn.frame_size = RF24_getDynamicPayloadSize() ) < sizeof(RF24NetworkHeader)){
	CALL	_RF24_getDynamicPayloadSize
	MOVWF	r0x01
	MOVF	r0x01, W
	BANKSEL	(_rn + 51)
	MOVWF	(_rn + 51), B
	MOVLW	0x08
	SUBWF	r0x01, W
	BC	_00157_DS_
	.line	253; ../../RF24Network_c.c	delay(10);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	254; ../../RF24Network_c.c	continue;
	BRA	_00197_DS_
_00157_DS_:
	.line	261; ../../RF24Network_c.c	RF24_read(rn.frame_buffer, rn.frame_size );
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x02
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	BANKSEL	(_rn + 51)
	MOVF	(_rn + 51), W, B
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_read
	MOVLW	0x04
	ADDWF	FSR1L, F
	.line	264; ../../RF24Network_c.c	header = (RF24NetworkHeader*)(rn.frame_buffer);
	MOVLW	HIGH(_rn + 7)
	MOVWF	r0x02
	MOVLW	LOW(_rn + 7)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	.line	278; ../../RF24Network_c.c	if ( !RF24N_is_valid_address( header->to_node) ){
	MOVF	r0x01, W
	ADDLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_RF24N_is_valid_address
	MOVWF	r0x07
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00197_DS_
	.line	282; ../../RF24Network_c.c	returnVal = header->type;
	MOVF	r0x01, W
	ADDLW	0x06
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x09
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x0a
	MOVFF	r0x0a, r0x00
	.line	285; ../../RF24Network_c.c	if ( header->to_node == rn.node_address   ){
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVFF	(_rn + 49), r0x0d
	MOVFF	(_rn + 50), r0x0e
	MOVF	r0x0b, W
	XORWF	r0x0d, W
	BNZ	_00288_DS_
	MOVF	r0x0c, W
	XORWF	r0x0e, W
	BZ	_00289_DS_
_00288_DS_:
	BRA	_00194_DS_
_00289_DS_:
	.line	287; ../../RF24Network_c.c	if(header->type == NETWORK_PING){
	MOVF	r0x0a, W
	XORLW	0x82
	BNZ	_00291_DS_
	BRA	_00197_DS_
_00291_DS_:
	.line	290; ../../RF24Network_c.c	if(header->type == NETWORK_ADDR_RESPONSE ){	
	MOVF	r0x0a, W
	XORLW	0x80
	BZ	_00293_DS_
	BRA	_00165_DS_
_00293_DS_:
	.line	292; ../../RF24Network_c.c	if(requester != rn.node_address){
	MOVF	r0x0d, W
	XORLW	0x24
	BNZ	_00295_DS_
	MOVF	r0x0e, W
	XORLW	0x09
	BNZ	_00295_DS_
	BRA	_00165_DS_
_00295_DS_:
	.line	293; ../../RF24Network_c.c	header->to_node = requester;
	MOVLW	0x24
	MOVWF	POSTDEC1
	MOVLW	0x09
	MOVWF	PRODH
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput2
	.line	294; ../../RF24Network_c.c	RF24N_write(header->to_node,USER_TX_TO_PHYSICAL_ADDRESS);
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	295; ../../RF24Network_c.c	delay(10);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	296; ../../RF24Network_c.c	RF24N_write(header->to_node,USER_TX_TO_PHYSICAL_ADDRESS);
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	298; ../../RF24Network_c.c	continue;
	BRA	_00197_DS_
_00165_DS_:
	.line	301; ../../RF24Network_c.c	if(header->type == NETWORK_REQ_ADDRESS && rn.node_address){
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	XORLW	0xc3
	BNZ	_00167_DS_
	MOVFF	(_rn + 49), r0x0b
	MOVFF	(_rn + 50), r0x0c
	MOVF	r0x0b, W
	IORWF	r0x0c, W
	BZ	_00167_DS_
	.line	303; ../../RF24Network_c.c	header->from_node = rn.node_address;
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, PRODH
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrput2
	.line	304; ../../RF24Network_c.c	header->to_node = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput2
	.line	305; ../../RF24Network_c.c	RF24N_write(header->to_node,TX_NORMAL);
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	306; ../../RF24Network_c.c	continue;
	BRA	_00197_DS_
_00167_DS_:
	BANKSEL	(_rn + 42)
	.line	309; ../../RF24Network_c.c	if( (rn.returnSysMsgs && header->type > 127) || header->type == NETWORK_ACK ){	
	MOVF	(_rn + 42), W, B
	BZ	_00178_DS_
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVLW	0x80
	SUBWF	r0x0b, W
	BC	_00175_DS_
_00178_DS_:
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	XORLW	0xc1
	BNZ	_00176_DS_
_00175_DS_:
	.line	312; ../../RF24Network_c.c	if( header->type != NETWORK_FIRST_FRAGMENT && header->type != NETWORK_MORE_FRAGMENTS && header->type != NETWORK_MORE_FRAGMENTS_NACK && header->type != EXTERNAL_DATA_TYPE && header->type!= NETWORK_LAST_FRAGMENT){
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVF	r0x07, W
	XORLW	0x94
	BZ	_00176_DS_
	MOVF	r0x07, W
	XORLW	0x95
	BZ	_00176_DS_
	MOVF	r0x07, W
	XORLW	0xc8
	BZ	_00176_DS_
	MOVF	r0x07, W
	XORLW	0x83
	BZ	_00176_DS_
	MOVF	r0x07, W
	XORLW	0x96
	BZ	_00176_DS_
	.line	313; ../../RF24Network_c.c	return returnVal;
	MOVF	r0x00, W
	BRA	_00200_DS_
_00176_DS_:
	.line	317; ../../RF24Network_c.c	if( RF24N_enqueue(header) == 2 ){ //External data received			
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24N_enqueue
	MOVWF	r0x07
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x07, W
	XORLW	0x02
	BZ	_00312_DS_
	BRA	_00197_DS_
_00312_DS_:
	.line	321; ../../RF24Network_c.c	return EXTERNAL_DATA_TYPE;				
	MOVLW	0x83
	BRA	_00200_DS_
_00194_DS_:
	.line	327; ../../RF24Network_c.c	if( header->to_node == 0100){
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVF	r0x07, W
	XORLW	0x40
	BNZ	_00313_DS_
	MOVF	r0x08, W
	BZ	_00314_DS_
_00313_DS_:
	BRA	_00191_DS_
_00314_DS_:
	.line	330; ../../RF24Network_c.c	if(header->type == NETWORK_POLL  ){
	MOVF	r0x0a, W
	XORLW	0xc2
	BZ	_00316_DS_
	BRA	_00185_DS_
_00316_DS_:
	BANKSEL	(_rn + 43)
	.line	331; ../../RF24Network_c.c	if( !(rn.networkFlags & FLAG_NO_POLL) && rn.node_address != 04444 ){
	BTFSC	(_rn + 43), 3
	BRA	_00197_DS_
	MOVF	r0x0d, W
	XORLW	0x24
	BNZ	_00319_DS_
	MOVF	r0x0e, W
	XORLW	0x09
	BNZ	_00319_DS_
	BRA	_00197_DS_
_00319_DS_:
	.line	332; ../../RF24Network_c.c	header->to_node = header->from_node;
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput2
	.line	333; ../../RF24Network_c.c	header->from_node = rn.node_address;			
	MOVFF	(_rn + 49), r0x07
	MOVFF	(_rn + 50), r0x08
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrput2
	.line	334; ../../RF24Network_c.c	delay(rn.parent_pipe);
	MOVFF	(_rn + 56), r0x07
	CLRF	r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	335; ../../RF24Network_c.c	RF24N_write(header->to_node,USER_TX_TO_PHYSICAL_ADDRESS);                      
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	.line	337; ../../RF24Network_c.c	continue;
	BRA	_00197_DS_
_00185_DS_:
	.line	339; ../../RF24Network_c.c	val = RF24N_enqueue(header);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24N_enqueue
	MOVWF	r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	_rn
	.line	341; ../../RF24Network_c.c	if(rn.multicastRelay){					
	MOVF	_rn, W, B
	BZ	_00187_DS_
	BANKSEL	(_rn + 48)
	.line	343; ../../RF24Network_c.c	RF24N_write(RF24N_levelToAddress(rn.multicast_level)<<3,4);
	MOVF	(_rn + 48), W, B
	MOVWF	POSTDEC1
	CALL	_RF24N_levelToAddress
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVF	POSTINC1, F
	MOVF	r0x02, W
	MOVWF	r0x07
	ADDWF	r0x07, F
	RLCF	r0x03, W
	MOVWF	r0x08
	BCF	STATUS, 0
	RLCF	r0x07, F
	RLCF	r0x08, F
	BCF	STATUS, 0
	RLCF	r0x07, F
	RLCF	r0x08, F
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVLW	0x03
	ADDWF	FSR1L, F
_00187_DS_:
	.line	345; ../../RF24Network_c.c	if( val == 2 ){ //External data received			
	MOVF	r0x01, W
	XORLW	0x02
	BZ	_00321_DS_
	BRA	_00197_DS_
_00321_DS_:
	.line	347; ../../RF24Network_c.c	return EXTERNAL_DATA_TYPE;
	MOVLW	0x83
	BRA	_00200_DS_
_00191_DS_:
	.line	351; ../../RF24Network_c.c	RF24N_write(header->to_node,1);	//Send it on, indicate it is a routed payload
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	GOTO	_00197_DS_
_00199_DS_:
	.line	359; ../../RF24Network_c.c	return returnVal;
	MOVF	r0x00, W
_00200_DS_:
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
S_RF24Network_c__RF24N_begin_d	code
_RF24N_begin_d:
	.line	163; ../../RF24Network_c.c	void RF24N_begin_d(uint8_t _channel, uint16_t _node_address )
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
	.line	168; ../../RF24Network_c.c	if (! RF24N_is_valid_address(_node_address) )
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24N_is_valid_address
	MOVWF	r0x03
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x03, W
	BNZ	_00116_DS_
	.line	169; ../../RF24Network_c.c	return;
	BRA	_00124_DS_
_00116_DS_:
	.line	171; ../../RF24Network_c.c	rn.node_address = _node_address;
	MOVF	r0x01, W
	BANKSEL	(_rn + 49)
	MOVWF	(_rn + 49), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 50)
	MOVWF	(_rn + 50), B
	.line	173; ../../RF24Network_c.c	if ( ! RF24_isValid() ){
	CALL	_RF24_isValid
	MOVWF	r0x03
	MOVF	r0x03, W
	BNZ	_00118_DS_
	.line	174; ../../RF24Network_c.c	return;
	BRA	_00124_DS_
_00118_DS_:
	.line	178; ../../RF24Network_c.c	if(_channel != USE_CURRENT_CHANNEL){
	MOVF	r0x00, W
	XORLW	0xff
	BZ	_00120_DS_
	.line	179; ../../RF24Network_c.c	RF24_setChannel(_channel);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_setChannel
	MOVF	POSTINC1, F
_00120_DS_:
	.line	182; ../../RF24Network_c.c	RF24_setAutoAck_p(0,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_RF24_setAutoAck_p
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	185; ../../RF24Network_c.c	RF24_enableDynamicPayloads();
	CALL	_RF24_enableDynamicPayloads
	.line	189; ../../RF24Network_c.c	retryVar = (((rn.node_address % 6)+1) *2) + 3;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 50)
	MOVF	(_rn + 50), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 49)
	MOVF	(_rn + 49), W, B
	MOVWF	POSTDEC1
	CALL	__moduint
	MOVWF	r0x00
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	INCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
	MOVF	r0x00, W
	MULLW	0x02
	MOVFF	PRODL, r0x00
	MOVLW	0x03
	ADDWF	r0x00, F
	.line	190; ../../RF24Network_c.c	RF24_setRetries(retryVar, 5); // max about 85ms per attempt
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_setRetries
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	.line	191; ../../RF24Network_c.c	rn.txTimeout = 25;
	MOVLW	0x19
	BANKSEL	(_rn + 1)
	MOVWF	(_rn + 1), B
	BANKSEL	(_rn + 2)
	CLRF	(_rn + 2), B
	BANKSEL	(_rn + 3)
	CLRF	(_rn + 3), B
	BANKSEL	(_rn + 4)
	CLRF	(_rn + 4), B
	BANKSEL	(_rn + 4)
	.line	192; ../../RF24Network_c.c	rn.routeTimeout = rn.txTimeout*3; // Adjust for max delay per node within a single chain
	MOVF	(_rn + 4), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 3)
	MOVF	(_rn + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 2)
	MOVF	(_rn + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rn + 1)
	MOVF	(_rn + 1), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x00
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x04
	MOVFF	FSR0L, r0x05
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	(_rn + 5)
	MOVWF	(_rn + 5), B
	MOVF	r0x03, W
	BANKSEL	(_rn + 6)
	MOVWF	(_rn + 6), B
	.line	202; ../../RF24Network_c.c	RF24N_setup_address();
	CALL	_RF24N_setup_address
	.line	206; ../../RF24Network_c.c	while (i--){
	MOVLW	0x06
	MOVWF	r0x00
_00121_DS_:
	MOVFF	r0x00, r0x03
	DECF	r0x00, F
	MOVF	r0x03, W
	BZ	_00123_DS_
	.line	208; ../../RF24Network_c.c	RF24N_pipe_address(_node_address,i,addr);	
	MOVLW	HIGH(_RF24N_begin_d_addr_2_185)
	MOVWF	r0x04
	MOVLW	LOW(_RF24N_begin_d_addr_2_185)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24N_pipe_address
	MOVLW	0x06
	ADDWF	FSR1L, F
	.line	209; ../../RF24Network_c.c	RF24_openReadingPipe_d(i,addr);	
	MOVLW	HIGH(_RF24N_begin_d_addr_2_185)
	MOVWF	r0x04
	MOVLW	LOW(_RF24N_begin_d_addr_2_185)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_openReadingPipe_d
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00121_DS_
_00123_DS_:
	.line	211; ../../RF24Network_c.c	RF24_startListening();
	CALL	_RF24_startListening
_00124_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24N_init	code
_RF24N_init:
	.line	84; ../../RF24Network_c.c	void RF24N_init(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	86; ../../RF24Network_c.c	rn.next_frame= rn.frame_queue; 
	MOVLW	HIGH(_rn + 59)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 59)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x00, W
	BANKSEL	(_rn + 213)
	MOVWF	(_rn + 213), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 214)
	MOVWF	(_rn + 214), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 215)
	MOVWF	(_rn + 215), B
	.line	88; ../../RF24Network_c.c	rn.frag_queue.message_buffer=&rn.frag_queue_message_buffer[0];
	MOVLW	HIGH(_rn + 229)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 229)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x00, W
	BANKSEL	(_rn + 226)
	MOVWF	(_rn + 226), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 227)
	MOVWF	(_rn + 227), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 228)
	MOVWF	(_rn + 228), B
	.line	89; ../../RF24Network_c.c	rn.frag_ptr = &rn.frag_queue;
	MOVLW	HIGH(_rn + 216)
	MOVWF	r0x01
	MOVLW	LOW(_rn + 216)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x00, W
	BANKSEL	(_rn + 39)
	MOVWF	(_rn + 39), B
	MOVF	r0x01, W
	BANKSEL	(_rn + 40)
	MOVWF	(_rn + 40), B
	MOVF	r0x02, W
	BANKSEL	(_rn + 41)
	MOVWF	(_rn + 41), B
	BANKSEL	(_rn + 44)
	.line	91; ../../RF24Network_c.c	rn.txTime=0; 
	CLRF	(_rn + 44), B
	BANKSEL	(_rn + 45)
	CLRF	(_rn + 45), B
	BANKSEL	(_rn + 46)
	CLRF	(_rn + 46), B
	BANKSEL	(_rn + 47)
	CLRF	(_rn + 47), B
	BANKSEL	(_rn + 43)
	.line	92; ../../RF24Network_c.c	rn.networkFlags=0; 
	CLRF	(_rn + 43), B
	BANKSEL	(_rn + 42)
	.line	93; ../../RF24Network_c.c	rn.returnSysMsgs=0; 
	CLRF	(_rn + 42), B
	BANKSEL	_rn
	.line	94; ../../RF24Network_c.c	rn.multicastRelay=0;
	CLRF	_rn, B
	.line	99; ../../RF24Network_c.c	rn.max_frame_payload_size = MAX_FRAME_SIZE-sizeof(RF24NetworkHeader);
	MOVLW	0x18
	BANKSEL	(_rn + 52)
	MOVWF	(_rn + 52), B
	BANKSEL	(_rn + 53)
	CLRF	(_rn + 53), B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_RF24Network_c__RF24NH_init	code
_RF24NH_init:
	.line	47; ../../RF24Network_c.c	void RF24NH_init(RF24NetworkHeader *rnh, uint16_t _to, unsigned char _type)
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
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	.line	49; ../../RF24Network_c.c	rnh->to_node=_to;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput2
	.line	50; ../../RF24Network_c.c	rnh->id=next_id++;
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	_next_id, r0x07
	MOVFF	(_next_id + 1), r0x08
	BANKSEL	_next_id
	INCFSZ	_next_id, F, B
	BRA	_11002_DS_
	BANKSEL	(_next_id + 1)
	INCF	(_next_id + 1), F, B
_11002_DS_:
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x06, W
	CALL	__gptrput2
	.line	51; ../../RF24Network_c.c	rnh->type=_type;
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
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



; Statistics:
; code size:	10904 (0x2a98) bytes ( 8.32%)
;           	 5452 (0x154c) words
; udata size:	  404 (0x0194) bytes (10.52%)
; access size:	   27 (0x001b) bytes


	end
