/*
 Copyright (C) 2011 J. Coliz <maniacbug@ymail.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 */

// C headers
#include <stdlib.h>
// Framework headers
// Library headers
#include <RF24Network_c.h>
// Project headers
// This component's header
#include <Sync.h>

/****************************************************************************/

/**
   * Constructor
   *
   * @param _network Which network to syncrhonize over
   */
  void Sync_init(Sync_* sy, RF24Network* _network)
  {
     sy->network=_network;
     sy->app_data=NULL;
     sy->internal_data=NULL;
     sy->len=0;
     sy->to_node=0;
  }
  /**
   * Begin the object
   *
   * @param _to_node Which node we are syncing with
   */
  void Sync_begin(Sync_ * sy, uint16_t _to_node)
  {
    sy->to_node = _to_node;
  }
  /**
   * Declare the shared data set
   *
   * @param _data Location of shared data to be syncrhonized
   */
  void Sync_register_me(Sync_ * sy, uint8_t * _data)
  {
    sy->app_data = (uint8_t*)( _data);
    sy->len = sizeof(_data);
    sy->internal_data = (uint8_t*)(malloc(sy->len));
    Sync_reset(sy);
  }

  /**
   * Reset the internal copy of the shared data set 
   */
  void Sync_reset(Sync_ * sy)
  {
    memcpy(sy->internal_data,sy->app_data,sy->len);
  }
  
  /**
   * Update the network and the shared data set
   */

void Sync_update(Sync_ *sy)
{
  // Pump the network
  RF24N_update(sy->network);

  // Look for changes to the data
  uint8_t message[32];
  uint8_t *mptr = message;
  unsigned at = 0;
  while ( at < sy->len )
  {
    if ( sy->app_data && sy->internal_data && sy->app_data[at] != sy->internal_data[at] )
    {
      // Compose a message with the deltas
      *mptr++ = at + 1;
      *mptr++ = sy->app_data[at];

      // Update our internal view
      sy->internal_data[at] = sy->app_data[at];
    }
    ++at;
  }
  // Zero out the remainder
  while ( at++ < sizeof(message) )
    *mptr++ = 0;

  // If changes, send a message
  if ( *message )
  {
    // TODO handle the case where this has to be broken into
    // multiple messages
    RF24NetworkHeader header;
    RF24NH_init(&header,/*to node*/ sy->to_node, /*type*/ 'S' /*Sync*/);
    RF24N_write_m(sy->network,&header,message,sizeof(message));
  }

  // Look for messages from the network
  // Is there anything ready for us?
  if ( RF24N_available(sy->network) )
  {
    // If so, take a look at it
    RF24NetworkHeader header;
    RF24N_peek(sy->network,&header);

    switch (header.type)
    {
    case 'S':
      IF_SERIAL_DEBUG(printf_P(PSTR("%lu: SYN Received sync message\n\r"),millis()));

      RF24N_read(sy->network,&header,&message,sizeof(message));
      // Parse the message and update the vars
      mptr = message;
      at = 0;
      while ( mptr < message + sizeof(message) )
      {
        // A '0' in the first position means we are done
        if ( !*mptr )
          break;
        uint8_t pos = (*mptr++) - 1;
        uint8_t val = *mptr++;

        IF_SERIAL_DEBUG(printf_P(PSTR("%lu: SYN Updated position %u to value %u\n\r"),millis(),pos,val));

        sy->app_data[pos] = val;
        sy->internal_data[pos] = val;
      }
      break;
    default:
      // Leave other messages for the app
      break;
    };
  }
}
// vim:cin:ai:sts=2 sw=2 ft=cpp
