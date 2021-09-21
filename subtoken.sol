// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

contract Sub_token{

    address public Founder;
    string public name;
    string public symbol;
    uint public supplyGranted;
    address public currentHolder;
    bool public activeState;
    mapping(address=>uint) balances;

    constructor(string memory _name,string memory _symbol, uint _supplyGranted, address _founder){

        name = _name;
        symbol= _symbol;
        supplyGranted = _supplyGranted;
        Founder = _founder;
        currentHolder = msg.sender;
        activeState = false;
        balances[currentHolder] = supplyGranted;
    }

    function Activation() external {
        require(msg.sender == Founder,"Not Authorized");
        activeState = true;

    }



}