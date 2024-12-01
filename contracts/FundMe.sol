// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe{

    uint256 public minimumUsd = 50;

    function fund() public payable {
        // want to be able to set a minimun fund 
        require(msg.value > minimumUsd , "Didn`t sent enough!");
    }
}