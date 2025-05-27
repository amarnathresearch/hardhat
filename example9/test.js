const { ethers } = require("ethers");

console.log("Ethers version:", ethers.version);


const provider = new ethers.JsonRpcProvider("https://mainnet.infura.io/v3/123abc456def7890");
console.log("Provider:", provider);

// 3. Set the address you want to check
const address = "0x742d35Cc6634C0532925a3b844Bc454e4438f44e"; // Random whale address

// 4. Get and display the balance
async function getBalance() {
    const balance = await provider.getBalance(address);
    console.log(`Balance: ${ethers.formatEther(balance)} ETH`);
}

getBalance();