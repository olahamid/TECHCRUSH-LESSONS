// SPDX-License-Identifier
pragma solidity 0.8.30;

import {Script} from "../lib/forge-std/src/Script.sol";
import {NFTTechCrush} from "../src/NFTTechCrush.sol";

contract TechCrushNFTScript is Script {

    // name 
    string public name = "TECHCRUSH NFT";
    // symbol 
    string public symbol = "TCT";
    // baseURl 
    //a + b + c
    string public baseURI = string(abi.encodePacked("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MDAiIGhlaWdo","dD0iNDAwIj4KPHJlY3Qgd2lkdGg9IjQwMCIgaGVpZ2h0PSI0MDAiIGZpbGw9IiMwZjE3MmEiLz4K","PGNpcmNsZSBjeD0iMjAwIiBjeT0iMjAwIiByPSIxMjAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzNi","ODJmNiIgc3Ryb2tlLXdpZHRoPSI0Ii8+CjxjaXJjbGUgY3g9IjIwMCIgY3k9IjIwMCIgcj0iMTAw","IiBmaWxsPSJub25lIiBzdHJva2U9IiM2MGE1ZmEiIHN0cm9rZS13aWR0aD0iMiIvPgo8dGV4dCB4","PSIyMDAiIHk9IjE5MCIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9","IjQ4IiBmb250LXdlaWdodD0iYm9sZCIgZmlsbD0iIzNiODJmNiIgdGV4dC1hbmNob3I9Im1pZGRs","ZSI+VEM8L3RleHQ+Cjx0ZXh0IHg9IjIwMCIgeT0iMjMwIiBmb250LWZhbWlseT0iQXJpYWwsIHNh","bnMtc2VyaWYiIGZvbnQtc2l6ZT0iMjAiIGZpbGw9IiM2MGE1ZmEiIHRleHQtYW5jaG9yPSJtaWRk","bGUiPkNPSE9SVDwvdGV4dD4KPHRleHQgeD0iMjAwIiB5PSIzMjAiIGZvbnQtZmFtaWx5PSJBcmlh","bCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSIxNiIgZmlsbD0iIzk0YTNiOCIgdGV4dC1hbmNob3I9","Im1pZGRsZSI+V2ViMyBCdWlsZGVyPC90ZXh0Pgo8L3N2Zz4="))";

    function run() external {
        
    }
}