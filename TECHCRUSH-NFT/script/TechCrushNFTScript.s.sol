// SPDX-License-Identifier
pragma solidity 0.8.30;

import {Script} from "../lib/forge-std/src/Script.sol";
import {NFTTechCrush} from "../src/NFTTechCrush.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";
import {console} from "../lib/forge-std/src/console.sol";

contract TechCrushNFTScript is Script {

    // name 
    string public name = "TECHCRUSH NFT";
    // symbol 
    string public symbol = "TCT";
    // baseURl 

    NFTTechCrush public nftTechCrush;

    //a + b + c = abc

    //
    string public svgBase64 = string(abi.encodePacked("data:image/svg+xml;base64,",Base64.encode('<svg width="400" height="400" xmlns="http://www.w3.org/2000/svg">'
        '<rect width="400" height="400" fill="#1a1a1a"/>'
        '<circle cx="200" cy="200" r="80" stroke="#00ff00" stroke-width="8" fill="#ffff00"/>'
        '<text x="200" y="350" font-family="Arial" font-size="24" fill="#ffffff" text-anchor="middle">Tech Crush NFT</text>'
        '</svg>')));

    // encode =  ab + c = "ab""c" ~ ab + c
    //encodePacked = ab + c = abc ~ a + bc or ab + c
    function run() external {
        vm.startBroadcast();
        // initiate my NFT contract 
        nftTechCrush = new NFTTechCrush(name, symbol, svgBase64);

        // mint an nft to the caller 
        nftTechCrush.mintNFT(msg.sender);

        vm.stopBroadcast();
        console.log("hamid is tall");
        address nftTokenAddress = address(nftTechCrush);
        console.log("NFT addr: ", nftTokenAddress);

        string memory nftMemory = nftTechCrush.tokenURI(1);
        console.log("NFT TOKEN URI:", nftMemory);
    }
}


// forge script script/TechCrushNFTScript.s.sol:TechCrushNFTScript --rpc-url http://127.0.0.1:8545 --private-key 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6 --broadcast -vvvv