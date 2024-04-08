# Decentralised Autonomous Organisations (DAOs) Lesson Notes

This is the second-to-last lesson of the Cyfrin Advanced Foundry course, and the last lesson that doesn't revolve around security or advanced optimisation.

The final lesson of the Advanced Foundry course is titled security and is fairly short, there is a whole other course that Cyfrin offer on security where they will dive deeper into security concepts.

Therefore, take the time to enjoy this introduction to DAOs because it marks the end of some in depth Solidity and Foundry learnings of the Cyfrin/Patrick Collins Blockchain Basics, Solidity 101, Foundry 101 and Advanced Foundry courses before continuing to grind and dive even deeper into this crazy world of Web3 through learning security, low-level languages and formal verification, wallets and post deployment, and self guided study on advanced DeFi topics like Automated Market Makers (AMMs).

The learning journey has been incredible and each time I discover or learn something new, it continues to light the fire to keep on going.

With all that being said, we aren't there yet and right now we get to take a look at DAOs!


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
An easy way to implement voting for users is to use an ERC20 token - like compound, or an NFT as voting power, to enable the ability to vote. Now while this can be the right solution for a DAO and a protocol, it also runs the risk of actually making it more unfair if the voting mechanism is poorly designed and allows the very wealthy to overpower the voting power of everyone else - e.g. a whale buys a HUGE amount of tokens used for voting, they can then vote on proposals as the dominant factor. To put it simply, you could enable a voting mechanism based on 'whoever has the deepest pockets gets to pick teh changes'. The other factort to consider on this point is that of a security threat, if a bad actor was to gain a dominant voting power and propose a bad and malicious proposal that drains the protocol, the attacker could vote and pass the proposal that they create.

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