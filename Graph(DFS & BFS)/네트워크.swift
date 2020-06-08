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
    return 0
}
