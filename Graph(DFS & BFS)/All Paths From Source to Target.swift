//
//  All Paths From Source to Target.swift
//  Question Link: https://leetcode.com/tag/graph/
//  Primary idea:       (Graph)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/10/16.
//

import Foundation

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        addPath(graph, [0], &result)
        
        return result
    }
    
    func addPath(_ graph: [[Int]], _ originGraph: [[Int]], _ currentPath: [Int], _ result: inout [[Int]]) {
        if graph.count == 0 || graph[0].count == 0 {
            result.append(current)
            return
        }
        
        for g in graph[0] {
            addPath(Array(originGraph[g..<originGraph.count]), originGraph, current + [g], &result)
        }
    }
}
