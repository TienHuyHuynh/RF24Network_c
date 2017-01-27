/*
 Copyright (c) 2016 Luis Claudio Gamboa Lopes <lcgamboa@yahoo.com>
 Copyright (C) 2011 James Coliz, Jr. <maniacbug@ymail.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 */
#include "RF24Network_c_config.h"

 #if defined (RF24_LINUX)
  #include <stdlib.h>
  #include <stdio.h>
  #include <errno.h>
  #include <fcntl.h>
  #include <sys/mman.h>
  #include <string.h>
  #include <sys/time.h>
  #include <time.h>
  #include <unistd.h>
  #include <RF24/RF24.h>
  #include "RF24Network_c.h"
#else  
  #include "RF24.h"
  #include "RF24Network_c.h"
#endif

#if defined (ENABLE_SLEEP_MODE) && !defined (RF24_LINUX) && !defined (__ARDUINO_X86__)
        #include <avr/sleep.h>
	#include <avr/power.h>
	volatile byte sleep_cycles_remaining;
	volatile uint8_t wasInterrupted;
#endif

    
static RF24Network rn;    

void RF24N_pipe_address( uint16_t node, uint8_t pipe, raddr_t * address );
#if defined (RF24NetworkMulticast)
uint16_t RF24N_levelToAddress( uint8_t level );
#endif
uint8_t RF24N_is_valid_address( uint16_t node );

//GLOBAL
static uint16_t next_id=1; /**< The message ID of the next message to be sent (unused)*/

void RF24NH_init(RF24NetworkHeader *rnh, uint16_t _to, unsigned char _type)
{
  rnh->to_node=_to;
  rnh->id=next_id++;
  rnh->type=_type;
}

/******************************************************************/
#if defined (RF24_LINUX) 

  #if !defined (DUAL_HEAD_RADIO)
  void RF24N_init(void)
  #else
  RF24N_RF24Network( RF24& _radio, RF24& _radio1 ): radio(_radio), radio1(_radio1),frame_size(MAX_FRAME_SIZE)
  #endif
{
  int i;
  rn.frame_size= MAX_FRAME_SIZE;    
  rn.txTime=0; 
  rn.networkFlags=0; 
  rn.returnSysMsgs=0; 
  rn.multicastRelay=0;
  
  rn.max_frame_payload_size = MAX_FRAME_SIZE-sizeof(RF24NetworkHeader);
#if defined ENABLE_NETWORK_STATS
  rn.nFails = 0;
  rn.nOK = 0;
#endif
    
  rn.external_queue_c=0;
    
  rn.frame_queue_c=0;
  
  for(i=0;i<256;i++)
    rn.frameFragmentsCache[i].message_size=0;
}
#elif !defined (DUAL_HEAD_RADIO)
void RF24N_init(void)
{
  rn.next_frame= rn.frame_queue; 
  #if !defined ( DISABLE_FRAGMENTATION )
  rn.frag_queue.message_buffer=&rn.frag_queue_message_buffer[0];
  rn.frag_ptr = &rn.frag_queue;
  #endif
  rn.txTime=0; 
  rn.networkFlags=0; 
  rn.returnSysMsgs=0; 
  rn.multicastRelay=0;
#if defined ENABLE_NETWORK_STATS
  rn.nFails = 0;
  rn.nOK = 0;
#endif
  rn.max_frame_payload_size = MAX_FRAME_SIZE-sizeof(RF24NetworkHeader);
}
#else
RF24N_RF24Network( RF24& _radio, RF24& _radio1 ): radio(_radio), radio1(_radio1), next_frame(frame_queue)
{
  #if !defined ( DISABLE_FRAGMENTATION )
  frag_queue.message_buffer=&frag_queue_message_buffer[0];
  frag_ptr = &frag_queue;
  #endif
  txTime=0; networkFlags=0; returnSysMsgs=0; multicastRelay=0;
}
#endif
/******************************************************************/
    

#if defined (RF24_LINUX) 
//map functions

uint16_t mapcount(RF24NetworkFrame * fc, uint16_t key)
{

  if(fc[key].message_size > 0)	
    return 1;
  else
    return 0;
}


void maperase(RF24NetworkFrame * fc, uint16_t key)
{
   fc[key].message_size=0;	
}
//queue functions

void qpush(RF24NetworkFrame * fc,uint16_t * cont, RF24NetworkFrame frame)
{
 fc[(*cont)++]=frame;
};


RF24NetworkFrame qpop(RF24NetworkFrame * fc,uint16_t * cont)
{
 return fc[--(*cont)];
};

RF24NetworkFrame qfront(RF24NetworkFrame * fc,uint16_t * cont)
{
 return fc[(*cont)-1];
};

uint16_t qempty(RF24NetworkFrame * fc,uint16_t * cont)
{
  return !(*cont);
};

uint16_t qsize(RF24NetworkFrame * fc,uint16_t * cont)
{
  return (*cont);
};

#endif


/******************************************************************/
void RF24N_begin_d(uint8_t _channel, uint16_t _node_address )
{
  uint8_t i;  
  uint8_t retryVar;
  
  if (! RF24N_is_valid_address(_node_address) )
    return;

  rn.node_address = _node_address;

  if ( ! RF24_isValid() ){
    return;
  }

  // Set up the radio the way we want it to look
  if(_channel != USE_CURRENT_CHANNEL){
    RF24_setChannel(_channel);
  }
  //radio.enableDynamicAck();
  RF24_setAutoAck_p(0,0);
  
  #if defined (ENABLE_DYNAMIC_PAYLOADS)
  RF24_enableDynamicPayloads();
  #endif
  
  // Use different retry periods to reduce data collisions
  retryVar = (((rn.node_address % 6)+1) *2) + 3;
  RF24_setRetries(retryVar, 5); // max about 85ms per attempt
  rn.txTimeout = 25;
  rn.routeTimeout = rn.txTimeout*3; // Adjust for max delay per node within a single chain


#if defined (DUAL_HEAD_RADIO)
  radio1.setChannel(_channel);
  radio1.enableDynamicAck();
  radio1.enableDynamicPayloads();
#endif

  // Setup our address helper cache
  RF24N_setup_address();

  // Open up all listening pipes
  i = 6;
  while (i--){
    raddr_t addr[5];
    RF24N_pipe_address(_node_address,i,addr);	
    RF24_openReadingPipe_d(i,addr);	
  }
  RF24_startListening();

}

/******************************************************************/

#if defined ENABLE_NETWORK_STATS
void RF24N_failures(uint32_t *_fails, uint32_t *_ok){
	*_fails = nFails;
	*_ok = nOK;
}
#endif

/******************************************************************/

