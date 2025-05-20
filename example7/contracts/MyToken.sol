// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MyToken{
    string public name="MyToken";
    string public symbol="MTK";
    uint256 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(uint initialSupply){
        totalSupply = initialSupply*(10**uint(decimals));
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint value) external returns(bool){
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        _transfer(msg.sender, to, value);
        return true;
    }
    function approve(address spender, uint value) external returns(bool){
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint value) external returns(bool){
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        require(allowance[from][msg.sender]>=value, "Allowance external");
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }
    
    function _transfer(address from, address to, uint value) internal {
        require(to != address(0), "Transfer within the same address");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);

    }

}