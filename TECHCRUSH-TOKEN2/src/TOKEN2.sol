// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract TOKEN2 is ERC20{

    string public token_Name;
    string public token_Symbol;
    uint8 public token_Decimal;
    uint256 public token_AmountToMint;

    // ERC20 public token;
    
    constructor (string memory __name, string memory __symbol) ERC20(__name, __symbol) {
        token_Name = __name;
        token_Symbol = __symbol;
        token_Decimal = 18;
        token_AmountToMint = 50 ether;

        _mint(msg.sender, token_AmountToMint);
    } 

}    