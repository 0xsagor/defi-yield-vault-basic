// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Vault is ERC20 {
    IERC20 public immutable token;
    uint256 public totalAssets;

    constructor(address _token) ERC20("Vault Share Token", "vTKN") {
        token = IERC20(_token);
    }

    function deposit(uint256 _amount) external {
        uint256 shares;
        if (totalSupply() == 0) {
            shares = _amount;
        } else {
            shares = (_amount * totalSupply()) / totalAssets;
        }

        token.transferFrom(msg.sender, address(this), _amount);
        totalAssets += _amount;
        _mint(msg.sender, shares);
    }

    function withdraw(uint256 _shares) external {
        uint256 amount = (_shares * totalAssets) / totalSupply();
        _burn(msg.sender, _shares);
        totalAssets -= amount;
        token.transfer(msg.sender, amount);
    }

    // Mock function to simulate yield being added to the vault
    function addYield(uint256 _yieldAmount) external {
        token.transferFrom(msg.sender, address(this), _yieldAmount);
        totalAssets += _yieldAmount;
    }
}
