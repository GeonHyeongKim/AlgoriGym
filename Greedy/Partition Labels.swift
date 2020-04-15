/*
*  Partition Labels.swift
*  Question Link: https://leetcode.com/problems/partition-labels/
*  Primary idea:   <Greedy>
*                  1. end index : directory를 이용하여, 마지막 index 저장
*                  2. 최댓값 : 파티션에 속한 문자들의 마지막 index를 알아낸다.
*                  3. 조건 : 최댓값과 파티션의 모든 문자를 탐색하는 index(i)가 같아 졌을때, parition으로 구분
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/15.
*/

import Foundation

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var partition = [Int]()
        var endIndex = [Character:Int]()
        
        for (i, char) in S.enumerated() { // 1. end index
            endIndex[char] = i
        }
        
        var maxLast = 0
        var anchor = 0
        for (i, char) in S.enumerated() {
            maxLast = max(maxLast, endIndex[char]!) // 2. 최댓값
            
            if i == maxLast { // 3. 조건
                partition.append(i-anchor+1)
                anchor = i+1
            }
        }
        
        return partition
    }
}
