/*
 Update 2014 - TMRh20
 */

/**
 * Simplest possible example of using RF24Network,
 *
 * RECEIVER NODE
 * Listens for messages from the transmitter and prints them out.
 */

#include <RF24_c/RF24_c.h>
#include <RF24Network_c/RF24Network_c.h>
#include <iostream>
#include <ctime>
#include <stdio.h>
#include <time.h>


/**
 * g++ -L/usr/lib main.cc -I/usr/include -o main -lrrd
 **/
//using namespace std;

// CE Pin, CSN Pin, SPI Speed

// Setup for GPIO 22 CE and GPIO 25 CSN with SPI Speed @ 1Mhz
//RF24 radio(RPI_V2_GPIO_P1_22, RPI_V2_GPIO_P1_18, BCM2835_SPI_SPEED_1MHZ);

// Setup for GPIO 22 CE and CE0 CSN with SPI Speed @ 4Mhz
//RF24 radio(RPI_V2_GPIO_P1_15, BCM2835_SPI_CS0, BCM2835_SPI_SPEED_4MHZ); 

// Setup for GPIO 22 CE and CE1 CSN with SPI Speed @ 8Mhz
RF24 radio;

RF24Network network;

// Address of our node in Octal format
const uint16_t this_node = 00;

// Address of the other node in Octal format (01,021, etc)
const uint16_t other_node = 01;

const unsigned long interval = 2000; //ms  // How often to send 'hello world to the other unit

unsigned long last_sent;             // When did we last send?
unsigned long packets_sent;          // How many have we sent already


struct payload_t {                  // Structure of our payload
  uint32_t ms;
  uint32_t counter;
};

int main(int argc, char** argv) 
{
	// Refer to RF24.h or nRF24L01 DS for settings

	RF24_init2(&radio,RPI_V2_GPIO_P1_15, BCM2835_SPI_CS0, BCM2835_SPI_SPEED_8MHZ);  

	RF24N_init(&network,&radio);

	RF24_begin(&radio);
	
	delay(5);
	RF24N_begin_d(&network,/*channel*/ 90, /*node address*/ this_node);
	RF24_printDetails(&radio);
	
	while(1)
	{

		  RF24N_update(&network);
  		  while ( RF24N_available(&network) ) {     // Is there anything ready for us?
    			
		 	RF24NetworkHeader header;        // If so, grab it and print it out
   			 payload_t payload;
  			 RF24N_read(&network,&header,&payload,sizeof(payload));
			
			printf("Received payload # %lu at %lu \n",payload.counter,payload.ms);
                  }		  
		 //sleep(2);
		 delay(200);
		 //fclose(pFile);
	}

	return 0;
}

