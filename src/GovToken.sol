// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.18;

// We are just going to leverage OpenZeppelin's ERC20 contract wizard for this since we really just need the basic ERC20 token contract and don't have to re-write it all from scratch

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Implementation of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on `{IERC20-approve}`, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
 */
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/**
 * @dev Extension of ERC20 to support Compound-like voting and delegation. This version is more generic than Compound's,
 * and supports token supply up to 2^208^ - 1, while COMP is limited to 2^96^ - 1.
 *
 * NOTE: This contract does not provide interface compatibility with Compound's COMP token.
 *
 * This extension keeps a history (checkpoints) of each account's vote power. Vote power can be delegated either
 * by calling the {delegate} function directly, or by providing a signature to be used with {delegateBySig}. Voting
 * power can be queried through the public accessors {getVotes} and {getPastVotes}.
 *
 * By default, token balance does not account for voting power. This makes transfers cheaper. The downside is that it
 * requires users to delegate to themselves in order to activate checkpoints and have their voting power tracked.
 */
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

import {Nonces} from "@openzeppelin/contracts/utils/Nonces.sol";

contract GovToken is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("GovToken", "GTK") ERC20Permit("GovToken") {}

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Votes) {
        super._update(from, to, value);
    }

    function nonces(address owner) public view override(ERC20Permit, Nonces) returns (uint256) {
        return super.nonces(owner);
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
