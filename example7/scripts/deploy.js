const hre = require("hardhat");
async function main() {
    const [deployer] = await hre.ethers.getSigners();
    const balance = await hre.ethers.provider.getBalance(deployer.address);
    console.log("deployer address:", deployer.address);
    console.log("deployer balance:", balance.toString());

    const Token = await hre.ethers.getContractFactory("MyToken");
    const initialSupply = await hre.ethers.parseUnits("1000000", 18);
    const token = await Token.deploy(initialSupply);
    await token.waitForDeployment();
    console.log("Token deployed to:", await token.getAddress());
    }
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
    }
    );