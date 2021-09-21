// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "./subtoken.sol";
contract Token{
    string public name;
    string public symbol;
    uint public totalSupply;
    address public owner;
    mapping(address=>uint) balances;

    Sub_token public subToken;

    constructor(string memory _tokenName, string memory _tokenSymbol,uint _totalSupply,string memory _subTokenName, string memory _subTokenSymbol,uint _supplyGranted){
        name = _tokenName;
        symbol = _tokenSymbol;
        totalSupply = _totalSupply;
        owner = msg.sender;
        balances[owner] = totalSupply;
        subToken = new Sub_token(_subTokenName,_subTokenSymbol,_supplyGranted,owner);
    }

    function activationOfsubToken() public{
        subToken.Activation();

    }
}
