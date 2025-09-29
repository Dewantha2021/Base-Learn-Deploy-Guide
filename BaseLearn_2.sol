// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Define a custom error for the doNotDisturb function
error AfterHours(uint timeProvided);

contract ControlStructures {

    function fizzBuzz(uint _number) public pure returns (string memory) {
        // Check the most specific condition first: divisible by both 3 and 5
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } 
        // Check condition divisible by 3
        else if (_number % 3 == 0) {
            return "Fizz";
        } 
        // Check condition divisible by 5
        else if (_number % 5 == 0) {
            return "Buzz";
        } 
        // If none of the above conditions are met
        else {
            return "Splat";
        }
    }

    function doNotDisturb(uint _time) public pure returns (string memory) {
        // If _time >= 2400, trigger panic (internal error)
        if (_time >= 2400) {
            assert(_time < 2400); 
        }

        // If _time > 2200 or < 800, revert with custom error
        if (_time > 2200 || _time < 800) {
            revert AfterHours({ timeProvided: _time });
        }
        
        // If _time is between 1200 and 1259, revert with a message
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }
        
        // Check other time conditions
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
        
        // This is a fallback if none of the conditions are met,
        // although the logic above should already cover all possibilities.
        return "";
    }
}
