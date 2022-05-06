// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract Pausable{

  bool public paused;

  modifier whenNotPaused(){
    require(paused == false, "transactions are paused");
    _;
  }
  modifier whenPaused(){
    require(paused == true, "transactions are not paused");
    _;
  }

  function pause() external whenNotPaused {
    paused = true;
  }
  function resume() external whenPaused {
    paused = false;
  }
}