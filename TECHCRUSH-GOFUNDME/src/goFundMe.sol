// Used for raising funds
// allow fund
// withdraw

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract goFundMe {
    
    address public owner;
    uint256 public amount;
    address public latestFunder;
    address[] public Funders;
    mapping (address => uint256 ) public FundersToAmt;
    // FUNDME 

    function fundMe() public payable  {
        owner = msg.sender;
        // payable 
        // allows you to send money from an address to a contract
        require(msg.value >= 0.2 ether, "this must be more than or equals to .2 ether");
        amount = msg.value;
        // msg.sender =  this is the the caller/address calling a particular Transaction
        // msg.value = tells you how much in wei or ether or gwei you are spending to execute a particular tx 

        //TO-DO
        // takke nothing less than 0.2 ether

        // mapping amount per value of the funders
        FundersToAmt[msg.sender] = FundersToAmt[msg.sender] + msg.value;
        // my balance  =  my balance + amount im funding
        Funders.push(msg.sender);
        // my new balance = my balance + second amount im sending
        // update the latest Funder
        latestFunder = msg.sender;
    }
    // WITHDRAWFROMME
    // call, send and transfer
    function withdrawToMe(uint256 _amount) public {
        require(owner == msg.sender, "you didn't fund this contract");
        // (bool success, ) = payable(msg.sender).call{value: }

        require(_amount < amount, "you didnt put that much bro");
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success == true, "baba go back");
    }
    function getFunders() public view returns (address[] memory) {
        return Funders;
    }
    // 9 ether
    // withdraw 5 ether
    // balance of 4 ether
    function getAmountInAddress() public view returns(uint256) {
        return msg.sender.balance;
    }
}