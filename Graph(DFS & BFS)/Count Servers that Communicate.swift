//
//  Count Servers that Communicate.swift
//  Question Link: https://leetcode.com/problems/count-servers-that-communicate/
//  Primary idea:       (Graph)
//                      1. dfs로 동서남북 탐색
//                         단, 반복문을 통해 row, col의 0..size값으로 반복
//                      2. connect 변수를 통해, 각각의 섬의 갯수를 저장
//                      3. 저장된 connect 변수의 값이 2이상이면 결과값(answer)에 누적
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime: 16.5 ms
//  Memory Usage: 964 MB
//
//  Created by gunhyeong on 2020/11/02.
//

import Foundation

class Solution {
    var row = 0
    var col = 0
    var connect = 0
    
    func countServers(_ grid: [[Int]]) -> Int {
        var grid = grid
        row = grid.count
        col = grid[0].count
        var answer = 0
        
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 1 {
                    connect = 0
                    dfs(&grid, i, j)
                    if connect > 1 { answer += connect }
                }
            }
        }
        
        return answer
    }
    
    func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) {
        if isOutOfSize(i, j) || grid[i][j] != 1 { return }
        
        grid[i][j] = -1
        connect += 1
        
        for x in 0..<row { dfs(&grid, x, j) }
        for y in 0..<col { dfs(&grid, i, y) }
    }
    
    func isOutOfSize(_ i: Int, _ j: Int) -> Bool {
        return (i < 0 || i >= row || j < 0 || j >= col) ? true : false
    }
}

// 2번째 풀이
//Runtime: 772 ms, faster than 9.09% of Swift online submissions for Count Servers that Communicate.
//Memory Usage: 16.9 MB, less than 18.18% of Swift online submissions for Count Servers that Communicate.

class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var grid = grid
        let row = grid.count
        let col = grid[0].count
        var connect = 0
        var res = 0
        
        func isOutOfSize(_ i: Int, _ j: Int) -> Bool {
            return (i < 0 || i >= row || j < 0 || j >= col)
        }
        
        func dfs(_ i: Int, _ j: Int) {
            if isOutOfSize(i, j) || grid[i][j] != 1 { return }
            
            grid[i][j] -= 1
            connect += 1
            
            for x in 0..<row { dfs(x, j) }
            for y in 0..<col { dfs(i, y) }
        }
        
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 1 {
                    connect = 0
                    dfs(i, j)
                    if connect > 1 { res += connect}
                }
            }
        }
        
        return res
    }
}
