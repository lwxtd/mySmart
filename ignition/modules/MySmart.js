const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("MySmartModule", (m) => {
  const mySmart = m.contract("MySmart");

  return { mySmart };
});
