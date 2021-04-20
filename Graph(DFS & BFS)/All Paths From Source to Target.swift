//
//  All Paths From Source to Target.swift
//  Question Link: https://leetcode.com/problems/all-paths-from-source-to-target/
//  Primary idea:       (Graph)
//                      1.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime: 108 ms
//  Memory Usage: 16.1 MB
//
//  Created by gunhyeong on 2020/10/16.
//

import Foundation

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        addPath(graph, path: [Int](), node: 0, &result)
        
        return result
    }
    
    func addPath(_ graph: [[Int]], path: [Int], node: Int, _ result: inout [[Int]]) {
        var path = path
        
        if node == graph.count - 1 {
            path.append(node)
            result.append(path)
            return
        }
        
        for e in graph[node] {
            path.append(node)
            addPath(graph, path: path, node: e, &result)
            path.removeLast()
        }
    }
}

//for i in Solution().allPathsSourceTarget([[1,2],[3],[3],[]]) {
//    print(i)
//}


// 2번쨰 풀이
// func 안에 func
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let n = graph.count
        var list = [[Int]]()
        
        func dfs(_ node: Int, _ visit: [Int]) {
            guard node != n-1 else {
                list.append(visit)
                return
            }
                        
            for edge in graph[node] {
                if !visit.contains(edge) {
                    dfs(edge, visit + [edge])
                }
            }
        }
        
        dfs(0, [0])
        return list
    }
}