uint8_t RF24N_update()
{
  // if there is data ready
  uint8_t pipe_num;
  uint8_t returnVal = 0;
  
  // If bypass is enabled, continue although incoming user data may be dropped
  // Allows system payloads to be read while user cache is full
  // Incoming Hold prevents data from being read from the radio, preventing incoming payloads from being acked
  
  #if !defined (RF24_LINUX)
  if(!(rn.networkFlags & FLAG_BYPASS_HOLDS)){
    if( (rn.networkFlags & FLAG_HOLD_INCOMING) || (rn.next_frame-rn.frame_queue) + 34 > MAIN_BUFFER_SIZE ){
      if(!RF24N_available()){
        rn.networkFlags &= ~FLAG_HOLD_INCOMING;
      }else{
        return 0;
      }
    }
  }
  #endif
  
  while ( RF24_isValid() && RF24_available_p(&pipe_num) ){
    RF24NetworkHeader *header;
    
    #if defined (ENABLE_DYNAMIC_PAYLOADS)
      if( (rn.frame_size = RF24_getDynamicPayloadSize() ) < sizeof(RF24NetworkHeader)){
	    delay(10);
		continue;
	  }
    #else
      frame_size=32;
    #endif
      // Dump the payloads until we've gotten everything
      // Fetch the payload, and see if this was the last one.
	  RF24_read(rn.frame_buffer, rn.frame_size );
	  
      // Read the beginning of the frame as the header
	  header = (RF24NetworkHeader*)(rn.frame_buffer);
	  
	  #if defined (RF24_LINUX)
	    IF_SERIAL_DEBUG(printf_P("%u: MAC Received on %u %s\n\r",millis(),pipe_num,RF24NH_toString(header)));
        if (rn.frame_size) {
          IF_SERIAL_DEBUG_FRAGMENTATION_L2(printf("%u: FRG Rcv frame size %i\n",millis(),rn.frame_size););
          IF_SERIAL_DEBUG_FRAGMENTATION_L2(printf("%u: FRG Rcv frame ",millis()); const char* charPtr = (const char*)(rn.frame_buffer); for (uint16_t i = 0; i < frame_size; i++) { printf("%02X ", charPtr[i]); }; printf("\n\r"));
        }
	  #else
      IF_SERIAL_DEBUG(printf_P(PSTR("%lu: MAC Received on %u %s\n\r"),millis(),pipe_num,RF24NH_toString(&header)));
      IF_SERIAL_DEBUG(const uint16_t* i = (const uint16_t*)(rn.frame_buffer + sizeof(RF24NetworkHeader));printf_P(PSTR("%lu: NET message %04x\n\r"),millis(),*i));
      #endif
	  
      // Throw it away if it's not a valid address
      if ( !RF24N_is_valid_address( header->to_node) ){
		continue;
	  }
	  
	  returnVal = header->type;

	  // Is this for us?
      if ( header->to_node == rn.node_address   ){
			
			if(header->type == NETWORK_PING){
			   continue;
			}
		    if(header->type == NETWORK_ADDR_RESPONSE ){	
			    uint16_t requester = 04444;
				if(requester != rn.node_address){
					header->to_node = requester;
					RF24N_write(header->to_node,USER_TX_TO_PHYSICAL_ADDRESS);
					delay(10);
                    RF24N_write(header->to_node,USER_TX_TO_PHYSICAL_ADDRESS);
					//printf("Fwd add response to 0%o\n",requester);
					continue;
				}
			}
			if(header->type == NETWORK_REQ_ADDRESS && rn.node_address){
				//printf("Fwd add req to 0\n");
				header->from_node = rn.node_address;
				header->to_node = 0;
				RF24N_write(header->to_node,TX_NORMAL);
				continue;
			}
			
			if( (rn.returnSysMsgs && header->type > 127) || header->type == NETWORK_ACK ){	
				IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%lu MAC: System payload rcvd %d\n"),millis(),returnVal); );
				//if( (header->type < 148 || header->type > 150) && header->type != NETWORK_MORE_FRAGMENTS_NACK && header->type != EXTERNAL_DATA_TYPE && header->type!= NETWORK_LAST_FRAGMENT){
				if( header->type != NETWORK_FIRST_FRAGMENT && header->type != NETWORK_MORE_FRAGMENTS && header->type != NETWORK_MORE_FRAGMENTS_NACK && header->type != EXTERNAL_DATA_TYPE && header->type!= NETWORK_LAST_FRAGMENT){
					return returnVal;
				}
			}

			if( RF24N_enqueue(header) == 2 ){ //External data received			
				#if defined (SERIAL_DEBUG_MINIMAL)
				  printf("ret ext\n");
				#endif
				return EXTERNAL_DATA_TYPE;				
			}
	  }else{	  

	  #if defined	(RF24NetworkMulticast)	

			if( header->to_node == 0100){
			    uint8_t val;

				if(header->type == NETWORK_POLL  ){
                    if( !(rn.networkFlags & FLAG_NO_POLL) && rn.node_address != 04444 ){
					  header->to_node = header->from_node;
					  header->from_node = rn.node_address;			
					  delay(rn.parent_pipe);
                      RF24N_write(header->to_node,USER_TX_TO_PHYSICAL_ADDRESS);                      
                    }
					continue;
				}
				val = RF24N_enqueue(header);
				
				if(rn.multicastRelay){					
					IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%u MAC: FWD multicast frame from 0%o to level %u\n"),millis(),header->from_node,multicast_level+1); );
					RF24N_write(RF24N_levelToAddress(rn.multicast_level)<<3,4);
				}
				if( val == 2 ){ //External data received			
				  //Serial.println("ret ext multicast");
					return EXTERNAL_DATA_TYPE;
				}

			}else{
				RF24N_write(header->to_node,1);	//Send it on, indicate it is a routed payload
			}
		#else
		RF24N_write(header->to_node,1);	//Send it on, indicate it is a routed payload
		#endif
	  }
	  
  }
  return returnVal;
}


#if defined (RF24_LINUX)
/******************************************************************/

uint8_t RF24N_enqueue( RF24NetworkHeader* header) {
  uint8_t result = 0;
  
  RF24NetworkFrame frame;
  frame.header=*header;
  frame.message_size=rn.frame_size-sizeof(RF24NetworkHeader);        
  memcpy(frame.message_buffer,rn.frame_buffer+sizeof(RF24NetworkHeader),frame.message_size);
  

  uint8_t isFragment = ( frame.header.type == NETWORK_FIRST_FRAGMENT || frame.header.type == NETWORK_MORE_FRAGMENTS || frame.header.type == NETWORK_LAST_FRAGMENT || frame.header.type == NETWORK_MORE_FRAGMENTS_NACK);
  
  
  
  // This is sent to itself
  if (frame.header.from_node == rn.node_address) {    
    if (isFragment) {
      printf("Cannot enqueue multi-payload frames to self\n");
      result = 0;
    }else{
    qpush(rn.frame_queue,&rn.frame_queue_c,frame);
    result = 1;
	}
  }else  
  if (isFragment)
  {
    //The received frame contains the a fragmented payload
    //Set the more fragments flag to indicate a fragmented frame
    IF_SERIAL_DEBUG_FRAGMENTATION_L2(printf("%u: FRG Payload type %d of size %i Bytes with fragmentID '%i' received.\n\r",millis(),frame.header.type,frame.message_size,frame.header.reserved););
    //Append payload
    result = RF24N_appendFragmentToFrame( frame);
   
    //The header.reserved contains the actual header.type on the last fragment 
    if ( result && frame.header.type == NETWORK_LAST_FRAGMENT) {
	  IF_SERIAL_DEBUG_FRAGMENTATION(printf("%u: FRG Last fragment received. \n",millis() ););
      IF_SERIAL_DEBUG(printf_P(PSTR("%u: NET Enqueue assembled frame @%x "),millis(),qsize(rn.frame_queue,&rn.frame_queue_c)));

	  RF24NetworkFrame *f = &rn.frameFragmentsCache[frame.header.from_node];
	  
	  
	  result=f->header.type == EXTERNAL_DATA_TYPE ? 2 : 1;
	  
	  //Load external payloads into a separate queue on linux
	  if(result == 2){
	    qpush(rn.external_queue,&rn.external_queue_c, rn.frameFragmentsCache[frame.header.from_node] );
	  }else{
            qpush(rn.frame_queue,&rn.frame_queue_c, rn.frameFragmentsCache[frame.header.from_node] );
	  }
        maperase(rn.frameFragmentsCache, frame.header.from_node );
	}

  }else{//  if (frame.header.type <= MAX_USER_DEFINED_HEADER_TYPE) {
    //This is not a fragmented payload but a whole frame.

    IF_SERIAL_DEBUG(printf_P(PSTR("%u: NET Enqueue @%x "),millis(),qsize(rn.frame_queue,&rn.frame_queue_c)));
    // Copy the current frame into the frame queue
	result=frame.header.type == EXTERNAL_DATA_TYPE ? 2 : 1;
    //Load external payloads into a separate queue on linux
	if(result == 2){
	  qpush(rn.external_queue,&rn.external_queue_c, frame );
	}else{
          qpush(rn.frame_queue,&rn.frame_queue_c, frame );
	}
	

  }/* else {
    //Undefined/Unknown header.type received. Drop frame!
    IF_SERIAL_DEBUG_MINIMAL( printf("%u: FRG Received unknown or system header type %d with fragment id %d\n",millis(),frame.header.type, frame.header.reserved); );
    //The frame is not explicitly dropped, but the given object is ignored.
    //FIXME: does this causes problems with memory management?
  }*/

  if (result) {
    //IF_SERIAL_DEBUG(printf("ok\n\r"));
  } else {
    IF_SERIAL_DEBUG(printf("failed\n\r"));
  }

  return result;
}

