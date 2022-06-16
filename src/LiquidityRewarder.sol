// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract LiquidityRewarder {

    uint256 public EPOCH_DURATION; // seconds duration of each epoch

    uint256 public furthestEpochID;
    mapping(uint256 => uint256) public epochBudgets; // epochID => budget amount



    // Has epochs and associated reward budgets

    // TODO make onlyOwner
    function addRewardEpoch(uint256 _rewardAmount, uint256 ) public {

    }


    // TODO make onlyOwner
    function batchAddEpochRewards(uint256[] memory _rewardAmounts, uint256[] memory epochIDs) public {

        // TODO inside for loop
        
        // Check epochID 
    }



    function getEpochID(uint256 _timestamp) public view returns(uint256 epochID) {
        // Returns rounded down number
        // E.g. _timestamp = 230 and EPOCH_DURATION = 20
        // 230 / 20 = 11.5 ==> epochID = 11
        return _timestamp / EPOCH_DURATION;
    }

}
