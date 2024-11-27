// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract SimpleStorage { 
    //boolean, uint, int, address, bytes
    uint256 public favouriteNamber ;

    function store(uint256 _favouriteNumber) public {
        favouriteNamber = _favouriteNumber;
    }
}
//0xd9145CCE52D386f254917e481eB44e9943F39138