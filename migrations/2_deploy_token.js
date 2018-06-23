const BrandedTokenFactory = artifacts.require('BrandedTokenFactory.sol')

module.exports = deployer => {
  // const args = process.argv.slice()
  deployer.deploy(BrandedTokenFactory);
}