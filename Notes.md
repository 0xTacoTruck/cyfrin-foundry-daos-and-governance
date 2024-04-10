# Decentralised Autonomous Organisations (DAOs) Lesson Notes

This is the second-to-last lesson of the Cyfrin Advanced Foundry course, and the last lesson that doesn't revolve around security or advanced optimisation.

The final lesson of the Advanced Foundry course is titled security and is fairly short, there is a whole other course that Cyfrin offer on security where they will dive deeper into security concepts.

Therefore, take the time to enjoy this introduction to DAOs because it marks the end of some in depth Solidity and Foundry learnings of the Cyfrin/Patrick Collins Blockchain Basics, Solidity 101, Foundry 101 and Advanced Foundry courses before continuing to grind and dive even deeper into this crazy world of Web3 through learning security, low-level languages and formal verification, wallets and post deployment, and self guided study on advanced DeFi topics like Automated Market Makers (AMMs).

The learning journey has been incredible and each time I discover or learn something new, it continues to light the fire to keep on going.

With all that being said, we aren't there yet and right now we get to take a look at DAOs!

## This Project DAO Overview

Our DAO is going to be ERC20 token, plutocracy based governance. As we will mention below, this is really not the best way of designing a DAO and its governance due to the risk of enabling the wealthy to have mroe voting power. However, for the purpose of this lesson this is the approach we are going to use to help us learn more about DAOs.

This is a fairly brief lesson and I find the topic super interesting and will spend more time learning about DAOs at the completion of this course to get a better grasp of the topic. I encourage you to do the same.

### Project DAO Features

1. We are going to have a contract that is controlled by a DAO
2. Every transaction the DAO wants to send has to be voted on
3. We will use ERC20 tokens for voting - our own ERC20 token (again, highlighting the importance of this not being great due to risks)


## Introduction to DAOs

### What are DAOs?

DAOs can often be overwhelmed with conceptual definitions, but DAOs are really just 'Any group that is governed by a transparent set of rules found on a blockchain or smart contract' - Patrick Collins.

An easy way to grasp the concept is imagine a large corporation allowed each of its own employees vote on what the company should do. And their votes were all immutable, transaprent and decentralised - this would really show a security-focussed approach to fair voting don't you think? We can really break through trust barriers and give each person in this system power to make a difference. I think this is a really intersting and cool concept and plays into the strength of what blockchains should be and allow.

To bring it back to a coding convention, which is how these are created, they can be summarised as: Company/Organisation Operated Exclusively Through Code.


### Looking into Comppoun to Understand DAOs a Little More

The Compound Protocol is a borrowing and leanding protocol that allows users to borrow and lend their assests and everything that users can do is programmed in smart contracts.

What about if there are new tokens or currencies that aren't listed yet? What about changing reward rates for liquidity providers? what about changing fee percentages? There a lot of different things that could be adjusted and in a centralised world the corporation would just carry these out and make users deal with it. However, Compound also has a Governance section that lists all proposals that have been made and all the different ballots that have been made.

The way proposals are actually proposed is through the use of smart contracts. They are transaction carried out and the data of the transaction details the proposal submission. This can include such things as: proposal of new tokens to accept, what functions to call based on the proposal, etc. Best of all, the proposal is recorded on the blockchain!

