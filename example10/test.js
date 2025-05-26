const { ethers } = require("ethers");

console.log("ethers version:", ethers.version);
const provider = new ethers.JsonRpcProvider("https://mainnet.infura.io/v3/7a6390671e114cf7a67dae3cc9264364");

// const address = "0x742d35Cc6634C0532925a3b844Bc454e4438f44e";
// const address = "0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5"; // Lido DAO Token 
// const address = "0xec3386ce6072847a8c440E3106c3b7c735974f5A"; // WETH
// const address = "0x413c987B25C77DA7F785B3C07cC2a15dA0E2BEBE"; // USDC
const address = "0xf3aBF14B24F9Cfb79d6cC590745237254205B513"; 
async function getBalance() {
    const balance = await provider.getBalance(address);
    console.log(`Balance: ${ethers.formatEther(balance)} ETH`);
}

