// SPDX-License-Identifier:MIT
pragma solidity 0.8.9;

contract Ownable {

  address public owner;

  constructor(){
    owner = tx.origin;
  }

  modifier onlyContractOwner(){
    require(msg.sender == owner, "not the contract owner");
    _;
  }
}