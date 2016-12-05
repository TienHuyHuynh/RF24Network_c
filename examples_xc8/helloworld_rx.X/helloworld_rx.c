/*
 Copyright (C) 2012 James Coliz, Jr. <maniacbug@ymail.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 
 Update 2014 - TMRh20
 */

/**
 * Simplest possible example of using RF24Network,
 *
 * RECEIVER NODE
 * Listens for messages from the transmitter and prints them out.
 */



#include <RF24Network_cg.h>
#include <RF24_cg.h>
#include "serial.h"

//RF24 radio;                // nRF24L01(+) radio attached using Getting Started board 

//RF24Network network;      // Network uses that radio

const uint16_t this_node = 00;    // Address of our node in Octal format ( 04,031, etc)
const uint16_t other_node = 01;   // Address of the other node in Octal format

typedef struct  {                 // Structure of our payload
  uint32_t  ms;
  uint32_t  counter;
}payload_t;


void setup(void)
{
  RF24_init(36,35);
  RF24N_init();
  
  Serial_begin(57600);
  Serial_println("RF24Network/examples/helloworld_rx/");
 
  //SPI.begin();
  RF24_begin();
  RF24N_begin_d(/*channel*/ 90, /*node address*/ this_node);
}

void loop(void){
  
  RF24N_update();                  // Check the network regularly

  
  while ( RF24N_available() ) {     // Is there anything ready for us?
    
    RF24NetworkHeader header;        // If so, grab it and print it out
    payload_t payload;
    RF24N_read( &header,&payload,sizeof(payload));
    Serial_print("Received packet #");
    Serial_print(itoa_(payload.counter));
    Serial_print(" at ");
    Serial_println(itoa_(payload.ms));
  }
}

