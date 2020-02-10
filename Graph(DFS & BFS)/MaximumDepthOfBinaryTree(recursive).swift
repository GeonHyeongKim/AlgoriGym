//
//  MaximumDepthOfBinaryTree(recursive).swift
//  Question Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/
//  Primary idea:   1. left, right를 호출한다.
//                  2. max(leftMax, rightMax)를 이용한다.

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
        
        var leftMax = maxDepth(root.left)
        var rightMax = maxDepth(root.right)
        return max(leftMax, rightMax) + 1
    }
}
