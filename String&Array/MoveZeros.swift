/*
*  MoveZeros.swift
*  Question Link: https://leetcode.com/problems/move-zeroes/
*  Primary idea:  데이타 [int]를 for문으로 모두 순회하기
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 8 ms
*  Memory Usage: 20.7 MB
*
*  Created by gunhyeong on 2020/02/03.
*/

import Foundation

class MoveZeros {
    func moveZeros(nums: [Int]) -> [Int] {
        var currentIndex = 0;
        var index = 0
        
        while index != nums.endIndex {
            if nums[index] != 0 {
                nums[currentIndex] = nums[index];
                currentIndex += 1
            }
            index += 1
        }
        
        while (currentIndex < nums.endIndex) {
            nums[currentIndex] = 0;
            currentIndex += 1;
        }
    }
}
