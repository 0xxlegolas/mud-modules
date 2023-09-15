// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { IBaseWorld } from "@latticexyz/world/src/interfaces/IBaseWorld.sol";
import { Module } from "@latticexyz/world/src/Module.sol";
import { WorldContextConsumer } from "@latticexyz/world/src/WorldContext.sol";
import { ResourceSelector } from "@latticexyz/world/src/ResourceSelector.sol";

import {IncrementSystem} from "./systems/IncrementSystem.sol";
import {CounterTable} from "./codegen/tables/CounterTable.sol";
import {NAMESPACE, TABLE_NAME, SYSTEM_NAME} from "./constants.sol";

library IncrementRegistration {


    function getName() public view returns (bytes16) {
        return bytes16("Increment.m");
    }

  function install(IBaseWorld world) public {
  IncrementSystem incrementSystem = new IncrementSystem();


     //Register a table     
  // world.grantAccess(ResourceSelector.from(NAMESPACE, TABLE_NAME), address(incrementSystem));
  CounterTable.register(world, ResourceSelector.from(NAMESPACE, TABLE_NAME));

     
  // Register system
  world.registerSystem(ResourceSelector.from(NAMESPACE, SYSTEM_NAME), incrementSystem, true);

  // Register system's functions
  world.registerFunctionSelector(ResourceSelector.from(NAMESPACE, SYSTEM_NAME), "increment", "()");

  }

}
