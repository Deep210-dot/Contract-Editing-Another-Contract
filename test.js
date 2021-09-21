const chai = require('chai');
const assert = chai.assert;

const SubToken_C = artifacts.require('subtoken');
const Token_C = artifacts.require('token');

beforeEach(async () => { 
    const tokenName = "input";
    const tokenSymbol = "input";
    const totalSupply = "input"
    const subTokenName = "input";
    const subTokenSymbol = "input";
    supplyGranted = "input";
    Token = await Token_C.new(tokenName,tokenSymbol,totalSupply,subTokenName,subTokenSymbol,supplyGranted);
    tokenAddress = Token.address;

    //Deploying Token
    Token_Contract = await Token_C.at(tokenAddress);

    //Deploying SubToken
    subTokenAddress = await Token_Contract.subToken();
    SubToken_Contract = await SubToken_C.at(subTokenAddress);
});

describe('Token Contract',() => {
    it('should set Token Contract as the Owner of SubToken Contract',async () =>{
        const founderOfSubToken = await SubToken_Contract.founder.call();
        assert.equal(founderOfSubToken,tokenAddress);
    });
});

describe('SubToken Contract', () => {
    it('should be activated only when called by owner',async() =>{
        await Token_Contract.activationOfsubToken();
        const state = await SubToken_Contract.activeState.call();
        assert.equal(state,true);
    })
})