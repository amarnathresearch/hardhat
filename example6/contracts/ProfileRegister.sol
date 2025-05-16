// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ProfileRegister is Ownable {
    struct Profile {
        string name;
        uint age;
        string email;
    }

    mapping(address => Profile) public profiles;

    constructor(address initialOwner) Ownable(initialOwner) {}

    function register(string calldata name, uint age, string calldata email) external onlyOwner {
        profiles[msg.sender] = Profile(name, age, email);
    }

    function getMyProfile() external view returns (Profile memory) {
        return profiles[msg.sender];
    }
}