// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//This contract has to be ownable by DAO, import Open Zeppeliln contracts for this
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @notice - This is a very very simple contract that is solely used to demonstrate the functioning of a DAO - which is the main focus of this project
 * @notice - We will have to transfer ownership to the DAO using the transferOwnership function in Open Zeppelin's Ownable contract
 *
 */
contract Box is Ownable {
    uint256 private s_number;

    event NumberChanged(uint256 number);

    // Need to pass initial owner through to the Ownable constructor - which will initially be msg.sender before ownership is transferred
    constructor() Ownable(msg.sender) {}

    // Want only the DAO to be able to call this function
    function storeNewNumber(uint256 _number) public onlyOwner {
        s_number = _number;

        emit NumberChanged(_number);
    }

    function getNumber() external view returns (uint256) {
        return s_number;
    }
}
