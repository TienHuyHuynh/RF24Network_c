/*
 Copyright (c) 2016 Luis Claudio Gamboa Lopes <lcgamboa@yahoo.com>
 Copyright (C) 2011 J. Coliz <maniacbug@ymail.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 */

#ifndef __SYNC_H__
#define __SYNC_H__

#ifdef __cplusplus
extern "C" {
#endif

// C headers
#include <stdlib.h>
#include <string.h>
// Framework headers
// Library headers
#include <RF24Network_config.h>
// Project headers

//class RF24Network;

/**
 * Synchronizes a shared set of variables between multiple nodes
 */

//class Sync
typedef struct
{
  RF24Network_* network;
  uint8_t* app_data; /**< Application's copy of the data */
  uint8_t* internal_data; /**< Our copy of the data */
  size_t len; /**< Length of the data in bytes */
  uint16_t to_node; /**< The other node we're syncing with */
}Sync_;

  /**
   * Constructor
   *
   * @param _network Which network to syncrhonize over
   */
  void Sync_init(Sync_* sy, RF24Network_* _network);
 
  /**
   * Begin the object
   *
   * @param _to_node Which node we are syncing with
   */
  void Sync_begin(Sync_ * sy, uint16_t _to_node);

  /**
   * Declare the shared data set
   *
   * @param _data Location of shared data to be syncrhonized
   */
  void Sync_register_me(Sync_ * sy, uint8_t * _data);

  /**
   * Reset the internal copy of the shared data set 
   */
  void Sync_reset(Sync_ * sy);
  
  /**
   * Update the network and the shared data set
   */
  void Sync_update(Sync_ * sy);



#ifdef __cplusplus
  }
#endif

#endif // __SYNC_H__
// vim:cin:ai:sts=2 sw=2 ft=cpp
