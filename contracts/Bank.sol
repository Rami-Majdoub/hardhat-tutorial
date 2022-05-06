// SPDX-License-Identifier:MIT
pragma solidity 0.8.9;

import "./Pausable.sol";

contract Bank is Pausable {

  mapping(address => uint) private balances;

  function deposit() external payable whenNotPaused{
    require(msg.value > 0, "deposit 0 eth");
    balances[msg.sender] += msg.value;
  }

  function withdraw(uint value) external whenNotPaused {
    require(value > 0, "withdraw 0 eth");
    require(value <= balances[msg.sender], "not enough eth");
    balances[msg.sender] -= value;

    address payable payableUser = payable(msg.sender);
    (bool success, ) = payableUser.call{value: value}("");
    require(success, "failed to send eth");
  }

  function getBalance() external view returns(uint) {
    return balances[msg.sender];
  }

  function getBalanceOf(address user) external view returns(uint) {
    return balances[user];
  }

  function getBalanceOfContract() external view returns(uint) {
    return address(this).balance;
  }
}
