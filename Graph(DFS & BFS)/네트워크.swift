//
//  네트워크.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/43162
//  Primary idea:       <DFS & BFS> - dfs
//                      1. dfs로 문제 풀이
//                      2. isVisit : 방문 computer가 network에 연결되어 있는지 알기 위한 변수, 중복방지
//                      3. 전체 갯수 만큼 반복하면서 isVisit[i]가 false인 경우에만 반복함
//                      4. 다른 컴퓨터를 모두 확인하여 방문되지 않았고, 연결이 되어있는(관계가 1인) 경우가 있을 경우
//                      5. 3에서 false인 경우만 갯수(network)를 증가 = 독립된 네트워크이다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/08.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var network = 0
    var isVisit = [Bool](repeating: false, count: computers.count) // 2
    
    for node in 0..<n { // 3
        if !isVisit[node] { // 중복 방지
            dfs(computers, &isVisit, node)
            network += 1
        }
    }
    
    return network
}

func dfs(_ computers: [[Int]], _ isVisit: inout [Bool], _ node: Int) {
    isVisit[node] = true
    
    for i in 0..<isVisit.count {
        // 양방향이기 때문에 computers[node][i] == computers[i][node]
        if !isVisit[i] && computers[node][i] == 1 { // 4
            dfs(computers, &isVisit, i)
        }
    }
}
