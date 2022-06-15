// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract LiquidityRewarder {

    uint256 public EPOCH_DURATION; // seconds duration of each epoch

    mapping(uint256 => uint256) public epochBudgets; // end timestamp => budget amount


    // Has epochs and associated reward budgets

    // Make onlyOwner
    function addRewardEpoch(uint256 _rewardAmount, uint256 ) public {

    }



    function getEpochID(uint256 _timestamp) public view returns(uint256 epochID) {
        // Returns rounded down number
        // E.g. _timestamp = 230 and EPOCH_DURATION = 20
        // 230 / 20 = 11.5 ==> epochID = 11
        return _timestamp / EPOCH_DURATION;
    }

}
