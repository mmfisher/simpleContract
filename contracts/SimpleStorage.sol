// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//EVN
//Avalanche, Fantom, Polygon
contract SimpleStorage { 
    //boolean, uint, int, address, bytes
    uint256 public favouriteNumber ;

    mapping(string => uint256) public nameToFavouriteNumber;

    People[] public  people;

    struct People{
        string name;
        uint256 favouriteNumber;
    }

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    // view, pure
    function viewFavouriteNumber() public view returns (uint256){
        return favouriteNumber;
    }

    //calldate, memory, storage
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_name,_favouriteNumber));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
//0xd9145CCE52D386f254917e481eB44e9943F39138
//deploy injected provider