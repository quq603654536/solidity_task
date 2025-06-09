// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;
// 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数

contract Voting {
    mapping (address account => uint128 vote) public accountVote;
    address[] accountAddress;

    function vote(address account, uint128 voteNum) public {
        if (accountVote[account] == 0) {
            accountAddress.push(account);
        }

        accountVote[account] += voteNum;
    }

    function getVotes(address account) public view returns (uint128){
        return accountVote[account];
    }

    function resetVotes() public {     
        for (uint32 i = 0; i < accountAddress.length; i++) {
            delete accountVote[accountAddress[i]];
        }
    }
}