// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeHouse
{
    address payable public owner;
    uint256 public initalBalance;

    constructor()payable
    {
        owner = payable(msg.sender);
        initalBalance = msg.value;
    }

    function transfer(address _to, uint256 _ammount) public
    {
        require(tx.origin == owner, "YOU ARE NOT THE OWNER");
        (bool success,) = _to.call{value: _ammount}("");
        require(success, "FAILED TO SEND ETHER");

    }

    function getBalance() public view returns (uint256)
    {
        return address(this).balance;
    } 
}