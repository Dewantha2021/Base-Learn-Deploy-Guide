// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./AddressBook.sol";

contract AddressBookFactory {
    // Deploy a new AddressBook contract and assign caller as owner
    function deploy() public returns (address) {
        AddressBook newAddressBook = new AddressBook(msg.sender);
        return address(newAddressBook);
    }
}
