// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SendEther {
    constructor() payable {}

    event Response(bool success, bytes data);

    function sendViaTransfer(address payable _to, uint256 amount)
        public
        payable
    {
        // This function is no longer recommended for sending Ether. (Old and less secure, not flexible with gas)
        // It sends 2300 gas
        _to.transfer(amount);
    }

    function sendViaSend(address payable _to, uint256 amount) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether. (Old and less secure, not flexible with gas)
        // It sends 2300 gas
        bool sent = _to.send(amount);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to, uint256 amount) public payable {
        (bool sent, bytes memory data) = _to.call{value: amount}("");
        emit Response(sent, data);
        require(sent, "Failed to send Ether");
    }

    // Let's imagine that contract Caller does not have the source code for the
    // contract Receiver, but we do know the address of contract Receiver and the function to call.
    function testCallFoo(address payable _addr) public payable {
        // You can send ether and specify a custom gas amount
        (bool success, bytes memory data) = _addr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("deposit()"));

        emit Response(success, data);
    }

    // Calling a function that does not exist triggers the fallback function.
    function testCallDoesNotExist(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}
