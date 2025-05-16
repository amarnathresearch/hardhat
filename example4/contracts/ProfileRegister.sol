// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ProfileRegister {
    struct Profile {
        string name;
        uint age;
        string email;
    }

    mapping(address => Profile) public profiles;

    function register(string calldata name, uint age, string calldata email) external {
        profiles[msg.sender] = Profile(name, age, email);
    }

    function getMyProfile() external view returns (Profile memory) {
        return profiles[msg.sender];
    }
}