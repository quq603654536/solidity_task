// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

// 反转字符串 (Reverse String)
// 题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
contract ReverseString {
    function reverse(string memory str) public pure returns(string memory) {
        bytes memory byteStr = bytes(str);
        bytes memory newStr = new bytes(byteStr.length);
        for (uint256 i = 0; i < byteStr.length; i++) {
            newStr[i] = byteStr[byteStr.length - 1 - i];
        }

        return string(newStr);
    }
}