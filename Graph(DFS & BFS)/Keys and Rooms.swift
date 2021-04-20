//
//  Keys and Rooms.swift
//  Question Link: https://leetcode.com/problems/keys-and-rooms/
//  Primary idea:       (Graph, dfs)
//                      1. 전체를 모두 방문하는지 확인하는 문제
//                      2. dfs로 모든 방문 확인
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n)
//  Runtime: 36 ms
//  Memory Usage: 14.3 MB
//
//  Created by gunhyeong on 2020/10/27.
//

import Foundation

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = [Bool](repeating: false, count: rooms.count)
        visited[0] = true
        
        goRoom(rooms, &visited, 0)
        
        return !visited.contains(false)
    }
    
    func goRoom(_ rooms: [[Int]], _ visited: inout [Bool], _ no: Int) {
        for nextNo in rooms[no] {
            if !visited[nextNo] {
                visited[nextNo] = true
                goRoom(rooms, &visited, nextNo)
            }
        }
    }
}

// 2번째 풀이
//Runtime: 40 ms, faster than 80.70% of Swift online submissions for Keys and Rooms.
//Memory Usage: 14.3 MB, less than 49.12% of Swift online submissions for Keys and Rooms.
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = [Bool](repeating: false, count: rooms.count)
        visited[0] = true
        
        func dfs(_ n: Int) {
            for next in rooms[n] {
                if !visited[next] {
                    visited[next] = true
                    dfs(next)
                }
            }
        }
        
        dfs(0)
        return !visited.contains(false)
    }
}
