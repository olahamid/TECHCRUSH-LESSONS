// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract receiveFallbackExample {
    address public owner;
    //.send 
    //.transfer 
    //.call
    // receive and fallback are special keywords in solidity, that are used to receive ether from other addresses or contract

    // is my msg.data empty? answer no 
    // if no, it will call your fallback function.
    //if yes, it will go to the receive function.abi


    // if it calling your receive fuction, it will check your contract to see if you have the receive function 
    // if you do, it i will call receive function
    // if you dont have it, it will check if you have the fallback function


                //ADE is calling deposit
//                          |
                // msg.data is empty?
//                        /   \
//      (transfer, send) yes    no(call)
//                       /       \   
//               (receive)      (fallback function)
//                  |           
//         do you have the receive?    
//            /      \  
//          yes       no
//          |          |
//      call receive   do you have fallback function? 
        
    receive() external payable {
        owner = msg.sender;
    } 
        function deposit() public payable {
        //method 1
        payable(msg.sender).transfer(msg.value);
        //method 2
        //(bool success,) = payable(msg.sender).send(msg.value);

        // if you are using .call 
        // method 3
        // (bool <var name>) <address from>.call{value:<amount>}(msg.data);
        //         (bool success, ) = payable(msg.sender).call{value: _amount}("");
        // require(success == true, "baba go back");
    }

}