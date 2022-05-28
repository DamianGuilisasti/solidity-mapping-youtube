// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract MyContract {
    mapping(uint => uint) public books;

    //La key no puede ser:

    //Struct
    //Mapping
    //Array sin tamaño fijo
    //Enum

    function addBook() public {
        books[2] = 1;
    }

    struct Book{
        string name;
        uint year;
    }

    mapping(uint => Book) public books2;

    function addBook2() public {
        books2[10] = Book("Libro 2", 2015);
    }

    mapping(address => int) public balances;

    function changeBalance(int _balance) public {
        balances[msg.sender] = _balance;
    }

    function returnBalance() public view returns(int){
        return balances[msg.sender];
    }

    function deleteBalance() public {
        delete balances[msg.sender];
    }

    mapping(address => mapping(uint => Book)) public books3;

    function addBookByOwner() public {
        books3[msg.sender][50] = Book("Libro 3", 2020);
        books3[msg.sender][51] = Book("Libro 4", 2021);
    }

    mapping(address => uint[]) public scores;

    function addPlayerScore(uint _score) public {
        scores[msg.sender].push(_score);
    }

    function returnPlayerScore(uint _position) public view returns(uint){
        return scores[msg.sender][_position];
    }

    function updatePlayerScore(uint _position, uint _score) public {
        scores[msg.sender][_position] = _score;
    }

    function deletePlayerScore(uint _position) public {
        delete scores[msg.sender][_position];
    }

}