/******************************************************************/

uint8_t RF24N_appendFragmentToFrame( RF24NetworkFrame frame) {

  // This is the first of 2 or more fragments.
  if (frame.header.type == NETWORK_FIRST_FRAGMENT){
      if( mapcount(rn.frameFragmentsCache, frame.header.from_node) != 0 ){
	    RF24NetworkFrame *f = &rn.frameFragmentsCache[frame.header.from_node];
	    //Already rcvd first frag
	    if (f->header.id == frame.header.id){
	      return 0;
		}
	  }
	  if(frame.header.reserved > (MAX_PAYLOAD_SIZE /24) + 1 ){
		IF_SERIAL_DEBUG_FRAGMENTATION( printf("%u FRG Too many fragments in payload %u, dropping...",millis(),frame.header.reserved); );
		// If there are more fragments than we can possibly handle, return
		return 0;
	  }
	  rn.frameFragmentsCache[frame.header.from_node]=frame;
	  return 1;
  }else
  
  if ( frame.header.type == NETWORK_MORE_FRAGMENTS || frame.header.type == NETWORK_MORE_FRAGMENTS_NACK ){
	
	if( mapcount(rn.frameFragmentsCache,frame.header.from_node) < 1 ){
	  return 0;
    }	
	RF24NetworkFrame *f = &rn.frameFragmentsCache[frame.header.from_node];	
	if( f->header.reserved - 1 == frame.header.reserved && f->header.id == frame.header.id){	
      // Cache the fragment
      memcpy(f->message_buffer+f->message_size, frame.message_buffer, frame.message_size);
	  f->message_size += frame.message_size;  //Increment message size
      f->header = frame.header; //Update header
	  return 1;
	  
    } else {
      IF_SERIAL_DEBUG_FRAGMENTATION(printf("%u: FRG Dropping fragment for frame with header id:%d, out of order fragment(s).\n",millis(),frame.header.id););
	  return 0;
    }

  }else
  if ( frame.header.type == NETWORK_LAST_FRAGMENT ){
  
    //We have received the last fragment
	if(mapcount(rn.frameFragmentsCache,frame.header.from_node) < 1){
		return 0;
	}	
	//Create pointer to the cached frame
    RF24NetworkFrame *f = &rn.frameFragmentsCache[frame.header.from_node];

	if( f->message_size + frame.message_size > MAX_PAYLOAD_SIZE){
		IF_SERIAL_DEBUG_FRAGMENTATION( printf("%u FRG Frame of size %u plus enqueued frame of size %u exceeds max payload size \n",millis(),frame.message_size,f->message_size); );
		return 0;
	}
    //Error checking for missed fragments and payload size
    if ( f->header.reserved-1 != 1 || f->header.id != frame.header.id) {
        IF_SERIAL_DEBUG_FRAGMENTATION(printf("%u: FRG Duplicate or out of sequence frame %d, expected %d. Cleared.\n",millis(),frame.header.reserved,f->header.reserved););
            //frameFragmentsCache.erase( std::make_pair(frame.header.id,frame.header.from_node) );
        return 0;
    }
	//The user specified header.type is sent with the last fragment in the reserved field
    frame.header.type = frame.header.reserved;
    frame.header.reserved = 1;

    //Append the received fragment to the cached frame
    memcpy(f->message_buffer+f->message_size, frame.message_buffer, frame.message_size);
    f->message_size += frame.message_size;  //Increment message size
    f->header = frame.header; //Update header	
	return 1;
  }
  return 0;
}

/******************************************************************/
/******************************************************************/

#else // Not defined RF24_Linux:

/******************************************************************/
/******************************************************************/

