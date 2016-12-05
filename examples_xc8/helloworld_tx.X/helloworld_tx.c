/*
 Copyright (C) 2012 James Coliz, Jr. <maniacbug@ymail.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 
 Update 2014 - TMRh20
 */

/**
 * Simplest possible example of using RF24Network 
 *
 * TRANSMITTER NODE
 * Every 2 seconds, send a payload to the receiver node.
 */

#include <RF24Network_cg.h>
#include <RF24_cg.h>
#include "serial.h"

//RF24 radio;                    // nRF24L01(+) radio attached using Getting Started board 

//RF24Network network;          // Network uses that radio

const uint16_t this_node = 01;        // Address of our node in Octal format
const uint16_t other_node = 00;       // Address of the other node in Octal format

const unsigned long interval = 2000; //ms  // How often to send 'hello world to the other unit

unsigned long last_sent;             // When did we last send?
unsigned long packets_sent;          // How many have we sent already


typedef struct  {                  // Structure of our payload
   uint32_t  ms;
   uint32_t  counter;
}payload_t;

void setup(void)
{
  RF24_init(36,35);
  RF24N_init();
  
  Serial_begin(57600);
  Serial_println("RF24Network/examples/helloworld_tx/");
 
  RF24_begin();
  RF24N_begin_d(/*channel*/ 90, /*node address*/ this_node);
}

void loop() {
  unsigned long now ;
  RF24N_update();                          // Check the network regularly

  
  now = millis();              // If it's time to send a message, send it!
  if ( now - last_sent >= interval  )
  {
    payload_t payload;
    uint8_t ok;
    RF24NetworkHeader header;
        
    last_sent = now;

    Serial_print("Sending...");

    payload.ms=  millis();
    payload.counter=packets_sent++;

    RF24NH_init(&header,/*to node*/ other_node,0);
    ok = RF24N_write_m(&header,&payload,sizeof(payload));
    if (ok)
      Serial_println("ok.");
    else
      Serial_println("failed.");
  }
}


