// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Vault {
    address public owner;

    event Received(address indexed sender, uint amount);
    event Withdrawn(address indexed to, uint amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // receive ETH
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // fallback for incorrect calls
    fallback() external payable {
        revert("Invalid call");
    }

    function withdraw(uint amount, address payable to) external onlyOwner {
        require(address(this).balance >= amount, "Insufficient funds");
        to.transfer(amount);
        emit Withdrawn(to, amount);
    }

    function balance() external view returns (uint) {
        return address(this).balance;
    }
}