uint8_t RF24N_enqueue( RF24NetworkHeader* header)
{
  uint8_t result = 0;
  uint16_t message_size = rn.frame_size - sizeof(RF24NetworkHeader);
  uint8_t isFragment;
  
  IF_SERIAL_DEBUG(printf_P(PSTR("%lu: NET Enqueue @%x "),millis(),rn.next_frame-rn.frame_queue));
  
#if !defined ( DISABLE_FRAGMENTATION ) 

  isFragment = header->type == NETWORK_FIRST_FRAGMENT || header->type == NETWORK_MORE_FRAGMENTS || header->type == NETWORK_LAST_FRAGMENT || header->type == NETWORK_MORE_FRAGMENTS_NACK ;

  if(isFragment){

	if(header->type == NETWORK_FIRST_FRAGMENT){
	    // Drop frames exceeding max size and duplicates (MAX_PAYLOAD_SIZE needs to be divisible by 24)
	    if(header->reserved > (MAX_PAYLOAD_SIZE / rn.max_frame_payload_size) ){

  #if defined (SERIAL_DEBUG_FRAGMENTATION) || defined (SERIAL_DEBUG_MINIMAL)
			printf_P(PSTR("Frag frame with %d frags exceeds MAX_PAYLOAD_SIZE or out of sequence\n"),header->reserved);
  #endif
			rn.frag_queue.header.reserved = 0;
			return 0;
		}else
        if(rn.frag_queue.header.id == header->id && rn.frag_queue.header.from_node == header->from_node){
            return 1;
        }
        
        if( (header->reserved * 24) > (MAX_PAYLOAD_SIZE - (rn.next_frame-rn.frame_queue)) ){
          rn.networkFlags |= FLAG_HOLD_INCOMING;
          RF24_stopListening();
        }
  		
		memcpy(&rn.frag_queue,rn.frame_buffer,8);
		memcpy(rn.frag_queue.message_buffer,rn.frame_buffer+sizeof(RF24NetworkHeader),message_size);
		
//IF_SERIAL_DEBUG_FRAGMENTATION( Serial.print(F("queue first, total frags ")); Serial.println(header->reserved); );
		//Store the total size of the stored frame in message_size
	    rn.frag_queue.message_size = message_size;
		--rn.frag_queue.header.reserved;
		  
IF_SERIAL_DEBUG_FRAGMENTATION_L2(  for(int i=0; i<frag_queue.message_size;i++){  Serial.println(frag_queue.message_buffer[i],HEX);  } );
		
		return 1;		

	}else // NETWORK_MORE_FRAGMENTS	
	if(header->type == NETWORK_LAST_FRAGMENT || header->type == NETWORK_MORE_FRAGMENTS || header->type == NETWORK_MORE_FRAGMENTS_NACK){
		
        if(rn.frag_queue.message_size + message_size > MAX_PAYLOAD_SIZE){
          #if defined (SERIAL_DEBUG_FRAGMENTATION) || defined (SERIAL_DEBUG_MINIMAL)
          Serial.print(F("Drop frag ")); Serial.print(header->reserved);          
          Serial.println(F(" Size exceeds max"));
          #endif
          rn.frag_queue.header.reserved=0;
          return 0;
        }
		if(  rn.frag_queue.header.reserved == 0 || (header->type != NETWORK_LAST_FRAGMENT && header->reserved != rn.frag_queue.header.reserved ) || rn.frag_queue.header.id != header->id ){
			#if defined (SERIAL_DEBUG_FRAGMENTATION) || defined (SERIAL_DEBUG_MINIMAL)
			Serial.print(F("Drop frag ")); Serial.print(header->reserved);
			//Serial.print(F(" header id ")); Serial.print(header->id);
			Serial.println(F(" Out of order "));
			#endif
			return 0;
		}
		
		memcpy(rn.frag_queue.message_buffer+rn.frag_queue.message_size,rn.frame_buffer+sizeof(RF24NetworkHeader),message_size);
	    rn.frag_queue.message_size += message_size;
		
		if(header->type != NETWORK_LAST_FRAGMENT){
		  --rn.frag_queue.header.reserved;
		  return 1;
		}
		rn.frag_queue.header.reserved = 0;
        rn.frag_queue.header.type = header->reserved;
		
IF_SERIAL_DEBUG_FRAGMENTATION( printf_P(PSTR("fq 3: %d\n"),frag_queue.message_size); );
IF_SERIAL_DEBUG_FRAGMENTATION_L2(for(int i=0; i< frag_queue.message_size;i++){ Serial.println(frag_queue.message_buffer[i],HEX); }  );		
	
		//Frame assembly complete, copy to main buffer if OK		
        if(rn.frag_queue.header.type == EXTERNAL_DATA_TYPE){
           return 2;
        }
        #if defined (DISABLE_USER_PAYLOADS)
		  return 0;
		#endif
            
        if(MAX_PAYLOAD_SIZE - (rn.next_frame-rn.frame_queue) >= rn.frag_queue.message_size){
          uint8_t padding;
          memcpy(rn.next_frame,&rn.frag_queue,10);
          memcpy(rn.next_frame+10,rn.frag_queue.message_buffer,rn.frag_queue.message_size);
          rn.next_frame += (10+rn.frag_queue.message_size);
          #if !defined(ARDUINO_ARCH_AVR)
          if((padding = (rn.frag_queue.message_size+10)%4)){
            rn.next_frame += 4 - padding;
          }
          #endif
          IF_SERIAL_DEBUG_FRAGMENTATION( printf_P(PSTR("enq size %d\n"),frag_queue.message_size); );
		  return 1;
		}else{
          RF24_stopListening();
          rn.networkFlags |= FLAG_HOLD_INCOMING;          
        }
        IF_SERIAL_DEBUG_FRAGMENTATION( printf_P(PSTR("Drop frag payload, queue full\n")); );
        return 0;
	}//If more or last fragments

  }else //else is not a fragment
  // Copy the current frame into the frame queue
	if(header->type == EXTERNAL_DATA_TYPE){
		memcpy(&rn.frag_queue,rn.frame_buffer,8);
		rn.frag_queue.message_buffer = rn.frame_buffer+sizeof(RF24NetworkHeader);
		rn.frag_queue.message_size = message_size;
		return 2;
	}
#endif // End fragmentation enabled

#if defined (DISABLE_USER_PAYLOADS)
	return 0;
 }
#else
  if(message_size + (rn.next_frame-rn.frame_queue) <= MAIN_BUFFER_SIZE){
	uint8_t padding;
        memcpy(rn.next_frame,rn.frame_buffer,8);
        memcpy(rn.next_frame+8,&message_size,2);
	memcpy(rn.next_frame+10,rn.frame_buffer+8,message_size);
    
	//IF_SERIAL_DEBUG_FRAGMENTATION( for(int i=0; i<message_size;i++){ Serial.print(next_frame[i],HEX); Serial.print(" : "); } Serial.println(""); );
    
	rn.next_frame += (message_size + 10);
    #if !defined(ARDUINO_ARCH_AVR)
    if((padding = (message_size+10)%4)){
      rn.next_frame += 4 - padding;
    }
    #endif
  //IF_SERIAL_DEBUG_FRAGMENTATION( Serial.print("Enq "); Serial.println(next_frame-frame_queue); );//printf_P(PSTR("enq %d\n"),next_frame-frame_queue); );
  
    result = 1;
  }else{
    result = 0;
    IF_SERIAL_DEBUG(printf_P(PSTR("NET **Drop Payload** Buffer Full")));
  }
  return result;
}
#endif //USER_PAYLOADS_ENABLED

#endif //End not defined RF24_Linux
/******************************************************************/

uint8_t RF24N_available(void)
{
#if defined (RF24_LINUX)
  return (!qempty(rn.frame_queue,&rn.frame_queue_c));
#else
  // Are there frames on the queue for us?
  return (rn.next_frame > rn.frame_queue);
#endif
}

/******************************************************************/

uint16_t RF24N_parent(void) 
{
  if ( rn.node_address == 0 )
    return -1;
  else
    return rn.parent_node;
}

/******************************************************************/
/*uint8_t RF24N_peekData(){
		
		return frame_queue[0];
}*/

uint16_t RF24N_peek( RF24NetworkHeader* header)
{
  if ( RF24N_available() )
  {
#if defined (RF24_LINUX)
    RF24NetworkFrame frame = qfront(rn.frame_queue,&rn.frame_queue_c);
    memcpy(header,&frame.header,sizeof(RF24NetworkHeader));
    return frame.message_size;
  #else
    uint16_t msg_size;
	RF24NetworkFrame *frame = (RF24NetworkFrame*)(rn.frame_queue);
	memcpy(header,&frame->header,sizeof(RF24NetworkHeader));
    memcpy(&msg_size,rn.frame_queue+8,2);
    return msg_size;
  #endif
  }
  return 0;
}

/******************************************************************/

