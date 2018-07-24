pragma solidity ^0.4.24;
import "./Factory.sol";
import "./BrandedToken.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";
import "zeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";

contract BrandedTokenFactory is Factory {
    using SafeMath for uint256;
    using SafeERC20 for BrandedToken;

    function create(uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol)
        public
        returns (address brandedTokenAddress)
    {
        BrandedToken brandedToken = new BrandedToken(_initialAmount, _tokenName, _decimalUnits, _tokenSymbol);
        brandedToken.safeTransfer(msg.sender, _initialAmount);
        brandedToken.transferOwnership(msg.sender);
        brandedTokenAddress = address(brandedToken);
        register(brandedTokenAddress);
    }

}
