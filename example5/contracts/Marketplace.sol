// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Marketplace {
    struct Item {
        uint id;
        string name;
        uint price;
        address seller;
        bool sold;
    }

    mapping(uint => Item) public items;
    uint public itemCount;

    function listItem(string calldata name, uint price) external {
        require(price > 0, "Price must be > 0");
        items[itemCount] = Item(itemCount, name, price, msg.sender, false);
        itemCount++;
    }

    function buyItem(uint id) external payable {
        Item storage item = items[id];
        require(!item.sold, "Already sold");
        require(msg.value == item.price, "Incorrect ETH");

        item.sold = true;
        payable(item.seller).transfer(msg.value);
    }
}