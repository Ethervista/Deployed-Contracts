// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;                                                            

import "./token.sol";  

contract safeTokenFactory {
    event safeTokenCreated(address tokenAddress, string name, string symbol);
    mapping(address => bool) public whitelistedTokens;

    function create(string memory name, string memory symbol,uint256 supply, bool vistaOnly) external returns (address) {
        Token safeToken = new Token(name, symbol, supply, vistaOnly);
        
        emit safeTokenCreated(address(safeToken), name, symbol);
        
        whitelistedTokens[address(safeToken)] = true;
        return address(safeToken);
    }
}