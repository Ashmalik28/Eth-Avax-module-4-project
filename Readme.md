# Degen Gaming Token
 
## Description 

This is a Solidity smart contract for the "Degen" ERC20 token. The contract extends the functionality of OpenZeppelin's ERC20, Ownable, and ERC20Burnable contracts. The "Degen" token allows users to mint, burn, and redeem tokens for various rewards. The contract also provides a function to freeze and unfreeze user accounts.

---
## Contract Details

1) Network: Fuji Testnet
2) Contract Address: [0x771f01014283b190376E1664716d1e7F5fE0be10]
3) Solidity Version: ^0.8.0
4) License: MIT

## Token Details

1) Token Name: Degen
2) Token Symbol: DGN
3) Decimals: 18

## Functionality

1) **mint(address to, uint256 amount) external onlyOwner:** Allows the contract owner to mint new tokens and send them to the specified address.

2) **burntokens(uint256 amount) external:** Allows users to burn a specific amount of their own tokens.

3) **getRewards() public pure returns (string memory):** Returns a list of available rewards that users can redeem.

4) **redeem(uint256 choice) external:** Allows users to redeem rewards based on their choice. Users must have a sufficient balance of tokens to redeem a reward.

5) **checkBalance() external view returns (uint):** Returns the balance of the calling address.

6) **transfer(address receiver, uint256 amount) public override returns (bool):** Overrides the transfer function from ERC20 to include the freezing functionality and allows users to transfer tokens to other addresses.

7) **transferFrom(address sender, address receiver, uint256 amount) public override returns (bool):** Overrides the transferFrom function from ERC20 to include the freezing functionality and allows approved addresses to transfer tokens on behalf of the owner.

8) **freezeAccount(address account) external onlyOwner:** Allows the contract owner to freeze a specific user account, preventing them from transferring tokens.

9) **unfreezeAccount(address account) external onlyOwner:** Allows the contract owner to unfreeze a previously frozen user account.

10) **isAccountFrozen(address account) public view returns (bool):** Returns whether a specific account is frozen or not.

## Installation ⬇️

### Follow these steps to run this project locally on your system

1. Download or clone the repository by git command.
2. Install the dependencies by running `npm install`.
3. Install truffle by running 'npm install -g truffle' .
4. Download the Hd wallet provider package by npm install @truffle/hdwallet-provider command
5. Then run this command 'truffle migrate --network fuji' to deploy our contract on goerli eth.
6. Your contract will be successfully deployed on fuji network

### Configure MetaMask to use Fuji network  🦊

1. Connect your MetaMask Wallet to the ChainList website.
2. Select the 'Include Testnets' checkbox.
3. Search for "fuji" in the 'Search Networks' tab.
4. Find the fuji network you want to connect to and click 'Add to MetaMask'. It will be automatically added to your wallet.

## Events

The contract emits the following events:

1) **MintToken(address indexed to, uint256 value):** Triggered when new tokens are minted and sent to the specified address.
2) **BurnToken(address indexed from, uint256 value):** Triggered when a user burns a specific amount of tokens.
3) **Redeem_Reward(address indexed player, string itemName):** Triggered when a user successfully redeems a reward.
4) **AccountFrozen(address indexed account):** Triggered when a user account is frozen by the contract owner.
5) **AccountUnfrozen(address indexed account):** Triggered when a frozen user account is unfrozen by the contract owner.
6) **RedeemSuccessMessage(string message):** Triggered when a user successfully redeems a reward. It provides a congratulatory message.

## Conclusion 

The "Degen" token smart contract presented above demonstrates a basic implementation of an ERC20 token with additional features. The contract extends functionalities from the popular OpenZeppelin library, providing ownership management, token burning, and token redemption capabilities.

The "Degen" token contract allows the contract owner to mint new tokens and distribute them to specific addresses. Users can burn their tokens to reduce their balance. Moreover, users have the option to redeem various rewards by exchanging their tokens for specific items, each with a different token value.

The contract also includes a freezing mechanism that allows the contract owner to freeze or unfreeze specific user accounts. Freezing an account prevents the account holder from transferring their tokens until it is unfrozen.
