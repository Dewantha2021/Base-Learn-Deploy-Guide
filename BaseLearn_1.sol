// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BasicMath {

    function adder(uint _a, uint _b) public pure returns (uint sum, bool error) {
        // Use `unchecked` to allow overflow
        unchecked {
            uint c = _a + _b;
            // If the result of addition is smaller than _a, it means overflow occurred
            if (c < _a) {
                return (0, true);
            }
            return (c, false);
        }
    }

    function subtractor(uint _a, uint _b) public pure returns (uint difference, bool error) {
        // Manually check if underflow will occur (when _a is smaller than _b)
        if (_a < _b) {
            return (0, true);
        }
        
        // Use `unchecked` to avoid Solidity’s built-in underflow check that would revert the transaction
        unchecked {
            uint c = _a - _b;
            return (c, false);
        }
    }
}
