// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe{



    uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable {
        // want to be able to set a minimun fund 
        require(getConversionRate(msg.value ) > minimumUsd , "Didn`t sent enough!");
    }

    function getPrice() view public returns (uint256){
        // ABI
        // Address  0x694AA1769357215DE4FAC081bf1f309aDC325306
        //feed addresses->price feed addresses -> sepolia testnet
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
         (,int256 price,,,) = priceFeed.latestRoundData();
         //ETH in term of USD
         //3000.00000000
         return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) view  public  returns (uint256){

        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e18;
        return ethAmountInUsd;

    }
}