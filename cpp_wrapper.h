/*
 Copyright (C) 2011 James Coliz, Jr. <maniacbug@ymail.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 */


/**
 * @file RF24Network.h
 *
 * Class declaration for RF24Network
 */

/**
 * Header which is sent with each message
 *
 * The frame put over the air consists of this header and a message
 *
 * Headers are addressed to the appropriate node, and the network forwards them on to their final destination.
 */
struct RF24NetworkHeader :RF24NetworkHeader_
{
  

  /**
   * Default constructor
   *

   * Simply constructs a blank header
   */
  RF24NetworkHeader() {}

  /**
   * Send constructor  
   *  
   * @note Now supports automatic fragmentation for very long messages, which can be sent as usual if fragmentation is enabled. 
   *
   * Fragmentation is enabled by default for all devices except ATTiny <br>
   * Configure fragmentation and max payload size in RF24Network_config.h
   *  
   * Use this constructor to create a header and then send a message  
   *   
   * @code
   *  uint16_t recipient_address = 011;
   *  
   *  RF24NetworkHeader header(recipient_address,'t');
   *  
   *  network.write(header,&message,sizeof(message));
   * @endcode
   *
   * @param _to The Octal format, logical node address where the message is going
   * @param _type The type of message which follows.  Only 0-127 are allowed for
   * user messages. Types 1-64 will not receive a network acknowledgement.
   */

  RF24NetworkHeader(uint16_t _to, unsigned char _type = 0) 
  {
    RF24NH_init(this, _to, _type ); 
  }
  /**
   * Create debugging string
   *
   * Useful for debugging.  Dumps all members into a single string, using
   * internal static memory.  This memory will get overridden next time
   * you call the method.
   *
   * @return String representation of this object
   */
  const char* toString(void) 
  {
    return  RF24NH_toString(this);
  }
};

 

/**
 * 2014-2015 - Optimized Network Layer for RF24 Radios
 *
 * This class implements an OSI Network Layer using nRF24L01(+) radios driven
 * by RF24 library.
 */

class RF24;

class RF24Network
{

  /**@}*/
  /**
   * @name Primary Interface
   *
   *  These are the main methods you need to operate the network
   */
  /**@{*/
  
public:
  /**
   * Construct the network
   *
   * @param _radio The underlying radio driver instance
   *
   */

  RF24Network( RF24& _radio )
  {
    RF24N_init();   
  };

  /**
   * Bring up the network using the current radio frequency/channel.
   * Calling begin brings up the network, and configures the address, which designates the location of the node within RF24Network topology.
   * @note Node addresses are specified in Octal format, see <a href=Addressing.html>RF24Network Addressing</a> for more information.
   * @warning Be sure to 'begin' the radio first.
   *
   * **Example 1:** Begin on current radio channel with address 0 (master node)
   * @code
   * network.begin(00);
   * @endcode
   * **Example 2:** Begin with address 01 (child of master)
   * @code
   * network.begin(01);
   * @endcode
   * **Example 3:** Begin with address 011 (child of 01, grandchild of master)
   * @code
   * network.begin(011);
   * @endcode   
   *
   * @see begin(uint8_t _channel, uint16_t _node_address )
   * @param _node_address The logical address of this node
   *
   */
   
  inline void begin(uint16_t _node_address)
  {
    RF24N_begin(_node_address);   
  };

  
  /**
   * Main layer loop
   *
   * This function must be called regularly to keep the layer going.  This is where payloads are 
   * re-routed, received, and all the action happens.
   *
   * @see
   * 
   * @return Returns the type of the last received payload.
   */
  uint8_t update(void)
  {
    return RF24N_update();   
  };

  /**
   * Test whether there is a message available for this node
   *
   * @return Whether there is a message available for this node
   */
  bool available(void)
  {
    return RF24N_available();   
  };

  /**
   * Read the next available header
   *
   * Reads the next available header without advancing to the next
   * incoming message.  Useful for doing a switch on the message type
   *
   * If there is no message available, the header is not touched
   *
   * @param[out] header The header (envelope) of the next message
   */
  uint16_t peek(RF24NetworkHeader& header)
  {
    return RF24N_peek(&header);   
  };

