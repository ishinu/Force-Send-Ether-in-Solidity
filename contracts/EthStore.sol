// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract EthStore {
    address private admin;
    uint private winningPoint = 7 ether;
    address payable public winner;

    modifier onlyOwner(){
        require(msg.sender == admin);
        _;
    }

    constructor(){
        admin = msg.sender;
    }

    function deposit() public payable{
        require(msg.value == 1 ether,"Only allowed deposit amount is 1 Ether.");
        if(address(this).balance == winningPoint){
            winner = payable(msg.sender);
        }
    }

    function getReward() public {
        require(payable(msg.sender) == winner);
        payable(msg.sender).transfer(address(this).balance);
    }

    function getBalance() view public onlyOwner returns(uint){
        return address(this).balance;
    }
}
