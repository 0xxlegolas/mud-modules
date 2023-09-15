import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    CounterTable: {
      keySchema: { owner: "address" },
      schema: "uint32",
      tableIdArgument: true,
    },
  },
  modules: [
    {
      name: "IncrementModule",
      root: true,
      args: []
    }
  ]
});