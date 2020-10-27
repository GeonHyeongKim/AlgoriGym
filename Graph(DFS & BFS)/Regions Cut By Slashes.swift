//
//  Regions Cut By Slashes.swift
//  Question Link: https://leetcode.com/problems/regions-cut-by-slashes/
//  Primary idea:       (Graph)
//                      1. 문자에 대한 배열값(3*3)으로 치환한다.
//                          i) "/" :    0 0 1   ii) "\\" :  1 0 0
//                                      0 1 0               0 1 0
//                                      1 0 0               0 0 1
//                      2. map(6*6)에 1의 배열을 저장한다
//                      3. dfs로 붙어 있는 0의 갯수를 dfs로 계산해 count한다.
//
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/10/27.
//

import Foundation

class Solution {
    func regionsBySlashes(_ grid: [String]) -> Int {
        
    }
}
