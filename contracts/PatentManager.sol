// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatentManager {
    struct Patent {
        uint256 patentId;
        string patentName;
        address owner;
        uint256 baseValue;
    }

    uint256 public patentCount;
    mapping(uint256 => Patent) public patents;

    function addPatent(string memory _patentName, uint256 _baseValue) public {
        patentCount++;
        patents[patentCount] = Patent(patentCount, _patentName, msg.sender, _baseValue);
    }

    function getPatent(uint256 _patentId) public view returns (Patent memory) {
        return patents[_patentId];
    }
}
