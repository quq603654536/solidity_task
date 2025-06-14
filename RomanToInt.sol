// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

// 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

// 字符          数值
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
// 例如， 罗马数字 2 写做 II ，即为两个并列的 1 。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

// 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

// I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
// X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。 
// C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
// 给定一个罗马数字，将其转换成整数。

contract RomanToInt {
    function intToRoman(uint32 num) public pure returns (string memory) {
        if (num == 4) {return "IV";}
        if (num == 9) {return "IX";}
        if (num == 40) {return "XL";}
        if (num == 90) {return "XC";}
        if (num == 400) {return "CD";}
        if (num == 900) {return "CM";}

        string memory roman = "";
        while (num > 0) {
            if (num >= 1000) {
                roman = string.concat(roman, "M");
                num -= 1000;    
            } else if (num >= 500) {
                roman = string.concat(roman, "D");
                num -= 500;
            } else if (num >= 100) {
                roman = string.concat(roman, "C");
                num -= 100;
            } else if (num >= 50) {
                roman = string.concat(roman, "L");
                num -= 50;
            } else if (num >= 10) {
                roman = string.concat(roman, "X");
                num -= 10;
            } else if (num >= 5) {
                roman = string.concat(roman, "V");
                num -= 5;
            } else {
                roman = string.concat(roman, "I");
                num -= 1;
            }
        }

        return roman;
    } 

    function romanToInt(string memory roman) public pure returns (uint64) {
        bytes memory romanByte = bytes(roman);
        bytes32 keckak = keccak256(abi.encodePacked(roman));
        if (keckak == keccak256(abi.encodePacked("IV"))) {return 4;}
        if (keckak == keccak256(abi.encodePacked("IX"))) {return 9;}
        if (keckak == keccak256(abi.encodePacked("XL"))) {return 40;}
        if (keckak == keccak256(abi.encodePacked("XC"))) {return 90;}
        if (keckak == keccak256(abi.encodePacked("CD"))) {return 400;}
        if (keckak == keccak256(abi.encodePacked("CM"))) {return 900;}

        uint64 num = 0;
        for (uint32 i = 0; i < romanByte.length; i++) {
            if (romanByte[i] == 'M') {
                num += 1000;
            } else if (romanByte[i] == 'D') {
                num += 500;
            } else if (romanByte[i] == 'C') {
                num += 100; 
            } else if (romanByte[i] == 'L') {
                num += 50;  
            } else if (romanByte[i] == 'X') {
                num += 10;    
            } else if (romanByte[i] == 'V') {
                num += 5;   
            } else{
                num += 1;
            }
        }

        return num;
    }
}