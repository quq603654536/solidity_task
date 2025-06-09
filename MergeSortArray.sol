// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

// 合并两个有序数组 (Merge Sorted Array)
// 题目描述：将两个有序数组合并为一个有序数组。

contract MergeSortArray {
    function mergeSortedArrays(uint[] memory arr1, uint[] memory arr2) public pure returns (uint[] memory) {
        uint len1 = arr1.length;
        uint len2 = arr2.length;
        uint[] memory merged = new uint[](len1 + len2);
        uint i = 0; // 指向arr1的索引
        uint j = 0; // 指向arr2的索引
        uint k = 0; // 指向merged数组的索引

        while (i < len1 && j < len2) {
            if (arr1[i] < arr2[j]) {
                merged[k] = arr1[i];
                i++;
            } else {
                merged[k] = arr2[j];
                j++;
            }
            k++;
        }

        // 如果arr1还有剩余元素
        while (i < len1) {
            merged[k] = arr1[i];
            i++;
            k++;
        }

        // 如果arr2还有剩余元素
        while (j < len2) {
            merged[k] = arr2[j];
            j++;
            k++;
        }

        return merged;
    }
}