// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ActivityManager {
    struct CommercialActivity {
        string activityName;
        string description;
        uint256 impact;
    }

    mapping(uint256 => CommercialActivity[]) public commercializationActivities;

    function logActivity(uint256 _patentId, string memory _activityName, string memory _description, uint256 _impact) public {
        commercializationActivities[_patentId].push(CommercialActivity(_activityName, _description, _impact));
    }

    function getActivity(uint256 _patentId, uint256 _index) public view returns (CommercialActivity memory) {
        return commercializationActivities[_patentId][_index];
    }
}
