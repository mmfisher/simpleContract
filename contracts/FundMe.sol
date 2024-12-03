// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe{

    import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


    uint256 public minimumUsd = 50;

    function fund() public payable {
        // want to be able to set a minimun fund 
        require(msg.value > minimumUsd , "Didn`t sent enough!");
    }

    function getPrice() public {
        // ABI
        // Address  0x694AA1769357215DE4FAC081bf1f309aDC325306
        //feed addresses->price feed addresses -> sepolia testnet

    }

    function getVersion() public view return (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(){

    }
}