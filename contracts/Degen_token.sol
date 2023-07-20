// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Degen_Token is ERC20, Ownable, ERC20Burnable {
    event MintToken(address indexed to, uint256 value);
    event BurnToken(address indexed from, uint256 value);
    event Redeem_Reward(address indexed player, string itemName);
    event AccountFrozen(address indexed account);
    event AccountUnfrozen(address indexed account);
    event RedeemSuccessMessage(string message);

    mapping(address => bool) private _frozenAccounts;

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit MintToken(to, amount);
    }

    function burntokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance , Please earn or buy some more tokens");
        _burn(msg.sender, amount);
        emit BurnToken(msg.sender, amount);
    }

    function getRewards() public pure returns (string memory) {
        return
            "1. Legendary Dragon Sword (value = 1000 Degen)\n2. Ancient Elf Bow (value = 500 Degen)\n3. Thundering Warhammer (value = 350 Degen)\n4. Enchanted Wizard Robe (value = 800 Degen)\n5. Shimmering Potion of Invisibility (value = 250 Degen)";
      }
    


    function redeem(uint256 choice) external {
    require(choice <= 5, "Invalid selection");

    if (choice == 1) {
        require(balanceOf(msg.sender) >= 1000, "Insufficient balance, please earn or buy some more tokens");
        _transfer(msg.sender, owner(), 1000);
        emit Redeem_Reward(msg.sender, "Legendary Dragon Sword");
        emit RedeemSuccessMessage("Congratulations! You have successfully redeemed the Legendary Dragon Sword.");
    } else if (choice == 2) {
        require(balanceOf(msg.sender) >= 500, "Insufficient balance, please earn or buy some more tokens");
        _transfer(msg.sender, owner(), 500);
        emit Redeem_Reward(msg.sender, "Ancient Elf Bow");
        emit RedeemSuccessMessage("Congratulations! You have successfully redeemed the Ancient Elf Bow.");
    } else if (choice == 3) {
        require(balanceOf(msg.sender) >= 350, "Insufficient balance, please earn or buy some more tokens");
        _transfer(msg.sender, owner(), 350);
        emit Redeem_Reward(msg.sender, "Thundering Warhammer");
        emit RedeemSuccessMessage("Congratulations! You have successfully redeemed the Thundering Warhammer.");
    } else if (choice == 4) {
        require(balanceOf(msg.sender) >= 800, "Insufficient balance, please earn or buy some more tokens");
        _transfer(msg.sender, owner(), 800);
        emit Redeem_Reward(msg.sender, "Enchanted Wizard Robe");
        emit RedeemSuccessMessage("Congratulations! You have successfully redeemed the Enchanted Wizard Robe.");
    } else if (choice == 5) {
        require(balanceOf(msg.sender) >= 250, "Insufficient balance, please earn or buy some more tokens");
        _transfer(msg.sender, owner(), 250);
        emit Redeem_Reward(msg.sender, "Shimmering Potion of Invisibility");
        emit RedeemSuccessMessage("Congratulations! You have successfully redeemed the Shimmering Potion of Invisibility.");
    }
}

    function checkBalance() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    function transfer(address reciever, uint256 amount) public override returns (bool) {
        return super.transfer(reciever, amount);
    }

    function transferFrom(address sender, address reciever, uint256 amount) public override returns (bool) {
        approve(msg.sender, amount);
        return super.transferFrom(sender, reciever, amount);
    }

    function freezeAccount(address account) external onlyOwner {
        _frozenAccounts[account] = true;
        emit AccountFrozen(account);
    }

    function unfreezeAccount(address account) external onlyOwner {
        _frozenAccounts[account] = false;
        emit AccountUnfrozen(account);
    }

    function isAccountFrozen(address account) public view returns (bool) {
        return _frozenAccounts[account];
    }
}












