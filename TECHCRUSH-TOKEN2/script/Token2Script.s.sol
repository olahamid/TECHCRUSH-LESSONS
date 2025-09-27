// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

import {TOKEN2} from "../src/TOKEN2.sol";
import {Script} from "forge-std/Script.sol";

contract Token2Script is Script {

    TOKEN2 public token;
    function run() external /*returns(TOKEN2)*/{
        vm.startBroadcast();
        token = new TOKEN2("OLAHAMID", "OLH");
        vm.stopBroadcast();
        // return token;
    }
}