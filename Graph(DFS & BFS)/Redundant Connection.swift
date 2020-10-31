//
//  Redundant Connection.swift
//  Question Link: https://leetcode.com/problems/redundant-connection/
//  Primary idea:       (Graph)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/10/31.
//

import Foundation

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var map = [Int: [Int]]()
        for edg in edges {
            let org = edg[0]
            let dst = edg[1]
            map[org, default: []].append(dst)
            map[dst, default: []].append(org)
        }

        for edg in edges.reversed() {
            let org = edg[0]
            let dst = edg[1]
            if let arr = map[org] {
                map[org] = arr.filter( { $0 != dst } )
            }
            if let arr = map[dst] {
                map[dst] = arr.filter( { $0 != org } )
            }
            var visited = Set<Int>()
            visited.insert(org)
            if dfs(org, dst, map, &visited) {
                return edg
            }
            map[org, default: []].append(dst)
            map[dst, default: []].append(org)
        }

        return [Int]()
    }

    private func dfs(_ org: Int, _ dst: Int, _ map: [Int: [Int]], _ visited: inout Set<Int>) -> Bool {
        if org == dst {
            return true
        }
        if let arr = map[org] {
            for cur in arr {
                if !visited.contains(cur) {
                    visited.insert(cur)
                    if dfs(cur, dst, map, &visited) {
                        return true
                    }
                }
            }
        }
        return false
    }
}
