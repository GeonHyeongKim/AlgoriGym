//
//  Minimum Number of Vertices to Reach All Nodes.swift
//  Question Link: https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/
//  Primary idea:       (Graph)
//                      1. 0~<n 까지의 요소를 가진 set
//                      2. edges의 각 연결된 값의 last!값이 target임으로, set의 값에서 제거
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n)
//  Runtime: 1628 ms
//  Memory Usage: 25.9 MB
//
//  Created by gunhyeong on 2020/10/23.
//

import Foundation

class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var result = [Int]()
        
        var set = Set<Int>(0..<n)
        
        for edge in edges {
            set.remove(edge.last!)
        }
        
        return Array(set)
    }
}
