# SimpleVault Smart Contract

A basic Solidity vault system demonstrating inheritance patterns with secure deposit and withdrawal functionality using OpenZeppelin's SafeCast library.

## Overview

This project consists of two contracts:
- **VaultBase**: Foundation contract handling asset storage and balance tracking
- **VaultManager**: Inherited contract implementing deposit/withdrawal logic

## Features

- ✅ **Inheritance Pattern**: Clean separation of base functionality and management logic
- ✅ **Balance Tracking**: Individual user balance mapping with total deposits counter
- ✅ **SafeCast Integration**: OpenZeppelin library for secure mathematical operations
- ✅ **Event Logging**: Deposit and withdrawal events for transparency
- ✅ **Input Validation**: Prevents zero-amount transactions and insufficient balance withdrawals
- ✅ **Immutable Asset**: Asset address cannot be changed after deployment

## Contract Structure

### VaultBase
- Stores the asset address (immutable)
- Maintains user balance mappings
- Provides balance query functionality

### VaultManager
- Inherits from VaultBase
- Implements deposit and withdrawal functions
- Tracks total deposited amount
- Emits transaction events

## Installation

### Prerequisites
- Solidity ^0.8.24
- OpenZeppelin Contracts

### Using Remix IDE
1. Create a new workspace in [Remix](https://remix.ethereum.org)
2. Install OpenZeppelin contracts:
   ```bash
   npm install @openzeppelin/contracts
   ```
3. Copy the contract code into a new `.sol` file
4. Compile and deploy

## Usage

### Deployment
Deploy the `VaultManager` contract with the target asset address:
```solidity
VaultManager vault = new VaultManager(0x1234...); // Asset contract address
```

### Interacting with the Contract

#### Deposit Tokens
```solidity
vault.deposit(1000); // Deposit 1000 tokens
```

#### Withdraw Tokens
```solidity
vault.withdraw(500); // Withdraw 500 tokens
```

#### Check Balance
```solidity
uint256 balance = vault.getBalance(userAddress);
uint256 myBalance = vault.balances(msg.sender);
```

#### View Total Deposits
```solidity
uint256 total = vault.totalDeposited();
```

## Functions

| Function | Description | Visibility |
|----------|-------------|------------|
| `deposit(uint256)` | Deposit tokens to vault | Public |
| `withdraw(uint256)` | Withdraw tokens from vault | Public |
| `getBalance(address)` | Get user's balance | Public View |
| `balances(address)` | Direct balance mapping access | Public View |
| `totalDeposited()` | Get total amount deposited | Public View |
| `asset()` | Get asset contract address | Public View |

## Events

```solidity
event Deposit(address indexed user, uint256 amount);
event Withdraw(address indexed user, uint256 amount);
```

## Security Features

- **Input validation** prevents zero-amount transactions
- **Balance checks** prevent overdrafts
- **SafeCast library** provides overflow protection
- **Immutable asset** prevents asset switching after deployment

## Important Notes

⚠️ **This is a basic educational contract and lacks several production features:**
- No actual ERC-20 token transfers (interface calls missing)
- No access controls or admin functions
- No pause/emergency mechanisms
- No fee structures
- No reentrancy guards

## Development

### Testing
Test the contract thoroughly on testnets before mainnet deployment.

### Gas Optimization
- Consider using `uint128` for balances to pack storage
- Implement batch operations for multiple transactions

## License

MIT License - see LICENSE file for details.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## Disclaimer

This contract is for educational purposes. Use at your own risk and conduct thorough audits before deploying to mainnet with real funds.
