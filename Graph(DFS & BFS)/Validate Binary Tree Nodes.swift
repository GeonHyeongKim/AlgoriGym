//
//  Validate Binary Tree Nodes.swift
//  Question Link: https://leetcode.com/problems/validate-binary-tree-nodes/
//  Primary idea:   1.
//
//  Time Complexity:
//  Space Complexity :
//
//  Created by gunhyeong on 2020/12/26.
//

import Foundation

class Solution {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var inCount = Array(repeating:0, count:n)
        for i in 0..<leftChild.count {
                let l = leftChild[i]
                let r = rightChild[i]
                if l >= 0 {
                    inCount[l] = inCount[l] + 1
                }
                if r >= 0 {
                    inCount[r] = inCount[r] + 1
                }
            }
            var zeroIndex : Int? = nil
            for i in 0..<inCount.count {
                let c = inCount[i]
                if  c == 0 {
                    if let zeroIndex = zeroIndex {
                        return false
                    }
                    zeroIndex = i
                }
                
                if c > 1 {
                    return false
                }
            }
            
            if let zeroIndex = zeroIndex {
                if n > 1 && leftChild[zeroIndex] == -1 && rightChild[zeroIndex] == -1 {
                    return false
                }
                return true
            }
            return false
    }
}
