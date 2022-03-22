// SPDX-License-Identifier:MIT
pragma solidity 0.8.9;

import "hardhat/console.sol";

contract Token {
  string public name = "Token";
  string public symbol = "TOKEN";
  uint public totalSupply = 1000;
  address public owner;

  mapping (address => uint) balances;

  constructor(){
    owner = msg.sender;
    balances[msg.sender] = totalSupply;
  }

  function transfer(address to, uint amount) external {
    console.log("Trying to send %s tokens to %s", amount, to);
    console.log("Sender balance %d", balances[msg.sender]);

    require(balances[msg.sender] >= amount, "transfer: not enough token");
    balances[msg.sender]-= amount;
    balances[to]+= amount;
  }

  function balanceOf(address holder) external view returns (uint) {
    return balances[holder];
  }

}
