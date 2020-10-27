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
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime: 284 ms
//  Memory Usage: 15.3 MB
//
//  Created by gunhyeong on 2020/10/27.
//

import Foundation

class Solution {
    var row = 0
    var col = 0
    
    let convertDirt: [Character : [[Int]]] = [
        "/": [[0,0,1], [0,1,0], [1,0,0]],
        "\\": [[1,0,0], [0,1,0], [0,0,1]]
    ]
            
    func regionsBySlashes(_ grid: [String]) -> Int {
        var map = [[Int]]()
        
        for rows in grid {
            var line1 = [Int](), line2 = [Int](), line3 = [Int]()
            for char in rows {
                let convert = convertDirt[char] ?? [[0,0,0], [0,0,0], [0,0,0]]
                line1 += convert[0]
                line2 += convert[1]
                line3 += convert[2]
            }
            map += [line1, line2, line3]
        }
        
        var result = 0
        row = map.count
        col = map[0].count
        for i in 0..<row {
            for j in 0..<col {
                if map[i][j] == 0 {
                    result += 1
                    dfs(&map, i, j)
                }
            }
        }
        
        return result
    }
    
    func dfs(_ map: inout [[Int]], _ i: Int, _ j: Int) {
        if i < 0 || i >= row || j < 0 || j >= col || map[i][j] != 0 { return }
        
        map[i][j] = -1
        
        dfs(&map, i+1, j)
        dfs(&map, i-1, j)
        dfs(&map, i, j+1)
        dfs(&map, i, j-1)
    }
}
