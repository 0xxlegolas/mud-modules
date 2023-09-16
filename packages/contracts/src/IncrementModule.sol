// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { IBaseWorld } from "@latticexyz/world/src/interfaces/IBaseWorld.sol";
import { Module } from "@latticexyz/world/src/Module.sol";
import { WorldContextConsumer } from "@latticexyz/world/src/WorldContext.sol";
import { ResourceSelector } from "@latticexyz/world/src/ResourceSelector.sol";

import { IncrementSystem } from "./IncrementSystem.sol";
import { CounterTable } from "./codegen/tables/CounterTable.sol";
import { NAMESPACE, TABLE_NAME, SYSTEM_NAME } from "./constants.sol";

contract IncrementModule is Module {
  IncrementSystem incrementSystem = new IncrementSystem();

  function getName() public pure returns (bytes16) {
    return SYSTEM_NAME;
  }

  function supportsInterface(bytes4 interfaceId) public pure override(Module) returns (bool) {
    super.supportsInterface(interfaceId);
  }

  function installRoot(bytes memory args) public {
    install(args);
  }

  function install(bytes memory) public {
    IBaseWorld world = IBaseWorld(_world());

    world.registerNamespace(NAMESPACE);

    //Register a table
    world.grantAccess(ResourceSelector.from(NAMESPACE, TABLE_NAME), address(incrementSystem));
    CounterTable.register(world, ResourceSelector.from(NAMESPACE, TABLE_NAME));

    // Register system
    world.registerSystem(ResourceSelector.from(NAMESPACE, SYSTEM_NAME), incrementSystem, true);

    // Register system's functions
    world.registerFunctionSelector(ResourceSelector.from(NAMESPACE, SYSTEM_NAME), "increment", "()");
  }
}
