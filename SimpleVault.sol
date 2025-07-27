// SPDX-License-Identifier:MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/math/SafeCast.sol";

contract VaultBase {
    using SafeCast for uint256;
    address public immutable asset;
    mapping (address => uint256) public balances;


    constructor (address _asset) {
        asset = _asset;
    }

    function getBalance(address user) public view virtual returns (uint256) {
        return balances [user];
    }
}

contract VaultManager is VaultBase {
    uint256 public totalDeposited;

    constructor (address _asset) VaultBase (_asset) {}

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    function deposit (uint256 _amount) public virtual {
        require (_amount > 0, "Amount must be greater than 0");
        balances[msg.sender] += _amount;
        totalDeposited += _amount;
        
        emit Deposit(msg.sender, _amount);
    }  

    function withdraw (uint256 _amount) public virtual {
        require (_amount >0, "Amount must be greater than 0");
        require (balances [msg.sender] >= _amount, "Insufficient balance");
        balances [msg.sender] -= _amount;
        totalDeposited -= _amount;

        emit Withdraw (msg.sender, _amount);
    }



}
