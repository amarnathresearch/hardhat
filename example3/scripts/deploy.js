const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  const Vault = await ethers.getContractFactory("Vault");
  const vault = await Vault.deploy();
  await vault.waitForDeployment();

  console.log("Vault deployed to:", await vault.getAddress());
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});