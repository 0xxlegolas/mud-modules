import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {

  },
  excludeSystems: ["IncrementSystem",],

  modules: [
    {
      name: "IncrementModule",
      root: false,
      args: [{
        value: "0x",
        type: "string"
      }]
    }
  ]
});