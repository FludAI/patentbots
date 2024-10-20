// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PatentManager.sol";
import "./LicenseManager.sol";
import "./ActivityManager.sol";

contract PatentController {
    PatentManager public patentManager;
    LicenseManager public licenseManager;
    ActivityManager public activityManager;

    constructor(address _patentManager, address _licenseManager, address _activityManager) {
        patentManager = PatentManager(_patentManager);
        licenseManager = LicenseManager(_licenseManager);
        activityManager = ActivityManager(_activityManager);
    }

    function addPatent(string memory _patentName, uint256 _baseValue) public {
        patentManager.addPatent(_patentName, _baseValue);
    }

    function addLicense(uint256 _patentId, uint256 _royaltyPercentage, address _licensee) public {
        licenseManager.addLicense(_patentId, _royaltyPercentage, _licensee);
    }

    function logActivity(uint256 _patentId, string memory _activityName, string memory _description, uint256 _impact) public {
        activityManager.logActivity(_patentId, _activityName, _description, _impact);
    }

    // Additional functions to interact across contracts can be added here.
}