Look at this Compound Governance Proposal transaction that was successfully voted on, this the creation of the proposal and if you decode the input data to UTF-8 we can read the proposal summary - [Etherscan Compound Proposal Transaction](https://etherscan.io/tx/0xf554a67e8bcf1ac90950cd6502a3941b09a3b6436a5f3341a0e550fb28dc4aa6).

A short time after the proposal has been submitted, the status of the proposal will be 'active' and it is at this stage where people can begin to vote on on the proposal for a set amount of time.

Once the vote timer has expired, the proposal will be 'closed' and the vote will be tallied. Resutling in either passed/succeeded or failed.

If successful, it will then become queued for execution.

### Voting Mechanisms

We just briefly went over Compound and its governance operations and metnioned how proposals are voted on, but how do we actually vote on things in DAOs? Is there only one voting mechanism? Let's find out.

The voting mechanism chosen in a DAO needs to be carefully considered. There are multiple ways to design and implement voting mechanisms, but there are positives and negatives that need to be considered.

#### EERC20 Tokens and NFTs
An easy way to implement voting for users is to use an ERC20 token - like compound, or an NFT as voting power, to enable the ability to vote. Now while this can be the right solution for a DAO and a protocol, it also runs the risk of actually making it more unfair if the voting mechanism is poorly designed and allows the very wealthy to overpower the voting power of everyone else - e.g. a whale buys a HUGE amount of tokens used for voting, they can then vote on proposals as the dominant factor. To put it simply, you could enable a voting mechanism based on 'whoever has the deepest pockets gets to pick the changes'. The other factort to consider on this point is that of a security threat, if a bad actor was to gain a dominant voting power and propose a bad and malicious proposal that drains the protocol, the attacker could vote and pass the proposal that they create.

NFTs also present the same issues as ERC20s too.

Plus, if an individual was to buy a bunch of voting power, make a bad decision and then sell off that voting power, you as an individual don't get punished but the DAO itself and the group/community involved are punished.

#### 'Skin In the Game'

This approach sees that if you make a decision your vote is recorded, and if that decision leads to a bad outcome, your voting power is revoked and removed from you - you get punished for acting maliciously or carelessly and affecting the DAO and protocol.

The biggest challenge with this approach is how do we decide what is a bad outcome as a community. There is no clear cut answer here.

#### Proof of Personhood or Participation

This approach sees that a user of the protocol or DAO is 1 user, and 1 user should only have 1 vote, or at least a very specific and restricited number of votes. This would truly be an extremely fair voting mechanism where you can't just buy voting power. The issue with this though is something known as Sybil Resistance, how can we be sure it is 1 user to 1 vote and not 1 user pretending to be 1000 users who each get 1 vote?

This method hasn't been fully developed yet and I believe that as Zero Knowledge proofs become more and more standard, there is potential in this space to achiever this because we can store the metadata of personhood off-chain and still have a proof to validate that it is 1 user to 1 vote.

### On-Chain Voting vs Off-Chain voting

We can easily carry out voting on-chain by calling a function as part of a transaction and its all good. However, when we send trasnactions there is Gas fees and if you had 10,000 people voting on something and to vote cost \$100 then you would cost the community \$1,000,000 just o freaking vote for every single change! Even though the architecure is very simple, it is very powerful it's also very expensive and will likely hurt the protocol and DAO in the long run when no-one can afford to vote.

There are a lot of variation of this approach to try and help solve this, with Governor C being one of them. ***DO SOME OWN RESEARCH ON WHAT GOVERNOR C IS***

Off-chain voting saves on gas fees and provides a more efficient way to vote, but presenting challenges in regards to centralised intermediaries. With off-chain votoing, you can still sign a transaction but not send it to the blockahain and instead send it to a decentralised database like IPFS which costs zero gas but is still decentrally stored and ther count up all the votes and pass that to the blockchain in a single transaction. You could replay all these side transaction as a single transaction and can save up to 99% in voting costs! This is one of the most popular methods right now to do this and [Snapshot](https://snapshot.org/#/) is probably the most well-known - its an off-chain voting platform - You will see Patrick absolutely die over really wanting to have a Chainlink Integration built to allow these sorts of mechanisms bring data and voting from off-chain to on-chain in a more secure method.

Obviosuly, we need to avoid a centralised off-chain to on-chain voting system because at that point we have just re-introduced the problem we were avoiding.

### Tools for Building a DAO

There are several no-code solutions and more tech-focused tools to help you build a DAO, including:
- DAOstack
- Aragon
- Colony
- DaoHouse
- Snapshot
- Zodiac
- Tally
- Gnosis safe
- OpenZeppelin contracts

### Introduction Wrap up - Legal Considerations of DAOs

"Before wrapping up, it's essential to touch briefly on the legal aspects of DAOs. DAOs are in a gray area operationally, with the state of Wyoming in the United States being the only state where a DAO can be legally recognized. Read up on the legal implications before you dive into creating your DAO" - Patrick Collins, Cyfrin

See how would you force a DAO to do something? You can just tell eveyone that they have to vote in a direction of something? Its all new and intersting and if planning on launching something in production then you should be aware of these things.

## DAOs Tooling - Introduction to Aragon

[Aragon](https://app.aragon.org/) is ano code solution that can help you create a DAO. It allows an extremely simple way to generate the smart contracts required to launch a DAO.

You can select what blockchain to use, provide the DAOs name, ENS subdomain, logo, description any additional links. It allows users to select who and how parties can participate - token holders or multisig members. It can even allow a very simplified token distribution as part of the set up.

It also provides prompts on how you would like proposals to be created and what things are required to make the proposal - e.g token holders vs anyone, minimum token amount to propose, etc.

Fo goverance settings, they even allow you to select what support threshold you would like for deciding to pass or reject a proposal, as well as the minimum participation required for the proposal to be valid - e.g. 15% of all token supply.

You can decide the minimum amount of time that a proposal should be open for voting - e.g. 1 day, 1 hour, 1 minute.

Whether to execute early if the proposal threhold requirements are already met.

Would you like users to be able to change their votes during the voting period or have the votes fixed to the end of the voting period.

The application website also allows you to interact with the DAOs, where you can do things like: make a proposal, make a treasury deposit, and view your voting power.

## The DAO in this Project

I want to highlight that we are leveraging a lot of the coding work from Open Zeppelin and therfore it is difficult to write in a bunch of information of how to programmatically code certain functions/features in great detail. Instead, what I will do is write what I think are interesting or key to understanding.

### Ownership

Its important to make the distinction between the governance of the DAO and the protocol itself. The are two separate things and are deployed separately on-chain. The most important thing to implement is ownership over the protocol.

By using the Open Zeppelin Ownable import we can assign ownership to the DAO. Initially, ownership will belong to us but we can then call the transferOwnership function to give ownership to the DAO contract.

### How the Proposal contains what we want to protocol to do

If we look inside the Open Zeppelin Governor.sol file, we will see the propose function:

```
 /**
* @dev See {IGovernor-propose}. This function has opt-in frontrunning protection, described in {_isValidDescriptionForProposer}.
*/
function propose(
    address[] memory targets,
    uint256[] memory values,
    bytes[] memory calldatas,
    string memory description
) public virtual returns (uint256) {
    address proposer = _msgSender();

    // check description restriction
    if (!_isValidDescriptionForProposer(proposer, description)) {
        revert GovernorRestrictedProposer(proposer);
    }

    // check proposal threshold
    uint256 proposerVotes = getVotes(proposer, clock() - 1);
    uint256 votesThreshold = proposalThreshold();
    if (proposerVotes < votesThreshold) {
        revert GovernorInsufficientProposerVotes(proposer, proposerVotes, votesThreshold);
    }

    return _propose(targets, values, calldatas, description, proposer);
}
```

We can see a number of different paramater input variables that make up the proposal function, we will quickly cover them here:

- targets
  - What addresses are needed to be used for this proposal's transaction/s to be executed --> will it be more than 1 transaction?
  - Can be 1 or more target addresses --> [0x28747df3, 0x26709ac3]
- values
  - What value do we need to pass when we interact with one of the target addresses detailed above as part of each transaction
  - Can be 1 or more values --> [0, 150]
- calldatas
  - The bytes data that we are sending to the addresses detailed above. Now we know about function selectors, function sigantures and stuff, we can understand how we can have the DAO call any function and send any data that we want to or need to for the provided target address/smart contract
- description
  - This is just for the internal state of the Governor
  - e.g. "Proposal to mint 100 tokens" or "proposal to pay for security services provided by Steve Inc"

### Execute Function

The execute function is used to execute the proposal. It accepts the same paramters as the propose function. It will cary out checks to ensure we can execute the proposal correctly before calling an internal _execute function.

The execute function looks like this:
```
/**
    * @dev Internal execution mechanism. Can be overridden (without a super call) to modify the way execution is
    * performed (for example adding a vault/timelock).
    *
    * NOTE: Calling this function directly will NOT check the current state of the proposal, set the executed flag to
    * true or emit the `ProposalExecuted` event. Executing a proposal should be done using {execute} or {_execute}.
    */
function _executeOperations(
    uint256 /* proposalId */,
    address[] memory targets,
    uint256[] memory values,
    bytes[] memory calldatas,
    bytes32 /*descriptionHash*/
) internal virtual {
    for (uint256 i = 0; i < targets.length; ++i) {
        (bool success, bytes memory returndata) = targets[i].call{value: values[i]}(calldatas[i]);
        Address.verifyCallResult(success, returndata);
    }
}
```

We can see how we can have multiple targets, values and calldats to be executed and how we actually execute the proposal. Before calling this internal function the normal execute function hashes the description that was provided, then the internal has the description hash param input but it is commented out and therfore not used. I think this idea of making proposals and then being able to execute the proposals is super interesting and cool - all done programmatically, sickkkk.

### Timelock Controller

For our project, we decided that we wanted to incorporate a timelock on executing successful proposals to allow time for users to leave the DAO if they so wish, or to allow for any emergency actions to take place.

The GovernorTimelockControl.sol file that contains the logic for handling such operations. The following is an excerpt from the file:

```
/**
 * @dev Extension of {Governor} that binds the execution process to an instance of {TimelockController}. This adds a
 * delay, enforced by the {TimelockController} to all successful proposal (in addition to the voting duration). The
 * {Governor} needs the proposer (and ideally the executor) roles for the {Governor} to work properly.
 *
 * Using this model means the proposal will be operated by the {TimelockController} and not by the {Governor}. Thus,
 * the assets and permissions must be attached to the {TimelockController}. Any asset sent to the {Governor} will be
 * inaccessible from a proposal, unless executed via {Governor-relay}.
 *
 * WARNING: Setting up the TimelockController to have additional proposers or cancellers besides the governor is very
 * risky, as it grants them the ability to: 1) execute operations as the timelock, and thus possibly performing
 * operations or accessing funds that are expected to only be accessible through a vote, and 2) block governance
 * proposals that have been approved by the voters, effectively executing a Denial of Service attack.
 .......
 .......
 */
```

Essentially what it is saying is that we need a TimelockController contract that is deployed to actually be the owner of the Governor contract so that we can carry out these sort of operations, and that the governor needs to be designed in a way that allows the execution of the proposal to be delayed for a set amount of time to be carried out by the timelockcontrol contract.

Thankfully Open Zeppelin also have us covered for a TimelockController contract and the following is taken from TimelockController.sol:
```
/**
 * @dev Contract module which acts as a timelocked controller. When set as the
 * owner of an `Ownable` smart contract, it enforces a timelock on all
 * `onlyOwner` maintenance operations. This gives time for users of the
 * controlled contract to exit before a potentially dangerous maintenance
 * operation is applied.
 *
 * By default, this contract is self administered, meaning administration tasks
 * have to go through the timelock process. The proposer (resp executor) role
 * is in charge of proposing (resp executing) operations. A common use case is
 * to position this {TimelockController} as the owner of a smart contract, with
 * a multisig or a DAO as the sole proposer.
 */
```


## Useful Links for Further Reading and Learning

[OpenZeppelin Forum - what-is-votecastbysig](https://forum.openzeppelin.com/t/what-is-votecastbysig/17069/2)

[Compound - Governance](https://compound.finance/governance)

[Maker DAO - Governance Page](https://vote.makerdao.com/)

[Vitalik - Plutocracy is still bad, 2018](https://vitalik.eth.limo/general/2018/03/28/plutocracy.html)

[Vitalik - DAOs are not corporations, 2022](https://vitalik.eth.limo/general/2022/09/20/daos.html)

[Vitalik's Website full of articles](https://vitalik.eth.limo/)