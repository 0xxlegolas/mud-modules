// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { IBaseWorld } from "@latticexyz/world/src/interfaces/IBaseWorld.sol";
import {IncrementRegistration} from "../src/IncrementRegistration.sol";

library TestScript {
  function run(address worldAddress) internal {
    IBaseWorld world = IBaseWorld(worldAddress);
    IncrementRegistration.install(world);
  }
}




