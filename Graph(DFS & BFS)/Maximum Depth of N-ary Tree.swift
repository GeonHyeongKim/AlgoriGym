//
//  Maximum Depth of N-ary Tree.swift
//  Question Link: https://leetcode.com/problems/maximum-depth-of-n-ary-tree
//  Primary idea:   1. 루트노드의 모든 자식 노드들을 방문해서 해당 노드들을 Stack에 넣은 뒤, depth를 계산

//  Time Complexity : O(n^n)
//  Space Complexity : O(n)
//  Runtime: 40 ms
//  Memory Usage: 15.1 MB
//
//  Created by gunhyeong on 2020/12/24.
//

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        var depth = 0
        
        if root == nil { return depth }
        
        var stack = [Node]()
        stack.append(root!)
        
        while !stack.isEmpty {
            depth += 1
            var nodes = [Node]()
            
            for val in stack {
                nodes.append(constenetOf: val.children)
            }
            
            stack = nodes
        }
        
        return depth
    }
}
