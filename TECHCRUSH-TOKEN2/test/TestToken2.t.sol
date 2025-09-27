// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {TOKEN2} from "../src/TOKEN2.sol";
import {Script} from "../script/Token2Script.s.sol";
import {Test} from "../lib/forge-std/src/Test.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {StdCheats} from "../lib/forge-std/src/StdCheats.sol";
import {Token2Script} from "../script/Token2Script.s.sol";

contract TestToken2 is Test {
    // call src contract as a state variable
    TOKEN2 public token;
    // call script contract as a state variable
    Token2Script public deployer;

    // actors deployer, sender1, receiver1, sender 2, receiver2 
    // makeAddr-  is a function from stdCheat that hashes the string to give you an address
    address public deployerAddress = makeAddr("deployer");
    address public sender1 = makeAddr("sender1");
    address public receiver1 = makeAddr("receiver1");
    // when ever you are writing a test contract your setUp function must always exists and it is clled as a constructor

    function setUp() public {
        // new is used deploying a contract in a contract 
        // vm.prank is used to replace the caller of a tx as the address given to it.
        //address bukola = makeAddr("Bukola");
        vm.startPrank(deployerAddress);
        token = new TOKEN2("OLaHmaid", "OLH");
        console.log("the new token is", address(token));
        deployer = new Token2Script();
        console.log("the new deployer is", address(deployer));
        
        vm.deal(sender1, 1 ether);
        vm.deal(receiver1, 1 ether);

        token.transfer(sender1, 30 ether);
        // this is used to stop the sender
        vm.stopPrank();
    }

    // test if you can transfer token from sender to receiver
    // transfer is an erc20 function that is used to move money from the caller to the receiver
    function testTransfer() public {
        vm.startPrank(deployerAddress);
        token.transfer(receiver1, 1 ether);
        vm.stopPrank();
    }
    // run test 
    // forge test --match-test testTransfer -vvv

    // to write you must do forge test

    function testBalanceOf() public view {
        // balanceOf function in your erc20 is used to test the balance of a particular address
        uint256 deployerBalance = token.balanceOf(deployerAddress);

        uint256 senderBalance = token.balanceOf(sender1);

        uint256 receceiverBalance = token.balanceOf(receiver1);

        console.log("the deployerBalance is", deployerBalance);
        console.log("the sender Balnce is", senderBalance);
        console.log("receiver balance is", receceiverBalance);
    }

    // allowance is used for setting strict restrictions from sender to receiver.
    // it is literally a the check of a spender for spending an amount on behalf of an owner

    function testAllowance() public {
        // ade... sender sends ade to send 2 ether on behalf of himself

        // we are giving an approval to ade
        address ade = makeAddr("Ade");
        uint256 amountToSend = 1 ether;
        vm.startPrank(sender1);
        token.approve(ade, amountToSend);
        vm.stopPrank();

        // we are sending ade to send on behalf of sender1 
        vm.startPrank(ade);
        // transfer from is basically used for sending money from an address to any other address
        token.transferFrom(sender1, receiver1, amountToSend);
        vm.stopPrank();

        uint256 receceiverBalance = token.balanceOf(receiver1);
        console.log("the amount in my receiver address is", receceiverBalance);
        uint256 senderBalance = token.balanceOf(sender1);
        console.log("the sender Balnce is", senderBalance);
    }


    // test if the transfer exceed balance 
    function testTransferExceedBalance() public {
        uint256 senderBalance = token.balanceOf(sender1);
        console.log("the sender Balnce is", senderBalance);
        uint amountThatExceedBalance = senderBalance + 1 ether;
        vm.startPrank(sender1);
        // the vm.expectRevert is used to catch error that says of a particular statement or logic in your contract 
        vm.expectRevert();
        token.transfer(receiver1, amountThatExceedBalance);
        vm.stopPrank();
    }

    // test total amount to mint 
    function testTotalSupply() public view {
        // get the total supply of the the token OLH
        uint256 totalSupply = token.getTotalSupply();
        console.log("the total supply is", totalSupply);

        // check that the total supply is corrrect
        //assertEq, it checks 2 values to be equal a == b
        assertEq(totalSupply, 50 ether);
    }



}