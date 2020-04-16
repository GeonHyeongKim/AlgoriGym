/*
*  Group the People Given the Group Size They Belong To.swift
*  Question Link: https://leetcode.com/problems/group-the-people-given-the-group-size-they-belong-to/
*  Primary idea:   <Greedy>
*                  1. size 구분 : groupSizes의 원소별로 구분하여 [Int] 형태로 저장
*                  2. 새로운 그룹 : groupSizes의 원소(index)의 크기와 지금 만들고 있는 그룹(group)의 키기가 같으면 결과값에 저장후, group 초기화(removeAll)
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 68 ms
*  Memory Usage: 21.3MB
*
*  Created by gunhyeong on 2020/04/16.
*/

import Foundation

class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var dict = [Int: [Int]]()
        
        for (index, value) in groupSizes.enumerated() { // 1. size별 구분
            dict[value, default: []].append(index)
        }
        
        for (index, value) in dict {
            var group = [Int]()
            
            for v in value {
                group.append(v)
                if group.count == index { // 2. 새로운 그룹
                    result.append(group)
                    group.removeAll()
                }
            }
        }
                
        return result
    }
}
