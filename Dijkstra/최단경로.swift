/*
*  최단경로.swift
*  Question Link: https://www.acmicpc.net/problem/2220
*  Primary idea:    <Greedy>
*                    1.
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage: MB
*
*  Created by gunhyeong on 2020/05/10.
*/

import Foundation

// 가장 최소 거리를 가지고 있는 정점을 반환
func minDistance(distance dist: inout [Int], isVisted: inout [Bool]) -> Int{
    var min = Int.max
    var index = 0
    
    for (i, visit) in isVisted.enumerated() {
        if !visit && dist[i] < min {
            min = dist[i]
            index = i
        }
    }
    
    return index
}
