//
//  Generate Parentheses.swift
//  Question Link: https://leetcode.com/problems/generate-parentheses/
//  Primary idea:   <BackTracking>
//                  1. 종료 조건
//                      1) input(n)과 완성된 pair의 길이가 같을때 ex) (input*2) == pair.count
//                      2) left의 갯수와 right의 갯수가 같을떄 ex) left == right
//                      3) right의 갯수와 input의 갯수가 같을때 ex) right == input
//                  2. append 조건
//                      1) "(" : left의 갯수 < input의 갯수
//                      2) ")" : right의 갯수 < left의 현재 갯수

//  Runtime :
//  Memory :
//
//  Created by gunhyeong on 2020/03/02.
//

import Foundation

class Solution {
    var input: Int = 0
    var pairs = [String]()
    
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return pairs
        }
        
        self.input = n
        var pair = Array("")
        
        backTracking(&pair, 0, 0) // 초기값
        
        return pairs
    }
    
    func backTracking(_ pair: inout [Character], _ left: Int, _ right: Int){
        if (input*2) == pair.count && left == right && right == input { // 종료 조건
            pairs.append(String(pair))
            return
        }
        
        if left < input {
            pair.append("(")
            backTracking(&pair, left+1, right) // append했기 때문에 left 한개 증가
        }
        
        if right < left {
            pair.append(")")
            backTracking(&pair, left, right+1) // append했기 때문에 right 한개 증가
        }
    }
}
