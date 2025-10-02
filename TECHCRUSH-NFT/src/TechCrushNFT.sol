// SPDX-License-Identifier: MIT 
pragma solidity 0.8.30;
import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract TECHCRUSHNFT is ERC721 {
    //  forge install openzeppelin/openzeppelin-contracts

    error NFTDetailsCannotBeZero();
    error NFTTotalMintCountError(uint256 _count);
    string public NFTName;

    string public NFTSymbol;

    string public baseURL;
    // tracks the total amout of nft ive minted 
    uint256 private lastNFTId;
    // max NFTS of techcrush
    uint256 public constant MAX_NFTS = 100;


    constructor (string memory _NFTName, string memory _NFTSymbol,string memory _baseURL) ERC721(_NFTName, _NFTSymbol) {
        if ((bytes(_NFTName).length == 0) ||
        (bytes(_NFTSymbol).length == 0)  || 
        (bytes(_baseURL).length == 0)) {
            revert NFTDetailsCannotBeZero();

        }    
        NFTName = NFTName;
        NFTSymbol = _NFTSymbol;
        
        baseURL = _baseURL;
    }

    // function base URL
    // hamid =  0 =  dog
    // solomon = 1 = cat
    //bukola = 2 = lion
    function getBaseURI(uint256 _id) public view returns (string memory) {
        return tokenURI(_id);
    }

    // tokenURI
    function tokenURI(uint256 tokenId) public view override returns (string memory) {

        //_approve
        //abi.encode and abi.endcodePacked 
        
        //if a data ABC + CD = "ABC""CD" - ABI.ENCODE = bytes memory
        // IF A DATA ABC + CD = "ABCCD" - abi.encodePacked = bytes memory
            //A + bccd or ab + ccd

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

        // return tokenURI(tokenId);
        return string(abi.encodePacked("data:application/json;base64,", json));

    }

    // baseURI
    // function _baseURL() internal view override returns (string memory) {
    //     return baseURL;
    // }

    // mintNFT - setter function
    // setter function dont have returns 
    // getter function have returns 
    function mintNFT() public {
        if (lastNFTId >= MAX_NFTS) {
            revert NFTTotalMintCountError(lastNFTId);
        }
        // if i mint
        lastNFTId = lastNFTId + 1;
        // _safeMint(address to, uint256 tokenId)

        _safeMint(msg.sender, lastNFTId);

    }

    // setURL
    function setURL(string memory _baseURL) public {
        baseURL = _baseURL;
    }

    // totalSupply
    function totalSupply() public view returns(uint256) {
        return lastNFTId;
    }

}