uint16_t RF24N_read( RF24NetworkHeader* header,void* message, uint16_t maxlen)
{
  uint16_t bufsize = 0;

 #if defined (RF24_LINUX)
   if ( RF24N_available() ) {
    RF24NetworkFrame frame = qfront(rn.frame_queue,&rn.frame_queue_c);

    // How much buffer size should we actually copy?
    bufsize = rf24_min(frame.message_size,maxlen);
    memcpy(header,&(frame.header),sizeof(RF24NetworkHeader));
    memcpy(message,frame.message_buffer,bufsize);

    IF_SERIAL_DEBUG(printf("%u: FRG message size %i\n",millis(),frame.message_size););
    IF_SERIAL_DEBUG(uint16_t i;printf("%u: FRG message ",millis()); const char* charPtr = (const char*)(message); for (i = 0; i < bufsize; i++) { printf("%02X ", charPtr[i]); }; printf("\n\r"));	
	
    IF_SERIAL_DEBUG(printf_P(PSTR("%u: NET read %s\n\r"),millis(),RF24NH_toString(header)));

    qpop(rn.frame_queue,&rn.frame_queue_c);
  }
#else  
  if ( RF24N_available() )
  {
    uint8_t padding;
    
	memcpy(header,rn.frame_queue,8);
    memcpy(&bufsize,rn.frame_queue+8,2);

    if (maxlen > 0)
    {		
		maxlen = rf24_min(maxlen,bufsize);
		memcpy(message,rn.frame_queue+10,maxlen);
	    IF_SERIAL_DEBUG(printf("%lu: NET message size %d\n",millis(),bufsize););

	
	IF_SERIAL_DEBUG( uint16_t len = maxlen; printf_P(PSTR("%lu: NET r message "),millis());const uint8_t* charPtr = (const uint8_t*)(message);while(len--){ printf("%02x ",charPtr[len]);} printf_P(PSTR("\n\r") ) );      
	  
    }
	rn.next_frame-=bufsize+10;
    padding = 0;
    #if !defined(ARDUINO_ARCH_AVR)
    if( (padding = (bufsize+10)%4) ){
      padding = 4-padding;
      rn.next_frame -= padding;
    }
    #endif
    memmove(rn.frame_queue,rn.frame_queue+bufsize+10+padding,sizeof(rn.frame_queue)- bufsize);
	//IF_SERIAL_DEBUG(printf_P(PSTR("%lu: NET Received %s\n\r"),millis(),header.toString()));
  }
#endif
  return bufsize;
}


#if defined RF24NetworkMulticast
/******************************************************************/
uint8_t RF24N_multicast(RF24NetworkHeader* header,const void* message, uint16_t len, uint8_t level){
	// Fill out the header
  header->to_node = 0100;
  header->from_node = rn.node_address;
  return RF24N_write_(header, message, len, RF24N_levelToAddress(level));
}
#endif

/******************************************************************/
uint8_t RF24N_write_m(RF24NetworkHeader* header,const void* message, uint16_t len){    
	return RF24N_write_(header,message,len,070);
}
/******************************************************************/
uint8_t RF24N_write_( RF24NetworkHeader* header,const void* message, uint16_t len, uint16_t writeDirect){
   uint8_t fragment_id; 
   uint8_t msgCount;
   uint8_t retriesPerFrag;
   uint8_t type;
   uint8_t ok;
  
    //Allows time for requests (RF24Mesh) to get through between failed writes on busy nodes
    while(millis()-rn.txTime < 25){ if(RF24N_update() > 127){break;} }
	delayMicroseconds(200);
    

#if defined (DISABLE_FRAGMENTATION)
    rn.frame_size = rf24_min(len+sizeof(RF24NetworkHeader),MAX_FRAME_SIZE);
	return RF24N__write(header,message,rf24_min(len,rn.max_frame_payload_size),writeDirect);
#else  
    
  if(len <= rn.max_frame_payload_size){
    //Normal Write (Un-Fragmented)
	rn.frame_size = len + sizeof(RF24NetworkHeader);
    if(RF24N__write(header,message,len,writeDirect)){
      return 1;
    }
    rn.txTime = millis();
    return 0;
  }
  //Check payload size
  if (len > MAX_PAYLOAD_SIZE) {
    IF_SERIAL_DEBUG(printf("%u: NET write message failed. Given 'len' %d is bigger than the MAX Payload size %i\n\r",millis(),len,MAX_PAYLOAD_SIZE););
    return 0;
  }

  //Divide the message payload into chunks of max_frame_payload_size
  fragment_id = (len % rn.max_frame_payload_size != 0) + ((len ) / rn.max_frame_payload_size);  //the number of fragments to send = ceil(len/max_frame_payload_size)

  msgCount = 0;

  IF_SERIAL_DEBUG_FRAGMENTATION(printf("%lu: FRG Total message fragments %d\n\r",millis(),fragment_id););
  
  if(header->to_node != 0100){
    rn.networkFlags |= FLAG_FAST_FRAG;
	#if !defined (DUAL_HEAD_RADIO)
	RF24_stopListening();
	#endif
  }

  retriesPerFrag = 0;
  type = header->type;
  ok = 0;
  
  while (fragment_id > 0) {
    uint16_t offset;
    uint16_t fragmentLen;
    
    //Copy and fill out the header
    //RF24NetworkHeader fragmentHeader = header;
   header->reserved = fragment_id;

    if (fragment_id == 1) {
      header->type = NETWORK_LAST_FRAGMENT;  //Set the last fragment flag to indicate the last fragment
      header->reserved = type; //The reserved field is used to transmit the header type
    } else {
      if (msgCount == 0) {
        header->type = NETWORK_FIRST_FRAGMENT;
      }else{
        header->type = NETWORK_MORE_FRAGMENTS; //Set the more fragments flag to indicate a fragmented frame
      }
    }
	
    offset = msgCount*rn.max_frame_payload_size;
	fragmentLen = rf24_min((uint16_t)(len-offset),rn.max_frame_payload_size);

    //Try to send the payload chunk with the copied header
    rn.frame_size = sizeof(RF24NetworkHeader)+fragmentLen;
	ok = RF24N__write(header,((char *)message)+offset,fragmentLen,writeDirect);

	if (!ok) {
	   delay(2);
	   ++retriesPerFrag;

	}else{
	  retriesPerFrag = 0;
	  fragment_id--;
      msgCount++;
	}
	
    //if(writeDirect != 070){ delay(2); } //Delay 2ms between sending multicast payloads
 
	if (!ok && retriesPerFrag >= 3) {
        IF_SERIAL_DEBUG_FRAGMENTATION(printf("%lu: FRG TX with fragmentID '%d' failed after %d fragments. Abort.\n\r",millis(),fragment_id,msgCount););
		break;
    }

	
    //Message was successful sent
    #if defined SERIAL_DEBUG_FRAGMENTATION_L2 
	  printf("%lu: FRG message transmission with fragmentID '%d' sucessfull.\n\r",millis(),fragment_id);
	#endif
     

  }
  header->type = type;
  #if !defined (DUAL_HEAD_RADIO)
  if(rn.networkFlags & FLAG_FAST_FRAG){	
    ok = RF24_txStandBy_t(rn.txTimeout,0);  
    RF24_startListening();
    RF24_setAutoAck_p(0,0);
  }  
  rn.networkFlags &= ~FLAG_FAST_FRAG;
  
  if(!ok){
       return 0;
  }
  #endif
  //int frag_delay = uint8_t(len/48);
  //delay( rf24_min(len/48,20));

  //Return true if all the chunks where sent successfully
 
  IF_SERIAL_DEBUG_FRAGMENTATION(printf("%u: FRG total message fragments sent %i. \n",millis(),msgCount); );
  if(fragment_id > 0){
    rn.txTime = millis();
	return 0;
  }
  return 1;
  
#endif //Fragmentation enabled
}
/******************************************************************/

