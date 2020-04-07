/*
*  Reverse String.swift
*  Question Link: https://leetcode.com/problems/reverse-string/
*  Primary idea:   <String & Array>
*                  1. reversed()
*
*  Time Complexity : O(1)
*  Space Complexity : O(1)
*  Runtime: 568 ms
*  Memory Usage: 24.6 MB
*
*  Created by gunhyeong on 2020/04/07.
*/

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        s = s.reversed()
    }
}
