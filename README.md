# Base Learn - Solidity Smart Contract Exercises

A comprehensive collection of Solidity smart contract exercises from the Base Learn platform. These exercises cover fundamental to advanced concepts in Solidity development.

## 📚 Table of Contents

- [Getting Started with Remix](#getting-started-with-remix)
- [Exercise 1: Safe Math with Error Reporting](#baselearn_1---safe-math-with-error-reporting)
- [Exercise 2: Control Structures](#baselearn_2---control-structures)
- [Exercise 3: Storage Optimization](#baselearn_3---storage-optimization)
- [Exercise 4: Array Management](#baselearn_4---array-management)
- [Exercise 5: Mappings & Album Manager](#baselearn_5---mappings--album-manager)
- [Exercise 6: Structs & Garage Manager](#baselearn_6---structs--garage-manager)
- [Exercise 7: Inheritance & Employee Management](#baselearn_7---inheritance--employee-management)
- [Exercise 8: Imports & Haiku Contract](#baselearn_8---imports--haiku-contract)
- [Exercise 9: Error Triage & Debugging](#baselearn_9---error-triage--debugging)
- [Exercise 10: Factory Pattern & Address Book](#baselearn_10---factory-pattern--address-book)
- [Exercise 11: Minimal Token Development](#baselearn_11---minimal-token-development)
- [Exercise 12: ERC-20 Weighted Voting](#baselearn_12---erc-20-weighted-voting)
- [Exercise 13: ERC-721 Haiku NFTs](#baselearn_13---erc-721-haiku-nfts)

---

## 🚀 Getting Started with Remix

### Step 1: Access Remix IDE
1. Navigate to [https://remix.ethereum.org/](https://remix.ethereum.org/)
2. Wait for the IDE to load completely

### Step 2: Create a New File
1. In the **File Explorer** (left sidebar), locate the **contracts** folder
2. Right-click on the **contracts** folder
3. Select **"New File"**
4. Name your file (e.g., `MyContract.sol`)

### Step 3: Write or Import Your Solidity Code
- **Option A - Write from scratch:** Type your Solidity code directly in the editor
- **Option B - Import from GitHub:** 
  - Click the **"Load from GitHub"** button (GitHub icon in File Explorer)
  - Paste the GitHub URL of the `.sol` file
  - Click **"OK"**
- **Option C - Import from local:** 
  - Click the **"Upload"** button (upload icon)
  - Select your `.sol` file from your computer

### Step 4: Compile Your Contract
1. Click on the **"Solidity Compiler"** tab (left sidebar)
2. Select the appropriate compiler version (usually `0.8.x`)
3. Click **"Compile [YourFileName.sol]"**
4. Check for errors in the console below

### Step 5: Deploy Your Contract
1. Click on the **"Deploy & Run Transactions"** tab (left sidebar)
2. Select **Environment:**
   - **"Remix VM"** for testing (default)
   - **"Injected Provider - MetaMask"** for testnet/mainnet deployment
3. Select your contract from the **"Contract"** dropdown
4. If constructor parameters are required, fill them in
5. Click **"Deploy"**
6. Your deployed contract will appear under **"Deployed Contracts"**

### Step 6: Interact with Your Contract
1. Expand your deployed contract
2. Click buttons to call functions
3. For functions with parameters, enter values before clicking
4. View transaction results in the console

---

## BaseLearn_1 - Safe Math with Error Reporting

### 📖 Concept
Learn how to use `unchecked` blocks in Solidity 0.8+ and implement manual overflow/underflow detection with error reporting instead of reverting transactions.

### 🎯 Key Learning Points
- Understanding overflow/underflow in Solidity 0.8+
- Using `unchecked` blocks for gas optimization
- Implementing manual checks for arithmetic operations
- Returning error flags instead of reverting

### 📝 Implementation Details
This contract demonstrates:
- Detection of arithmetic overflow/underflow
- Error flag return mechanism
- Safe math with error reporting pattern

### 🔗 Submit Contract
[Deployment to Testnet Exercise](https://docs.base.org/learn/deployment-to-testnet/deployment-to-testnet-exercise)

---

## BaseLearn_2 - Control Structures

### 📖 Concept
Educational example demonstrating control flow in Solidity using conditional statements and error handling mechanisms.

### 🎯 Key Learning Points
- Using `if/else` statements in Solidity
- Understanding `assert`, `revert`, and custom errors
- Handling different return values based on input
- Control flow best practices

### 📝 Implementation Details
This contract teaches:
- Conditional logic implementation
- Error handling strategies
- Custom error definitions
- Return value management

### 🔗 Submit Contract
[Control Structures Exercise](https://docs.base.org/learn/control-structures/control-structures-exercise)

---

## BaseLearn_3 - Storage Optimization

### 📖 Concept
Learn about storage packing optimization and how to efficiently use storage slots to minimize gas costs.

### 🎯 Key Learning Points
- Storage slot packing (combining `uint16` + `uint32`)
- Custom error definitions (`TooManyShares`)
- Using inline assembly (`sload`) for direct storage access
- Designing efficient state variables
- Creating optimized getters

### 📝 Deployment Parameters
When deploying, use these exact values:
```
shares = 1000
name = "Pat"
salary = 50000
idNumber = 112358132134
```

### 💡 Gas Optimization
By packing `uint16` and `uint32` together in the same storage slot, you can save significant gas costs on storage operations.

### 🔗 Submit Contract
[Storage Exercise](https://docs.base.org/learn/storage/storage-exercise)

---

## BaseLearn_4 - Array Management

### 📖 Concept
Build a simple array management system on the blockchain with timestamp tracking.

### 🎯 Key Learning Points
- Dynamic array operations (store, reset, append)
- Timestamp tracking with sender addresses
- Filtering data based on conditions (Y2K filter)
- Resetting stored data arrays

### 📝 Implementation Details
This contract allows you to:
- Store and manage numbers in arrays
- Track timestamps with sender addresses
- Filter timestamps after a specific date (January 1, 2000)
- Reset all stored data

### 🔗 Submit Contract
[Arrays Exercise](https://docs.base.org/learn/arrays/arrays-exercise)

---

## BaseLearn_5 - Mappings & Album Manager

### 📖 Concept
Create a system for managing approved music albums and tracking individual user favorites using mappings.

### 🎯 Key Learning Points
- Using mappings to store user-specific data
- Managing approved items vs. user preferences
- Retrieving data from nested mappings
- Resetting user-specific data

### 📝 Implementation Details
This contract enables:
- Maintaining a list of approved music albums
- Adding approved albums to user favorites
- Retrieving all approved albums
- Fetching specific user's favorite albums
- Resetting individual user favorites

### 🔗 Submit Contract
[Mappings Exercise](https://docs.base.org/learn/mappings/mappings-exercise)

---

## BaseLearn_6 - Structs & Garage Manager

### 📖 Concept
Implement a garage management system using structs to store complex data about cars.

### 🎯 Key Learning Points
- Defining and using structs
- Managing nested mappings with structs
- Array operations with complex types
- Updating specific struct fields
- Deleting stored structs

### 📝 Implementation Details
This contract allows you to:
- Store car details (make, model, color, number of doors)
- Add new cars to user's personal garage
- Retrieve all cars owned by caller or any user
- Update details of a car at specific index
- Reset user's entire garage

### 🔗 Submit Contract
[Structs Exercise](https://docs.base.org/learn/structs/structs-exercise)

---

## BaseLearn_7 - Inheritance & Employee Management

### 📖 Concept
Build a comprehensive employee management system demonstrating inheritance, abstract contracts, and role hierarchies.

### 🎯 Key Learning Points
- Abstract contracts and interfaces
- Single and multi-level inheritance
- Constructor chaining
- Function overrides
- Managing relationships between contracts

### 📝 Contract Structure
1. **Employee (Abstract)** - Base employee with ID and manager
2. **Salaried** - Employee with annual salary
3. **Hourly** - Employee with hourly rate
4. **Manager** - Can manage direct reports
5. **Salesperson** - Hourly employee role
6. **EngineeringManager** - Salaried employee who manages reports
7. **InheritanceSubmission** - Main contract linking all roles

### ✅ Deployment Instructions in Remix

#### Step 1: Compile
- Compile with Solidity 0.8.x

#### Step 2: Deploy Salesperson
Deploy with parameters:
```
_idNumber = 55555
_managerId = 12345
_hourlyRate = 20
```

#### Step 3: Deploy EngineeringManager
Deploy with parameters:
```
_idNumber = 54321
_managerId = 11111
_annualSalary = 200000
```

#### Step 4: Deploy InheritanceSubmission
Deploy with the addresses from Step 2 and Step 3

### 🔗 Submit Contract
[Inheritance Exercise](https://docs.base.org/learn/inheritance/inheritance-exercise)

---

## BaseLearn_8 - Imports & Haiku Contract

### 📖 Concept
Create a haiku management system demonstrating libraries, structs, and string manipulation.

### 🎯 Key Learning Points
- Using libraries for code reusability
- Working with structs for complex data
- String manipulation in Solidity
- Custom getters for structs
- Importing and using external code

### 📝 Implementation Details
This contract allows you to:
- Store a haiku with three separate lines
- Retrieve the full haiku as a single struct
- Create modified versions with emoji (🤷) without changing original
- Use `SillyStringUtils` library for string operations

### 💡 Key Features
- Demonstrates struct usage for poetry storage
- Shows how to use libraries cleanly
- Implements read/write functions for data management
- Temporary modifications without state changes

### 🔗 Submit Contract
[Imports Exercise](https://docs.base.org/learn/imports/imports-exercise)

---

## BaseLearn_9 - Error Triage & Debugging

### 📖 Concept
Practice debugging common Solidity errors through intentionally buggy functions that demonstrate typical developer mistakes.

### 🎯 Key Learning Points
- Identifying and fixing arithmetic underflow
- Handling type conversions (signed vs unsigned)
- Correct array manipulation techniques
- Using proper deletion vs pop methods
- Comprehensive error testing

### 📝 Bug Fixes Implemented

#### 1. `diffWithNeighbor` - Arithmetic Underflow
**Problem:** Subtracting larger numbers from smaller ones causes underflow

**Solution:** Use conditional logic to ensure `larger - smaller` for absolute difference

#### 2. `applyModifier` - Type Conversion
**Problem:** Adding signed integers to unsigned integers without proper casting

**Solution:** Properly handle signed/unsigned arithmetic with conditional logic

#### 3. `popWithReturn` - Array Operations
**Problem:** Using `delete` instead of `pop()` and trying to return deleted values

**Solution:** 
- Store value before using `pop()` method
- Add safety check for empty arrays

### 🔗 Submit Contract
[Error Triage Exercise](https://docs.base.org/learn/error-triage/error-triage-exercise)

---

## BaseLearn_10 - Factory Pattern & Address Book

### 📖 Concept
Implement the factory pattern to deploy multiple instances of an AddressBook contract.

### 🎯 Key Learning Points
- Factory pattern implementation
- Using the `new` keyword for contract deployment
- Managing multiple contract instances
- Contract-to-contract interactions
- Dynamic address management

### 📝 Implementation Details
This system allows you to:
- Deploy an AddressBookFactory
- Use factory to deploy new AddressBook instances
- Manage contacts with CRUD operations
- Track multiple phone numbers per contact

### ✅ Deployment & Testing Instructions

#### Step 1: Deploy AddressBookFactory
1. Select `AddressBookFactory` from contract dropdown
2. Click **"Deploy"**
3. Note the deployed address

#### Step 2: Deploy AddressBook via Factory
1. In deployed `AddressBookFactory`, click the `deploy` button
2. Copy the returned address from transaction logs
3. Expand transaction details to find the address

#### Step 3: Connect to the New AddressBook
1. In "At Address" field, paste the AddressBook address
2. Click **"At Address"** to connect
3. The AddressBook instance now appears in deployed contracts

#### Step 4: Test AddressBook Functions

**Add a Contact:**
```
firstName: "John"
lastName: "Doe"
phoneNumbers: [1234567890, 9876543210]
```

**Get All Contacts:**
- Click `getAllContacts` to view all contacts

**Get Specific Contact:**
- Use `getContact` with ID `1`

**Delete Contact:**
- Use `deleteContact` with ID `1`

### 🔗 Submit Contract
[New Keyword Exercise](https://docs.base.org/learn/new-keyword/new-keyword-exercise)

---

## BaseLearn_11 - Minimal Token Development

### 📖 Concept
Create an `UnburnableToken` contract implementing basic token functionality with balance tracking and supply management.

### 🎯 Key Learning Points
- Token balance management with mappings
- Total supply tracking
- Claim mechanism implementation
- Basic token economics
- State variable design

### 📝 Contract Requirements

Create a contract called `UnburnableToken` with:

**Storage Variables:**
- `balances` - Public mapping to store token ownership
- `totalSupply` - Public uint for total token supply
- `totalClaimed` - Public uint to track claimed tokens
- Additional variables as needed

**Core Functionality:**
- Token claiming mechanism
- Balance tracking per address
- Supply limit enforcement
- Claim tracking

### 🔗 Submit Contract
[Minimal Tokens Exercise](https://docs.base.org/learn/token-development/minimal-tokens/minimal-tokens-exercise)

---

## BaseLearn_12 - ERC-20 Weighted Voting

### 📖 Concept
Build a comprehensive weighted voting system using ERC-20 tokens where voting power is proportional to token holdings.

### 🎯 Key Learning Points
- ERC-20 token integration
- Weighted voting mechanisms
- Quorum-based decision making
- Using EnumerableSet for voter tracking
- Enum for vote types
- Complex state management

### 📝 Implementation Details

This contract allows you to:

1. **Token Management:**
   - Claim ERC-20 tokens (up to max supply)
   - Token balance determines voting weight

2. **Issue Creation:**
   - Create voting issues with description
   - Set quorum requirements
   - Restricted to token holders

3. **Voting System:**
   - Vote FOR, AGAINST, or ABSTAIN
   - Votes weighted by token balance
   - Prevent double voting with EnumerableSet

4. **Vote Tracking:**
   - Automatic closure when quorum reached
   - Determine if issue passed
   - Track all voters

5. **Data Retrieval:**
   - Custom getter for full issue details
   - Convert EnumerableSet to array
   - View all vote counts

### 💡 Key Features
- **EnumerableSet:** Efficiently prevents double voting
- **Weighted Voting:** Token balance = voting power
- **Quorum System:** Automatic closure and result determination
- **Comprehensive Tracking:** Full visibility into voting process

### 🔗 Submit Contract
[ERC-20 Exercise](https://docs.base.org/learn/token-development/erc-20-token/erc-20-exercise)

---

## BaseLearn_13 - ERC-721 Haiku NFTs

### 📖 Concept
Create a unique haiku NFT platform where each line must be original across the entire platform, implementing ERC-721 standards with custom sharing functionality.

### 🎯 Key Learning Points
- ERC-721 token standard implementation
- NFT minting with uniqueness constraints
- Ownership verification
- Sharing mechanisms between users
- Custom error handling for NFTs
- Complex data structures with mappings

### 📝 Implementation Details

This contract allows you to:

1. **Mint Unique Haikus:**
   - Create haikus as ERC-721 NFTs
   - Ensure no line is reused across platform
   - Store haiku metadata on-chain

2. **Share Haikus:**
   - Share your haikus with other users
   - Track which haikus are shared with whom
   - Maintain ownership while sharing

3. **Retrieve Shared Haikus:**
   - Custom getter for haikus shared with you
   - View all haikus others have shared
   - Query by recipient address

4. **Custom Error Handling:**
   - `HaikuNotUnique` - Prevents duplicate lines
   - `NotYourHaiku` - Ownership verification
   - `NoHaikusShared` - Handle empty results

### 💡 Key Features
- **Uniqueness Guarantee:** Every line must be unique platform-wide
- **Ownership Tracking:** Full ERC-721 compliance
- **Sharing System:** Share without transferring ownership
- **Gas-Efficient Errors:** Custom errors save gas

### 🔗 Submit Contract
[ERC-721 Exercise](https://docs.base.org/learn/token-development/erc-721-token/erc-721-exercise)

---

## 📖 Additional Resources

- [Base Documentation](https://docs.base.org/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Remix IDE](https://remix.ethereum.org/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This project is for educational purposes as part of the Base Learn platform.

---

**Happy Learning! 🚀**

*Last Updated: September 2025*
