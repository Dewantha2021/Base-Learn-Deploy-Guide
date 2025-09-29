// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// ---------------------------
// Library: SillyStringUtils
// ---------------------------
library SillyStringUtils {

    struct Haiku {
        string line1;
        string line2;
        string line3;
    }

    function shruggie(string memory _input) internal pure returns (string memory) {
        return string.concat(_input, unicode" 🤷");
    }
}

// ---------------------------
// Contract: ImportsExercise
// ---------------------------
contract ImportsExercise {
    using SillyStringUtils for string;

    // Public haiku instance
    SillyStringUtils.Haiku public haiku;

    // ---------------------------
    // Save Haiku
    // ---------------------------
    function saveHaiku(
        string memory _line1, 
        string memory _line2, 
        string memory _line3
    ) public {
        haiku = SillyStringUtils.Haiku({
            line1: _line1,
            line2: _line2,
            line3: _line3
        });
    }

    // ---------------------------
    // Get Haiku
    // ---------------------------
    function getHaiku() public view returns (SillyStringUtils.Haiku memory) {
        return haiku;
    }

    // ---------------------------
    // Shruggie Haiku (adds 🤷 to line3)
    // ---------------------------
    function shruggieHaiku() public view returns (SillyStringUtils.Haiku memory) {
        SillyStringUtils.Haiku memory modifiedHaiku = haiku;
        modifiedHaiku.line3 = SillyStringUtils.shruggie(modifiedHaiku.line3);
        return modifiedHaiku;
    }
}
