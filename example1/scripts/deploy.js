const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Hello, deployer!");

  const Counter = await hre.ethers.getContractFactory("Counter", deployer);
  const counter = await Counter.deploy();
  await counter.waitForDeployment();

  console.log("Counter deployed to:", await counter.getAddress());
 
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});