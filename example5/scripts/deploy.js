const hre = require("hardhat");
async function main() {
    const [deployer] = await hre.ethers.getSigners();
    const Maketplace = await hre.ethers.getContractFactory("Marketplace");
    const marketplace = await Maketplace.deploy();
    await marketplace.waitForDeployment();
    console.log("Marketplace deployed to:", await marketplace.getAddress());
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
}
);