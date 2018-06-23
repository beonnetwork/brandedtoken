pragma solidity ^0.4.24;

import "zeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";
import "zeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/PausableToken.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";

contract BrandedToken is ERC827Token,MintableToken,BurnableToken,PausableToken,DetailedERC20 {
    using SafeERC20 for ERC20;
    using SafeMath for uint256;
    
    uint256 multiplier;
    constructor (
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
    ) DetailedERC20(_tokenName,_tokenSymbol, _decimalUnits) public {
        multiplier = 10**(uint256(_decimalUnits));
        balances[owner] = _initialAmount*multiplier;         // Give the creator all initial tokens
        totalSupply_ = _initialAmount*multiplier;            // Update total supply
    }
}
