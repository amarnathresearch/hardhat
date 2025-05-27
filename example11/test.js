const {ethers} = require("ethers");

const provider = new ethers.JsonRpcProvider("https://sepolia.infura.io/v3/7a6390671e114cf7a67dae3cc9264364");

const privateKey = "6244dbd6355f5aaf10df0c06dece88566d374448713ae4f8336db1a9d8779102";


const wallet = new ethers.Wallet(privateKey, provider);

async function sendTransaction() {
    const tx = {
        to: "0xAaFF473739f552402aEFAbe8eE7E595d19b8A881", // Lido DAO Token
        value: ethers.parseEther("0.01"),
        // gasLimit: 21000,
        // gasPrice: ethers.parseUnits("50", "gwei")
    };

    const transaction = await wallet.sendTransaction(tx);
    console.log(`Transaction hash: ${transaction.hash}`);
}
sendTransaction()