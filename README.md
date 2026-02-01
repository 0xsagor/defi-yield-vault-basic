# DeFi Yield Vault Basic

This repository demonstrates the core logic of a Decentralized Finance (DeFi) Vault. It mimics the behavior of platforms like Yearn Finance or Beefy.

## Core Logic
* **Deposit:** Users send tokens to the vault and receive shares in return.
* **Strategy:** The vault "invests" these tokens to generate yield (simplified in this version).
* **Withdraw:** Users burn their shares to reclaim their initial deposit plus any earned interest.

## Formula
The share calculation follows the standard vault formula:
$shares = \frac{amount \times total\_shares}{total\_assets}$

## How to test
1. Deploy the `Vault.sol` contract.
2. Approve the Vault to spend your ERC-20 tokens.
3. Call `deposit()` and watch your share balance grow.
