pragma solidity ^0.8.28;

contract Counter{
    uint public count;
    function increment() public {
        count += 1;
    }
    function get() public view returns (uint){
        return count;
    }
}