uint8_t RF24N__write(RF24NetworkHeader * header,const void* message, uint16_t len, uint16_t writeDirect)
{
  // Fill out the header
  header->from_node = rn.node_address;
  
  // Build the full frame to send
  memcpy(rn.frame_buffer,header,sizeof(RF24NetworkHeader));
  
  #if defined (RF24_LINUX)
	IF_SERIAL_DEBUG(printf_P(PSTR("%u: NET Sending %s\n\r"),millis(),RF24NH_toString(header)));
  #else
    IF_SERIAL_DEBUG(printf_P(PSTR("%lu: NET Sending %s\n\r"),millis(),RF24NH_toString(header)));
  #endif
  if (len){
    #if defined (RF24_LINUX)
	memcpy(rn.frame_buffer + sizeof(RF24NetworkHeader),message,rf24_min(rn.frame_size-sizeof(RF24NetworkHeader),len));
    IF_SERIAL_DEBUG(printf("%u: FRG frame size %i\n",millis(),rn.frame_size););
    IF_SERIAL_DEBUG(uint16_t i;printf("%u: FRG frame ",millis()); const char* charPtr = (const char*)(rn.frame_buffer); for ( i = 0; i < rn.frame_size; i++) { printf("%02X ", charPtr[i]); }; printf("\n\r"));
	#else
	
    memcpy(rn.frame_buffer + sizeof(RF24NetworkHeader),message,len);
	
	IF_SERIAL_DEBUG(uint16_t tmpLen = len;printf_P(PSTR("%lu: NET message "),millis());const uint8_t* charPtr = (const uint8_t*)(message);while(tmpLen--){ printf("%02x ",charPtr[tmpLen]);} printf_P(PSTR("\n\r") ) );
    #endif
  }

  // If the user is trying to send it to himself
  /*if ( header.to_node == node_address ){
	#if defined (RF24_LINUX)
	  RF24NetworkFrame frame = RF24NetworkFrame(header,message,rf24_min(MAX_FRAME_SIZE-sizeof(RF24NetworkHeader),len));	
	#else
      RF24NetworkFrame frame(header,len);
    #endif
	// Just queue it in the received queue
    return enqueue(frame);
  }*/
    // Otherwise send it out over the air	
	
	
	if(writeDirect != 070){		
		uint8_t sendType = USER_TX_TO_LOGICAL_ADDRESS; // Payload is multicast to the first node, and routed normally to the next
	    
		if(header->to_node == 0100){
		  sendType = USER_TX_MULTICAST;
		}
		if(header->to_node == writeDirect){
		  sendType = USER_TX_TO_PHYSICAL_ADDRESS; // Payload is multicast to the first node, which is the recipient
		}
		return RF24N_write(writeDirect,sendType);				
	}
	return RF24N_write(header->to_node,TX_NORMAL);
	
}

/******************************************************************/

uint8_t RF24N_write( uint16_t to_node, uint8_t directTo)  // Direct To: 0 = First Payload, standard routing, 1=routed payload, 2=directRoute to host, 3=directRoute to Route
{
  uint8_t ok = 0;
  uint8_t isAckType = 0;
  uint32_t reply_time ;
  logicalToPhysicalStruct conversion;
    
  if(rn.frame_buffer[6] > 64 && rn.frame_buffer[6] < 192 ){ isAckType=1; }
  
  /*if( ( (frame_buffer[7] % 2) && frame_buffer[6] == NETWORK_MORE_FRAGMENTS) ){
	isAckType = 0;
  }*/
  
  // Throw it away if it's not a valid address
  if ( !RF24N_is_valid_address(to_node) )
    return 0;  
  
  //Load info into our conversion structure, and get the converted address info
  conversion.send_node= to_node;
  conversion.send_pipe=directTo;
  conversion.multicast=0;
  RF24N_logicalToPhysicalAddress( &conversion);
  
  #if defined (RF24_LINUX)
  IF_SERIAL_DEBUG(printf_P(PSTR("%u: MAC Sending to 0%o via 0%o on pipe %x\n\r"),millis(),to_node,conversion.send_node,conversion.send_pipe));
  #else
  IF_SERIAL_DEBUG(printf_P(PSTR("%lu: MAC Sending to 0%o via 0%o on pipe %x\n\r"),millis(),to_node,conversion.send_node,conversion.send_pipe));
  #endif
  /**Write it*/
  ok=RF24N_write_to_pipe(conversion.send_node, conversion.send_pipe, conversion.multicast);  	
  
  
    if(!ok){	
    #if defined (RF24_LINUX)
    IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%u: MAC Send fail to 0%o via 0%o on pipe %x\n\r"),millis(),to_node,conversion.send_node,conversion.send_pipe);); 
	}
	#else
	IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%lu: MAC Send fail to 0%o via 0%o on pipe %x\n\r"),millis(),to_node,conversion.send_node,conversion.send_pipe););
	}
	#endif
 
	if( directTo == TX_ROUTED && ok && conversion.send_node == to_node && isAckType){
			
			RF24NetworkHeader* header = (RF24NetworkHeader*)rn.frame_buffer;
			header->type = NETWORK_ACK;				    // Set the payload type to NETWORK_ACK			
			header->to_node = header->from_node;          // Change the 'to' address to the 'from' address			

			conversion.send_node = header->from_node;
			conversion.send_pipe = TX_ROUTED;
			conversion.multicast = 0;
			RF24N_logicalToPhysicalAddress(&conversion);
			
			//Write the data using the resulting physical address
			rn.frame_size = sizeof(RF24NetworkHeader);
			RF24N_write_to_pipe(conversion.send_node, conversion.send_pipe, conversion.multicast);
			
			//dynLen=0;
			#if defined (RF24_LINUX)
				IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%u MAC: Route OK to 0%o ACK sent to 0%o\n"),millis(),to_node,header->from_node); );
			#else
			    IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%lu MAC: Route OK to 0%o ACK sent to 0%o\n"),millis(),to_node,header->from_node); );
			#endif
	}
 


	if( ok && conversion.send_node != to_node && (directTo==0 || directTo==3) && isAckType){
	    #if !defined (DUAL_HEAD_RADIO)
          // Now, continue listening
		  if(rn.networkFlags & FLAG_FAST_FRAG){
			 RF24_txStandBy_t(rn.txTimeout,0);
             rn.networkFlags &= ~FLAG_FAST_FRAG;
             RF24_setAutoAck_p(0,0); 
		  }
          RF24_startListening();
        #endif
		reply_time = millis(); 

		while( RF24N_update() != NETWORK_ACK){
			#if defined (RF24_LINUX)
            delayMicroseconds(900);
            #endif
			if(millis() - reply_time > rn.routeTimeout){
				#if defined (RF24_LINUX)
				  IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%u: MAC Network ACK fail from 0%o via 0%o on pipe %x\n\r"),millis(),to_node,conversion.send_node,conversion.send_pipe); );
				#else
				  IF_SERIAL_DEBUG_ROUTING( printf_P(PSTR("%lu: MAC Network ACK fail from 0%o via 0%o on pipe %x\n\r"),millis(),to_node,conversion.send_node,conversion.send_pipe); );
				#endif
				ok=0;
				break;					
			}
		}
    }
    if( !(rn.networkFlags & FLAG_FAST_FRAG) ){
	   #if !defined (DUAL_HEAD_RADIO)
         // Now, continue listening
         RF24_startListening();
       #endif	
	}

