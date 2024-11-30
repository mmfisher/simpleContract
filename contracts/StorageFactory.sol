
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";


//0xd9145CCE52D386f254917e481eB44e9943F39138
//deploy injected provider

contract StorageFactory{

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // How does storage factory know what simple stroage looks like?
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
        
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //ABI - Application Binary Intrerface
        // compilation details
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint _simpleStorageIndex) public view returns (uint256){
        return simpleStorageArray[_simpleStorageIndex].viewFavouriteNumber();
    }
}