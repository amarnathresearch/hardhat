const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  const Contract = await hre.ethers.getContractFactory("ProfileRegister", deployer);
  const contract = await Contract.deploy();
  await contract.waitForDeployment();

  console.log("Deployed to:", await contract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});