#if defined ENABLE_NETWORK_STATS
  if(ok == true){
			++nOK;
  }else{	++nFails;
  }
#endif
  return ok;
}

/******************************************************************/

	// Provided the to_node and directTo option, it will return the resulting node and pipe
uint8_t RF24N_logicalToPhysicalAddress( logicalToPhysicalStruct *conversionInfo){

  //Create pointers so this makes sense.. kind of
  //We take in the to_node(logical) now, at the end of the function, output the send_node(physical) address, etc.
  //back to the original memory address that held the logical information.
  uint16_t *to_node = &conversionInfo->send_node;
  uint8_t *directTo = &conversionInfo->send_pipe;
  uint8_t *multicast = &conversionInfo->multicast;    
  
  // Where do we send this?  By default, to our parent
  uint16_t pre_conversion_send_node = rn.parent_node; 

  // On which pipe
  uint8_t pre_conversion_send_pipe = rn.parent_pipe;
  
 if(*directTo > TX_ROUTED ){    
	pre_conversion_send_node = *to_node;
	*multicast = 1;
	//if(*directTo == USER_TX_MULTICAST || *directTo == USER_TX_TO_PHYSICAL_ADDRESS){
		pre_conversion_send_pipe=0;
	//}	
  }     
  // If the node is a direct child,
  else
  if ( RF24N_is_direct_child(*to_node) )
  {   
    // Send directly
    pre_conversion_send_node = *to_node;
    // To its listening pipe
    pre_conversion_send_pipe = 5;
  }
  // If the node is a child of a child
  // talk on our child's listening pipe,
  // and let the direct child relay it.
  else if ( RF24N_is_descendant(*to_node) )
  {
    pre_conversion_send_node = RF24N_direct_child_route_to(*to_node);
    pre_conversion_send_pipe = 5;
  }
  
  *to_node = pre_conversion_send_node;
  *directTo = pre_conversion_send_pipe;
  
  return 1;
  
}

/********************************************************/


uint8_t RF24N_write_to_pipe( uint16_t node, uint8_t pipe, uint8_t multicast )
{
  uint8_t ok = 0;
  raddr_t out_pipe[5];
  RF24N_pipe_address( node, pipe, out_pipe);
  
  #if !defined (DUAL_HEAD_RADIO)
  // Open the correct pipe for writing.
  // First, stop listening so we can talk

  if(!(rn.networkFlags & FLAG_FAST_FRAG)){
    RF24_stopListening();
  }
  
  if(multicast){ RF24_setAutoAck_p(0,0);}else{RF24_setAutoAck_p(0,1);}
  
  RF24_openWritingPipe_d(out_pipe);

  ok = RF24_writeFast_m(rn.frame_buffer, rn.frame_size,0);
  
  if(!(rn.networkFlags & FLAG_FAST_FRAG)){
    ok = RF24_txStandBy_t(rn.txTimeout,0);
    RF24_setAutoAck_p(0,0);
  }
  
#else
  radio1.openWritingPipe(out_pipe);
  radio1.writeFast(frame_buffer, frame_size);
  ok = radio1.txStandBy(txTimeout,multicast);

#endif

/*  #if defined (__arm__) || defined (RF24_LINUX)
  IF_SERIAL_DEBUG(printf_P(PSTR("%u: MAC Sent on %x %s\n\r"),millis(),(uint32_t)out_pipe,ok?PSTR("ok"):PSTR("failed")));
  #else
  IF_SERIAL_DEBUG(printf_P(PSTR("%lu: MAC Sent on %lx %S\n\r"),millis(),(uint32_t)out_pipe,ok?PSTR("ok"):PSTR("failed")));
  #endif
*/  
  return ok;
}

/******************************************************************/
#if !defined (MINIMAL)
const char* RF24NH_toString(RF24NetworkHeader *rnh)
{
  static char buffer[45];
  //snprintf_P(buffer,sizeof(buffer),PSTR("id %04x from 0%o to 0%o type %c"),id,from_node,to_node,type);
  sprintf_P(buffer,PSTR("id %u from 0%o to 0%o type %d"),rnh->id,rnh->from_node,rnh->to_node,rnh->type);
  return buffer;
}
#endif
/******************************************************************/

uint8_t RF24N_is_direct_child( uint16_t node )
{
  uint8_t result = 0;

  // A direct child of ours has the same low numbers as us, and only
  // one higher number.
  //
  // e.g. node 0234 is a direct child of 034, and node 01234 is a
  // descendant but not a direct child

  // First, is it even a descendant?
  if ( RF24N_is_descendant(node) )
  {
    // Does it only have ONE more level than us?
    uint16_t child_node_mask = ( ~ rn.node_mask ) << 3;
    result = ( node & child_node_mask ) == 0 ;
  }
  return result;
}

/******************************************************************/

uint8_t RF24N_is_descendant( uint16_t node )
{
  return ( node & rn.node_mask ) == rn.node_address;
}

/******************************************************************/

void RF24N_setup_address(void)
{
  // First, establish the node_mask
  uint16_t node_mask_check = 0xFFFF;  
  #if defined (RF24NetworkMulticast)
  uint8_t count = 0;
  #endif
  uint16_t i;
  uint16_t m;
  uint16_t parent_mask;
          
  while ( rn.node_address & node_mask_check ){
    node_mask_check <<= 3;
  #if defined (RF24NetworkMulticast)
	  count++;
  }
  rn.multicast_level = count;
  #else
  }
  #endif
  
  rn.node_mask = ~ node_mask_check;

  // parent mask is the next level down
  parent_mask = rn.node_mask >> 3;

  // parent node is the part IN the mask
  rn.parent_node = rn.node_address & parent_mask;

  // parent pipe is the part OUT of the mask
  i = rn.node_address;
  m = parent_mask;
  while (m)
  {
    i >>= 3;
    m >>= 3;
  }
  rn.parent_pipe = i;

  IF_SERIAL_DEBUG_MINIMAL( printf_P(PSTR("setup_address node=0%o mask=0%o parent=0%o pipe=0%o\n\r"),node_address,node_mask,parent_node,parent_pipe););

}

/******************************************************************/
uint16_t RF24N_addressOfPipe( uint16_t node, uint8_t pipeNo )
{
		//Say this node is 013 (1011), mask is 077 or (00111111)
		//Say we want to use pipe 3 (11)
        //6 bits in node mask, so shift pipeNo 6 times left and | into address		
	uint16_t m = rn.node_mask >> 3;
	uint8_t i=0;
	
	while (m){ 	   //While there are bits left in the node mask
		m>>=1;     //Shift to the right
		i++;       //Count the # of increments
	}
    return node | (pipeNo << i);	
}

/******************************************************************/

