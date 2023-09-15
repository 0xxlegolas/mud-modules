// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { CounterTable } from "./codegen/tables/CounterTable.sol";
import { ResourceSelector } from "@latticexyz/world/src/ResourceSelector.sol";

import { NAMESPACE, TABLE_NAME } from "./constants.sol";

contract IncrementSystem is System {
  function increment() public returns (uint32) {
    uint32 counter = CounterTable.get(ResourceSelector.from(NAMESPACE, TABLE_NAME), _msgSender());
    uint32 newValue = counter + 1;
    CounterTable.set(ResourceSelector.from(NAMESPACE, TABLE_NAME), _msgSender(), newValue);
    return newValue;
  }
}
