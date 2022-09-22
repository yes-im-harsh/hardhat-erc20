//SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract ERC20 {
 uint256 public totalSupply;
 string public name;
 string public symbol;

 mapping(address => uint256) public balanceOf;

 constructor(string memory name_, string memory symbol_){
  name = name_;
  symbol = symbol_;
 }

 function decimals() public pure returns(uint8) {
  return 18;
 }

 function transfer(address recipient, uint256 amount) external returns(bool) {
  require(recipient != address(0),"ERC20: transfer to zero address" );

  uint256 senderBalance = balanceOf[msg.sender];
  require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

  balanceOf[msg.sender] = senderBalance - amount;
  balanceOf[recipient] += amount;

  return(true);
 }
}

