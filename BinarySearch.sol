// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract BinarySearch {
    function search(uint256[] memory sortedArray, uint256 value) public pure  returns (bool) {
       uint left = 0;
       uint right = sortedArray.length - 1;
       while (left <= right) {
         uint mid = left + (right - left) / 2;
         uint256 num = sortedArray[mid];
         if (num == value) {
            return true;
         } else if (num > value) {
            right = mid - 1;
         } else {
            left = mid + 1;
         }
       }

       return false;
    }
}