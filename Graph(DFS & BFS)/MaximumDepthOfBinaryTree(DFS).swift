//
//  MaximumDepthOfBinaryTree(DFS).swift
//  Question Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/
//  Primary idea:   1. DFS방식의 stack을 이용한다.
//                  2. TreeNode를 관리하는 stack
//                  3. 비교할 depth를 관리하는 stack인 valueStack
//                  4. left, right node에 대한 계산

//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/02/10.
//

/**
* Definition for a binary tree node.
* public class TreeNode {
*     public var val: Int
*     public var left: TreeNode?
*     public var right: TreeNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.left = nil
*         self.right = nil
*     }
* }
*/

import Foundation

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard var root = root else {
            return 0
        }
        
        var stack = [TreeNode]()
        var valueStack = [Int]()
        stack.append(root)
        valueStack.append(1)
        
        var maxValue = 0
        
        while !stack.isEmpty {
            let node = stack.popLast() // TreeNode
            let count = valueStack.popLast()
            maxValue = max(maxValue, count!)
            if node?.left != nil {
                stack.append(node!.left!)
                valueStack.append(1+count!)
            }
            
            if node?.right != nil {
                stack.append(node!.right!)
                valueStack.append(1+count!)
            }
        }
        
        return maxValue
    }
}
