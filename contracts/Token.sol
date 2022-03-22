// SPDX-License-Identifier:MIT
pragma solidity 0.8.9;

contract Token {
  string public name = "Token";
  string public symbol = "TOKEN";
  uint public totalSupply = 1000;

  mapping (address => uint) balances;

  constructor(){
    balances[msg.sender] = totalSupply;
  }

  function transfer(address to, uint amount) external {
    require(balances[msg.sender] - amount >= 0, "transfer: not enough token");
    balances[msg.sender]-= amount;
    balances[to]+= amount;
  }

  function balanceOf(address holder) external view returns (uint) {
    return balances[holder];
  }

}
