// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleVoting {
    struct Candidate{
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    uint public voteDeadline;

    constructor(string[] memory candidateNames, uint durationInMins) {
        for(uint i=0; i<candidateNames.length; i++){
            candidates.push(Candidate({name: candidateNames[i], voteCount = 0}));
        }
        voteDeadline = block.timestamp+durationInMins;
    }

}

function vote(uint candidateIndex) external {
    require(block.timestamp <= voteDeadline, "Voting has ended");
    require(!hasVoted[msg.sender], "Already voted");
    require(candidateIndex < candidates.length, "Invalid vote");
    hasVoted[msg.sender] = true; // I have voted
    candidates[candidateIndex].voteCount++;

}

function getWinner() public view returns (uint candidateIndex, string memory name){
    require(block.timestamp > voteDeadline, "Voting still in process");
    highestIndex = -1;
    for(uint i =0; i<candidates.length; i++){
        if(candidates[i].voteCount > highestIndex){
            highestIndex = candidates[i].voteCount
            candidateIndex = i;
            name = candidates[i].name;
        }
    }

}

