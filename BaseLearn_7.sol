// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ---------------------------
// Abstract Employee contract
// ---------------------------
abstract contract Employee {
    uint public idNumber;
    uint public managerId;

    constructor(uint _idNumber, uint _managerId) {
        idNumber = _idNumber;
        managerId = _managerId;
    }

    function getAnnualCost() public view virtual returns (uint);
}

// ---------------------------
// Salaried contract
// ---------------------------
contract Salaried is Employee {
    uint public annualSalary;

    constructor(uint _idNumber, uint _managerId, uint _annualSalary)
        Employee(_idNumber, _managerId)
    {
        annualSalary = _annualSalary;
    }

    function getAnnualCost() public view override returns (uint) {
        return annualSalary;
    }
}

// ---------------------------
// Hourly contract
// ---------------------------
contract Hourly is Employee {
    uint public hourlyRate;

    constructor(uint _idNumber, uint _managerId, uint _hourlyRate)
        Employee(_idNumber, _managerId)
    {
        hourlyRate = _hourlyRate;
    }

    function getAnnualCost() public view virtual override returns (uint) {
        return hourlyRate * 2080; // standard yearly hours
    }
}

// ---------------------------
// Manager contract
// ---------------------------
contract Manager {
    uint[] public reportIds;

    function addReport(uint _idNumber) public {
        reportIds.push(_idNumber);
    }

    function resetReports() public {
        delete reportIds;
    }

    function getReports() public view returns (uint[] memory) {
        return reportIds;
    }
}

// ---------------------------
// Salesperson (Hourly employee)
// ---------------------------
contract Salesperson is Hourly {
    constructor(uint _idNumber, uint _managerId, uint _hourlyRate)
        Hourly(_idNumber, _managerId, _hourlyRate)
    {}
}

// ---------------------------
// EngineeringManager (Salaried + Manager)
// ---------------------------
contract EngineeringManager is Salaried, Manager {
    constructor(uint _idNumber, uint _managerId, uint _annualSalary)
        Salaried(_idNumber, _managerId, _annualSalary)
    {}
}

// ---------------------------
// Submission Contract
// ---------------------------
contract InheritanceSubmission {
    address public salesPerson;
    address public engineeringManager;

    constructor(address _salesPerson, address _engineeringManager) {
        salesPerson = _salesPerson;
        engineeringManager = _engineeringManager;
    }
}
