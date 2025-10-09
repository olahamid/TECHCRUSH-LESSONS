// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract NFTTechCrush is ERC721 {

    error NFTTotalMintCountError(uint256 _count);
    string public Name;
    string public Symbol;

    uint256 private lastNFTId;
    string public baseURL;

    uint256 public constant MAX_NFTs = 100;

    constructor (string memory _name, string memory _symbol, string memory _baseURL) ERC721(_name, _symbol ) {
        Name =  _name;
        Symbol = _symbol;
        baseURL = _baseURL;

    }

    // mint function
    // 
    function mintNFT(address _to) public {
        // check
        if (lastNFTId >= MAX_NFTs) {
            revert NFTTotalMintCountError(lastNFTId);
        }
        // effect 
         // this counts nft + 1 as the mintNFT function is called 
        lastNFTId = lastNFTId + 1;

        // interaction 
        _mint(_to, lastNFTId);
    }

    // tokenURI function
    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        string memory json = Base64.encode(
            abi.encodePacked(
            '{"name":"TECHCRUSHNFT #', 
                Strings.toString(tokenId),
                '","description":"This is a dedicated NFT for Tech Crush cohort",',
                '"image":"', baseURL, '",', 
                '"attributes":[{"trait_type":"Cohort","value":"Web3"}]',
                '}'
            )
        );

        // dataURI 
        // encodepacked = a +  b =  ab 
        // b + c = bc
        string memory dataURI = string(abi.encodePacked("data:application/json;base64,", json));
        return dataURI;

    }


    // totalSupply function 
    function totalSupply() public view returns (uint256) {
        return lastNFTId;
    }
    // baseURI function
    function _baseURI() internal view override returns (string memory) {
        return baseURL;
    }
}