//
//  Find Center of Star Graph.swift
//  Question Link: https://leetcode.com/problems/find-center-of-star-graph/
//  Primary idea:       (Graph)
//                      1.
//
//  Created by gunhyeong on 2021/04/20.
//

import Foundation

// 1번째 풀이
// Runtime: 1048 ms, faster than 88.50% of Swift online submissions for Find Center of Star Graph.
// Memory Usage: 23.7 MB, less than 56.64% of Swift online submissions for Find Center of Star Graph.
// Primary idea: dictionary를 이용한 방법

class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var edgeInfo = [Int: [Int]]()
        
        for edge in edges {
            let start = edge.first!
            let end = edge.last!
            
            if edgeInfo[start] != nil {
                return start
            } else {
                edgeInfo[start] = [end]
            }
            
            if edgeInfo[end] != nil {
                return end
            } else {
                edgeInfo[end] = [start]
            }
        }

        return 0
    }
}

// 2번째 풀이
// Runtime: 1064 ms, faster than 75.22% of Swift online submissions for Find Center of Star Graph.
// Memory Usage: 23.6 MB, less than 83.19% of Swift online submissions for Find Center of Star Graph.
// Primary idea: 첫번쨰 배열의 값이 2번쨰 배열에 들어있는지 확인하는 방법

class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        return edges[1].contains(edges[0][0]) ? edges[0][0] : edges[0][1]
    }
}
