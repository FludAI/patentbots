// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LicenseManager {
    struct License {
        uint256 licenseId;
        uint256 patentId;
        address licensee;
        uint256 royaltyPercentage;
        uint256 royaltiesPaid;
    }

    uint256 public licenseCount;
    mapping(uint256 => License) public licenses;

    function addLicense(uint256 _patentId, uint256 _royaltyPercentage, address _licensee) public {
        licenseCount++;
        licenses[licenseCount] = License(licenseCount, _patentId, _licensee, _royaltyPercentage, 0);
    }

    function payRoyalties(uint256 _licenseId, uint256 _amount) public payable {
        License storage license = licenses[_licenseId];
        uint256 royaltyPayment = (_amount * license.royaltyPercentage) / 100;
        license.royaltiesPaid += royaltyPayment;
    }
}