uint16_t RF24N_direct_child_route_to( uint16_t node )
{
  // Presumes that this is in fact a child!!
  uint16_t child_mask = ( rn.node_mask << 3 ) | 0x07;
  return node & child_mask;
  
}

/******************************************************************/
/*
uint8_t RF24N_pipe_to_descendant( uint16_t node )
{
  uint16_t i = node;       
  uint16_t m = node_mask;

  while (m)
  {
    i >>= 3;
    m >>= 3;
  }

  return i & 0B111;
}*/

/******************************************************************/

uint8_t RF24N_is_valid_address( uint16_t node )
{
  uint8_t result = 1;

  while(node)
  {
    uint8_t digit = node & 0x07;
	#if !defined (RF24NetworkMulticast)
    if ((digit < 1) || (digit > 5))
	#else
	if (/*(digit < 0) ||*/ (digit > 5))	//Allow our out of range multicast address
	#endif
    {
      result = 0;
      IF_SERIAL_DEBUG_MINIMAL(printf_P(PSTR("*** WARNING *** Invalid address 0%o\n\r"),node););
      break;
    }
    node >>= 3;
  }

  return result;
}

/******************************************************************/
#if defined (RF24NetworkMulticast)
void RF24N_multicastLevel(uint8_t level){
  raddr_t addr[5];
  rn.multicast_level = level;
  //radio.stopListening();  
  RF24N_pipe_address(RF24N_levelToAddress(level),0,addr);
  RF24_openReadingPipe_d(0,addr);
  //radio.startListening();
  }
  
uint16_t RF24N_levelToAddress(uint8_t level){
	
	uint16_t levelAddr = 1;
	if(level){
		levelAddr = levelAddr << ((level-1) * 3);
	}else{
		return 0;		
	}
	return levelAddr;
}  
#endif
/******************************************************************/

void RF24N_pipe_address( uint16_t node, uint8_t pipe ,raddr_t * address)
{
  
  static uint8_t address_translation[] = { 0xc3,0x3c,0x33,0xce,0x3e,0xe3,0xec };
  raddr_t result[5] = {0xCC,0xCC,0xCC,0xCC,0xCC};
  uint8_t* out = (uint8_t*)(result);

  uint8_t i;
  
  // Translate the address to use our optimally chosen radio address bytes
	uint8_t count = 1; uint16_t dec = node;

	while(dec){
	  #if defined (RF24NetworkMulticast)
	  if(pipe != 0 || !node)
      #endif
		out[count]=address_translation[(dec % 8)];		// Convert our decimal values to octal, translate them to address bytes, and set our address
	  
	  dec /= 8;	
	  count++;
	}
    
	#if defined (RF24NetworkMulticast)
	if(pipe != 0 || !node)
	#endif
	  out[0] = address_translation[pipe];
	#if defined (RF24NetworkMulticast)
	else
	  out[1] = address_translation[count-1];
	#endif

 		
  
  #if defined (RF24_LINUX)
  IF_SERIAL_DEBUG(uint32_t* top = (uint32_t*)(out+1);printf_P(PSTR("%u: NET Pipe %i on node 0%o has address %x%x\n\r"),millis(),pipe,node,*top,*out));
  #else
  IF_SERIAL_DEBUG(uint32_t* top = (uint32_t*)(out+1);printf_P(PSTR("%lu: NET Pipe %i on node 0%o has address %lx%x\n\r"),millis(),pipe,node,*top,*out));
  #endif
 

  for(i=0;i<5;i++)
  {
    address[i]=result[4-i];
  }
 
}

/******************************************************************/
 void RF24N_begin(uint16_t _node_address){
	  RF24N_begin_d(USE_CURRENT_CHANNEL,_node_address);
  }
   

/******************************************************************/
  uint8_t * RF24N_getFrame_buffer(void){
return rn.frame_buffer;
 
 }	

/******************************************************************/
  void    RF24N_setReturnSysMsgs(void){
  rn.returnSysMsgs=1;
  }

/******************************************************************/
 uint8_t RF24N_getNetworkFlags(void){
 return rn.networkFlags; 
 } 
/******************************************************************/
 void RF24N_setNetworkFlags(uint8_t nf){
 rn.networkFlags=nf; 
 } 

/******************************************************************/
 uint16_t RF24N_getRouteTimeout(void){
 return rn.routeTimeout; 
 }

/******************************************************************/
  #if !defined ( DISABLE_FRAGMENTATION ) &&  !defined (RF24_LINUX)
   RF24NetworkFrame* RF24N_getFrag_ptr(void){
   return rn.frag_ptr;
   }
  #endif
   

/******************************************************************/
void  RF24N_setMulticastRelay(void)
{
  rn.multicastRelay=1;
}	

/******************************************************************/
uint8_t  RF24N_getMulticastRelay(void)
{
  return rn.multicastRelay;
}

#if defined (RF24_LINUX)
/******************************************************************/
RF24NetworkFrame * RF24N_getExternalQueue(void)
{
  return rn.external_queue;
}  

/******************************************************************/
uint16_t * RF24N_getExternalQueue_c(void)
{
  return &rn.external_queue_c;
}  
#endif

/************************ Sleep Mode ******************************************/


#if defined ENABLE_SLEEP_MODE

#if !defined(__arm__) && !defined(__ARDUINO_X86__)

void wakeUp(){
  wasInterrupted=true;
  sleep_cycles_remaining = 0;
}

ISR(WDT_vect){
  --sleep_cycles_remaining;
}


uint8_t RF24N_sleepNode( unsigned int cycles, int interruptPin ){


  sleep_cycles_remaining = cycles;
  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
  sleep_enable();
  if(interruptPin != 255){
    wasInterrupted = false; //Reset Flag
  	attachInterrupt(interruptPin,wakeUp, LOW);
  }    

  #if defined(__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny85__)
  WDTCR |= _BV(WDIE);
  #else
  WDTCSR |= _BV(WDIE);
  #endif

  while(sleep_cycles_remaining){
    sleep_mode();                        // System sleeps here
  }                                     // The WDT_vect interrupt wakes the MCU from here
  sleep_disable();                     // System continues execution here when watchdog timed out
  detachInterrupt(interruptPin);

  #if defined(__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny85__)
	WDTCR &= ~_BV(WDIE);
  #else
	WDTCSR &= ~_BV(WDIE);
  #endif
  
  return !wasInterrupted;
}

void RF24N_setup_watchdog(uint8_t prescalar){

  uint8_t wdtcsr = prescalar & 7;
  if ( prescalar & 8 )
    wdtcsr |= _BV(WDP3);
  MCUSR &= ~_BV(WDRF);                      // Clear the WD System Reset Flag

  #if defined(__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny85__)
  WDTCR = _BV(WDCE) | _BV(WDE);            // Write the WD Change enable bit to enable changing the prescaler and enable system reset
  WDTCR = _BV(WDCE) | wdtcsr | _BV(WDIE);  // Write the prescalar bits (how long to sleep, enable the interrupt to wake the MCU
  #else
  WDTCSR = _BV(WDCE) | _BV(WDE);            // Write the WD Change enable bit to enable changing the prescaler and enable system reset
  WDTCSR = _BV(WDCE) | wdtcsr | _BV(WDIE);  // Write the prescalar bits (how long to sleep, enable the interrupt to wake the MCU
  #endif
}


#endif // not ATTiny
#endif // Enable sleep mode
