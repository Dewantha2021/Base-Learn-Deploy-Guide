// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract HaikuNFT is ERC721 {
    struct Haiku {
        address author;
        string line1;
        string line2;
        string line3;
    }
    
    Haiku[] public haikus;
    mapping(address => uint256[]) public sharedHaikus;
    uint256 public counter = 1;
    
    // Track used lines to ensure uniqueness
    mapping(string => bool) private usedLines;
    
    // Custom errors
    error HaikuNotUnique();
    error NotYourHaiku(uint256 id);
    error NoHaikusShared();
    
    constructor() ERC721("HaikuNFT", "HAIKU") {}
    
    function mintHaiku(string memory _line1, string memory _line2, string memory _line3) external {
        // Check if any line has been used before
        if (usedLines[_line1] || usedLines[_line2] || usedLines[_line3]) {
            revert HaikuNotUnique();
        }
        
        // Mark lines as used
        usedLines[_line1] = true;
        usedLines[_line2] = true;
        usedLines[_line3] = true;
        
        // Create new haiku
        Haiku memory newHaiku = Haiku({
            author: msg.sender,
            line1: _line1,
            line2: _line2,
            line3: _line3
        });
        
        // Add to haikus array
        haikus.push(newHaiku);
        
        // Mint NFT with current counter as token ID
        _safeMint(msg.sender, counter);
        
        // Increment counter for next mint
        counter++;
    }
    
    function shareHaiku(uint256 _haikuId, address _to) public {
        // Check if sender owns the haiku NFT
        if (ownerOf(_haikuId) != msg.sender) {
            revert NotYourHaiku(_haikuId);
        }
        
        // Add haiku ID to the recipient's shared haikus
        sharedHaikus[_to].push(_haikuId);
    }
    
    function getMySharedHaikus() public view returns (Haiku[] memory) {
        uint256[] memory sharedIds = sharedHaikus[msg.sender];
        
        // Check if caller has any shared haikus
        if (sharedIds.length == 0) {
            revert NoHaikusShared();
        }
        
        // Create array to return haikus
        Haiku[] memory mySharedHaikus = new Haiku[](sharedIds.length);
        
        // Populate array with haikus
        for (uint256 i = 0; i < sharedIds.length; i++) {
            // Convert from 1-based token ID to 0-based array index
            mySharedHaikus[i] = haikus[sharedIds[i] - 1];
        }
        
        return mySharedHaikus;
    }
}