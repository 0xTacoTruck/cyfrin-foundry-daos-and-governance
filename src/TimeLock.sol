// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Import Timelock Controller form Open Zeppelin
import "@openzeppelin/contracts/governance/TimelockController.sol";

contract TimeLock is TimelockController {
    /**
     * THE FOLLOWING IS TAKEN FROM ABOVE THE CONSTRUCTOR OF TIMELOCKCONTROLLER SO WE CAN UNDERSTAND WHAT WE NEED TO PASS IN
     *
     * @dev Initializes the contract with the following parameters:
     *
     * - `minDelay`: initial minimum delay in seconds for operations
     * - `proposers`: accounts to be granted proposer and canceller roles --> ADDRESSES WHO CAN PROPOSE
     * - `executors`: accounts to be granted executor role --> ADDRESSES WHO CAN EXECUTE
     * - `admin`: optional account to be granted admin role; disable with zero address
     *
     * IMPORTANT: The optional admin can aid with initial configuration of roles after deployment
     * without being subject to delay, but this role should be subsequently renounced in favor of
     * administration through timelocked proposals. Previous versions of this contract would assign
     * this admin to the deployer automatically and should be renounced as well.
     */
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors)
        TimelockController(minDelay, proposers, executors, msg.sender)
    {}
}
