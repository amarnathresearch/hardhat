// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleVoting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    uint public voteDeadline;

    constructor(string[] memory candidateNames, uint durationInMins) {
        require(candidateNames.length > 0, "Must provide at least one candidate");
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({name: candidateNames[i], voteCount: 0}));
        }
        voteDeadline = block.timestamp + durationInMins * 1 minutes;
    }

    function vote(uint candidateIndex) external {
        require(block.timestamp <= voteDeadline, "Voting has ended");
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateIndex < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    function getWinner() public view returns (uint candidateIndex, string memory name) {
        require(block.timestamp > voteDeadline, "Voting is still ongoing");

        uint highestVotes = 0;
        candidateIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > highestVotes) {
                highestVotes = candidates[i].voteCount;
                candidateIndex = i;
                name = candidates[i].name;
            }
        }
    }
}