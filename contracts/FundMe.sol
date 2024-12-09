// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    address[] public funders;

    mapping (address => uint256) public addressToAmountFunded;

    uint256 public minimumUsd = 50 * 1e18;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {
        // want to be able to set a minimun fund 
        require(msg.value.getConversionRate()> minimumUsd , "Didn`t sent enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner{
        for (uint funderIndex = 0; funderIndex < funders.length; funderIndex ++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; // to remove from mapping
        }
        funders = new address[](0);
        //transfer
        // payable (msg.sender).transfer(address(this).balance);
        //send
        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        //call
        (bool callSuccess, ) = payable (msg.sender).call{value:address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner{
        require(msg.sender == owner , "Only Owner can call this function!");
        _;
    }
   
}