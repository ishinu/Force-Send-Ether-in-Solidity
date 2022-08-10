// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract EthStoreV2 {
    uint private storeBalance;
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
        storeBalance += msg.value;
        if(storeBalance == winningPoint){
            winner = payable(msg.sender);
        }
    }

    function getReward() public {
        require(payable(msg.sender) == winner);
        payable(msg.sender).transfer(address(this).balance); // Let the winner take it all. 
    }

    function getBalance() view public onlyOwner returns(uint){
        return storeBalance;
    }
}
