pragma solidity ^0.4.24;
import "./Factory.sol";
import "./BrandedToken.sol";

contract BrandedTokenFactory is Factory {

    function create(uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol)
        public
        returns (address brandedToken)
    {
        brandedToken = new BrandedToken(_initialAmount, _tokenName, _decimalUnits, _tokenSymbol);
        register(brandedToken);
    }

}
