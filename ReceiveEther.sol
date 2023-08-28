    // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract EthReceiver {
    event Received(address, uint256);
    event ReceivedWithData(address, uint256, bytes);

    // Function to receive Ether. msg.data must be empty
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Fallback function is called when msg.data is not empty
    fallback() external payable {
        emit ReceivedWithData(msg.sender, msg.value, msg.data);
    }

    function deposit() external payable {
    
    }


    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

}