  /**
   * Read a message
   *
   * @code
   * while ( network.available() )  {
   *   RF24NetworkHeader header;
   *   uint32_t time;
   *   network.peek(header);
   *   if(header.type == 'T'){
   *     network.read(header,&time,sizeof(time));
   *     Serial.print("Got time: ");
   *     Serial.println(time);
   *   }
   * }
   * @endcode
   * @param[out] header The header (envelope) of this message
   * @param[out] message Pointer to memory where the message should be placed
   * @param maxlen The largest message size which can be held in @p message
   * @return The total number of bytes copied into @p message
   */
  uint16_t read(RF24NetworkHeader& header, void* message, uint16_t maxlen)
  {
    return RF24N_read(&header, message, maxlen);   
  };

  /**
   * Send a message
   *
   * @note RF24Network now supports fragmentation for very long messages, send as normal. Fragmentation
   * may need to be enabled or configured by editing the RF24Network_config.h file. Default max payload size is 120 bytes.
   * 
   * @code
   * uint32_t time = millis();
   * uint16_t to = 00; // Send to master
   * RF24NetworkHeader header(to, 'T'); // Send header type 'T'
   * network.write(header,&time,sizeof(time));
   * @endcode
   * @param[in,out] header The header (envelope) of this message.  The critical
   * thing to fill in is the @p to_node field so we know where to send the
   * message.  It is then updated with the details of the actual header sent.
   * @param message Pointer to memory where the message is located
   * @param len The size of the message
   * @return Whether the message was successfully received
   */
  bool write(RF24NetworkHeader& header,const void* message, uint16_t len)
  {
    return RF24N_write_m(&header, message, len);   
  };

  /**@}*/
  /**
   * @name Advanced Configuration
   *
   *  For advanced configuration of the network
   */
  /**@{*/
  

   /**
   * Construct the network in dual head mode using two radio modules.
   * @note Not working on RPi. Radios will share MISO, MOSI and SCK pins, but require separate CE,CS pins.
   * @code
   * 	RF24 radio(7,8);
   * 	RF24 radio1(4,5);
   * 	RF24Network(radio.radio1);
   * @endcode
   * @param _radio The underlying radio driver instance
   * @param _radio1 The second underlying radio driver instance
   */
  /* 
  RF24Network( RF24& _radio, RF24& _radio1)
  {
    RF24N_init2( _radio, _radio1);   
  }; 
  */
	/**
	* By default, multicast addresses are divided into levels. 
	*
	* Nodes 1-5 share a multicast address, nodes n1-n5 share a multicast address, and nodes n11-n55 share a multicast address.<br>
	*
	* This option is used to override the defaults, and create custom multicast groups that all share a single
	* address. <br> 
	* The level should be specified in decimal format 1-6 <br>
	* @see multicastRelay
	* @param level Levels 1 to 6 are available. All nodes at the same level will receive the same
	* messages if in range. Messages will be routed in order of level, low to high by default, with the
	* master node (00) at multicast Level 0
	*/

  void multicastLevel(uint8_t level)
  {
    RF24N_multicastLevel(level);   
  };


 /**
   * Set up the watchdog timer for sleep mode using the number 0 through 10 to represent the following time periods:<br>
   * wdt_16ms = 0, wdt_32ms, wdt_64ms, wdt_128ms, wdt_250ms, wdt_500ms, wdt_1s, wdt_2s, wdt_4s, wdt_8s
   * @code
   * 	setup_watchdog(7);   // Sets the WDT to trigger every second
   * @endcode
   * @param prescalar The WDT prescaler to define how often the node will wake up. When defining sleep mode cycles, this time period is 1 cycle.
   */
 void setup_watchdog(uint8_t prescalar)
  {
    RF24N_setup_watchdog(prescalar);   
  };

  
 
  /**@}*/
  /**
   * @name Advanced Operation
   *
   *  For advanced operation of the network
   */
  /**@{*/

  /**
   * Return the number of failures and successes for all transmitted payloads, routed or sent directly  
   * @note This needs to be enabled via #define ENABLE_NETWORK_STATS in RF24Network_config.h
   *
   *   @code  
   * bool fails, success;  
   * network.failures(&fails,&success);  
   * @endcode  
   *
   */
  void failures(uint32_t *_fails, uint32_t *_ok)
  {
    RF24N_failures(_fails, _ok);   
  };
  
   #if defined (RF24NetworkMulticast)
  
