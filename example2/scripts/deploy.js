const { ethers } = require("hardhat");


async function main() {
  const [deployer] = await ethers.getSigners();
  const Bank = await ethers.getContractFactory("SimpleBank", deployer);
  const bank = await Bank.deploy();
  await bank.waitForDeployment();

  console.log("SimpleBank deployed to:", await bank.getAddress());
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});