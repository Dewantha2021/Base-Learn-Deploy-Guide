// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressBook is Ownable {
    // Custom error for when a contact is not found
    error ContactNotFound(uint256 id);
    
    // Struct to represent a contact
    struct Contact {
        uint256 id;
        string firstName;
        string lastName;
        uint256[] phoneNumbers;
    }
    
    // Storage for contacts - mapping from id to Contact
    mapping(uint256 => Contact) private contacts;
    
    // Array to keep track of all contact IDs for getAllContacts
    uint256[] private contactIds;
    
    // Counter for generating unique contact IDs
    uint256 private nextContactId = 1;
    
    constructor(address initialOwner) Ownable(initialOwner) {}
    
    // Add a new contact (only owner can call this)
    function addContact(
        string memory _firstName,
        string memory _lastName,
        uint256[] memory _phoneNumbers
    ) public onlyOwner {
        uint256 contactId = nextContactId;
        nextContactId++;
        
        contacts[contactId] = Contact({
            id: contactId,
            firstName: _firstName,
            lastName: _lastName,
            phoneNumbers: _phoneNumbers
        });
        
        contactIds.push(contactId);
    }
    
    // Delete a contact (only owner can call this)
    function deleteContact(uint256 _id) public onlyOwner {
        if (contacts[_id].id == 0) {
            revert ContactNotFound(_id);
        }
        
        // Delete the contact
        delete contacts[_id];
        
        // Remove from contactIds array
        for (uint256 i = 0; i < contactIds.length; i++) {
            if (contactIds[i] == _id) {
                contactIds[i] = contactIds[contactIds.length - 1];
                contactIds.pop();
                break;
            }
        }
    }
    
    // Get a specific contact by ID
    function getContact(uint256 _id) public view returns (Contact memory) {
        if (contacts[_id].id == 0) {
            revert ContactNotFound(_id);
        }
        return contacts[_id];
    }
    
    // Get all contacts
    function getAllContacts() public view returns (Contact[] memory) {
        Contact[] memory allContacts = new Contact[](contactIds.length);
        uint256 validContactCount = 0;
        
        for (uint256 i = 0; i < contactIds.length; i++) {
            uint256 contactId = contactIds[i];
            if (contacts[contactId].id != 0) {
                allContacts[validContactCount] = contacts[contactId];
                validContactCount++;
            }
        }
        
        // Create a new array with only valid contacts
        Contact[] memory validContacts = new Contact[](validContactCount);
        for (uint256 i = 0; i < validContactCount; i++) {
            validContacts[i] = allContacts[i];
        }
        
        return validContacts;
    }
}
