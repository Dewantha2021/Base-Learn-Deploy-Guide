// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract WeightedVoting is ERC20 {
    using EnumerableSet for EnumerableSet.AddressSet;
    
    uint public maxSupply = 1_000_000;
    mapping(address => bool) private hasClaimed;
    
    error TokensClaimed();
    error AllTokensClaimed();
    error NoTokensHeld();
    error QuorumTooHigh(uint);
    error AlreadyVoted();
    error VotingClosed();
    
    struct Issue {
        EnumerableSet.AddressSet voters;
        string issueDesc;
        uint votesFor;
        uint votesAgainst;
        uint votesAbstain;
        uint totalVotes;
        uint quorum;
        bool passed;
        bool closed;
    }
    
    struct ReturnableIssue {
        address[] voters;
        string issueDesc;
        uint votesFor;
        uint votesAgainst;
        uint votesAbstain;
        uint totalVotes;
        uint quorum;
        bool passed;
        bool closed;
    }
    
    Issue[] private issues;  // Changed from public to private
    
    enum Vote {
        AGAINST,
        FOR,
        ABSTAIN
    }
    
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        // Burn the zeroeth element
        issues.push();
    }
    
    function claim() public {
        if (totalSupply() >= maxSupply) {
            revert AllTokensClaimed();
        }
        
        if (hasClaimed[msg.sender]) {
            revert TokensClaimed();
        }
        
        hasClaimed[msg.sender] = true;
        _mint(msg.sender, 100);
    }
    
    function createIssue(string memory _issueDesc, uint _quorum) external returns (uint) {
        if (balanceOf(msg.sender) == 0) {
            revert NoTokensHeld();
        }
        
        if (_quorum > totalSupply()) {
            revert QuorumTooHigh(_quorum);
        }
        
        Issue storage newIssue = issues.push();
        newIssue.issueDesc = _issueDesc;
        newIssue.quorum = _quorum;
        
        return issues.length - 1;
    }
    
    function getIssue(uint _id) external view returns (ReturnableIssue memory) {
        Issue storage issue = issues[_id];
        return ReturnableIssue(
            issue.voters.values(),
            issue.issueDesc,
            issue.votesFor,
            issue.votesAgainst,
            issue.votesAbstain,
            issue.totalVotes,
            issue.quorum,
            issue.passed,
            issue.closed
        );
    }
    
    function vote(uint _issueId, Vote _vote) public {
        Issue storage issue = issues[_issueId];
        
        if (issue.closed) {
            revert VotingClosed();
        }
        
        if (issue.voters.contains(msg.sender)) {
            revert AlreadyVoted();
        }
        
        issue.voters.add(msg.sender);
        uint voterBalance = balanceOf(msg.sender);
        
        if (_vote == Vote.FOR) {
            issue.votesFor += voterBalance;
        } else if (_vote == Vote.AGAINST) {
            issue.votesAgainst += voterBalance;
        } else if (_vote == Vote.ABSTAIN) {
            issue.votesAbstain += voterBalance;
        }
        
        issue.totalVotes += voterBalance;
        
        if (issue.totalVotes >= issue.quorum) {
            issue.closed = true;
            if (issue.votesFor > issue.votesAgainst) {
                issue.passed = true;
            }
        }
    }
}