  /**
   * Send a multicast message to multiple nodes at once
   * Allows messages to be rapidly broadcast through the network  
   *   
   * Multicasting is arranged in levels, with all nodes on the same level listening to the same address  
   * Levels are assigned by network level ie: nodes 01-05: Level 1, nodes 011-055: Level 2
   * @see multicastLevel
   * @see multicastRelay
   * @param message Pointer to memory where the message is located
   * @param len The size of the message
   * @param level Multicast level to broadcast to
   * @return Whether the message was successfully sent
   */
   
  bool multicast(RF24NetworkHeader& header,const void* message, uint16_t len, uint8_t level)
  {
    return RF24N_multicast(&header,message, len, level);   
  };
   
	
   #endif
   
   /**
   * Writes a direct (unicast) payload. This allows routing or sending messages outside of the usual routing paths.
   * The same as write, but a physical address is specified as the last option.
   * The payload will be written to the physical address, and routed as necessary by the recipient
   */
  bool write(RF24NetworkHeader& header,const void* message, uint16_t len, uint16_t writeDirect)
  {
    return RF24N_write_( &header,message, len, writeDirect);   
  };

   /**
   * Sleep this node - For AVR devices only
   * @note NEW - Nodes can now be slept while the radio is not actively transmitting. This must be manually enabled by uncommenting
   * the #define ENABLE_SLEEP_MODE in RF24Network_config.h
   * @note Setting the interruptPin to 255 will disable interrupt wake-ups
   * @note The watchdog timer should be configured in setup() if using sleep mode.
   * This function will sleep the node, with the radio still active in receive mode.
   *
   * The node can be awoken in two ways, both of which can be enabled simultaneously:
   * 1. An interrupt - usually triggered by the radio receiving a payload. Must use pin 2 (interrupt 0) or 3 (interrupt 1) on Uno, Nano, etc.
   * 2. The watchdog timer waking the MCU after a designated period of time, can also be used instead of delays to control transmission intervals.
   * @code
   * if(!network.available()){ network.sleepNode(1,0); }  //Sleeps the node for 1 second or a payload is received
   *
   * Other options:
   * network.sleepNode(0,0);         // Sleep this node for the designated time period, or a payload is received.
   * network.sleepNode(1,255);       // Sleep this node for 1 cycle. Do not wake up until then, even if a payload is received ( no interrupt )
   * @endcode
   * @see setup_watchdog()
   * @param cycles: The node will sleep in cycles of 1s. Using 2 will sleep 2 WDT cycles, 3 sleeps 3WDT cycles...
   * @param interruptPin: The interrupt number to use (0,1) for pins two and three on Uno,Nano. More available on Mega etc.
   * @return True if sleepNode completed normally, after the specified number of cycles. False if sleep was interrupted
   */
  bool sleepNode( unsigned int cycles, int interruptPin )
  {
    return RF24N_sleepNode( cycles, interruptPin );   
  };


  /**
   * This node's parent address
   *
   * @return This node's parent address, or -1 if this is the base
   */
  uint16_t parent() const
  {
    return RF24N_parent();   
  };
  
   /**
   * Provided a node address and a pipe number, will return the RF24Network address of that child pipe for that node
   */
  uint16_t addressOfPipe( uint16_t node,uint8_t pipeNo )
  {
    return RF24N_addressOfPipe(node,pipeNo );   
  };
   
   /**
    * @note Addresses are specified in octal: 011, 034
    * @return True if a supplied address is valid
	*/
  bool is_valid_address( uint16_t node )
  {
    return RF24N_is_valid_address( node );   
  };

 /**@}*/
  /**
   * @name Deprecated
   *
   *  Maintained for backwards compatibility
   */
  /**@{*/  
  
  /**
   * Bring up the network on a specific radio frequency/channel.
   * @note Use radio.setChannel() to configure the radio channel
   *
   * **Example 1:** Begin on channel 90 with address 0 (master node)
   * @code
   * network.begin(90,0);
   * @endcode
   * **Example 2:** Begin on channel 90 with address 01 (child of master)
   * @code
   * network.begin(90,01);
   * @endcode
   * **Example 3:** Begin on channel 90 with address 011 (child of 01, grandchild of master)
   * @code
   * network.begin(90,011);
   * @endcode   
   *
   * @param _channel The RF channel to operate on
   * @param _node_address The logical address of this node
   *
   */
  void begin(uint8_t _channel, uint16_t _node_address )
  {
    RF24N_begin_d(_channel, _node_address );   
  };  
  

};



