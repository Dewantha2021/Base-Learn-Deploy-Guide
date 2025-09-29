// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract UnburnableToken {
    mapping(address => uint) public balances;
    uint public totalSupply;
    uint public totalClaimed;
    mapping(address => bool) private hasClaimed;
    
    error TokensClaimed();
    error AllTokensClaimed();
    error UnsafeTransfer(address);
    
    constructor() {
        totalSupply = 100_000_000;
    }
    
    function claim() public {
        if (totalClaimed >= totalSupply) {
            revert AllTokensClaimed();
        }
        
        if (hasClaimed[msg.sender]) {
            revert TokensClaimed();
        }
        
        hasClaimed[msg.sender] = true;
        balances[msg.sender] += 1000;
        totalClaimed += 1000;
    }
    
    function safeTransfer(address _to, uint _amount) public {
        if (_to == address(0) || _to.balance == 0) {
            revert UnsafeTransfer(_to);
        }
        
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}