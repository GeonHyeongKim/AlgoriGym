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

func dijstra(graph: inout [[Int]], start: Int) {
    var dist = [Int](repeating: 0, count: V)
    var isVisted = [Bool](repeating: false, count: V)
    
    for i in 0..<V {
        dist[i] = Int.max
        isVisted[i] = false;
    }
    
    // 초기 조건 설정.
    dist[start] = 0;

    // V-1번 루프를 수행한다는 것은 첫 start node를 제외한 모든 노드들에 접근을 해 계산을 한다는 의미.
    for _ in 0..<V-1 {
        // 최단거리 정보를 알고 있는 노드들 중 가장 거리가 짧은 노드의 인덱스를
        let current = minDistance(distance: &dist, isVisted: &isVisted)
        
        // 그래프 상의 모든 노드들을 탐색하며 u 노드의 주변 정보를 갱신
        for v in 0..<V {
            // 1. 아직 처리가 되지 않은 노드이어야 하며 (무한루프 방지)
            // 2. u-v 간에 edge가 존재하고
            // 3. src부터 u까지의 경로가 존재하고
            // 4. 기존의 v노드까지의 최단거리 값보다 새로 계산되는 최단거리가 더 짧을 경우
            if isVisted[v] && dist[current] != Int.max &&  dist[v] > dist[current] + graph[current][v] {
                // 최단거리를 갱신해준다.
                dist[v] = dist[current] + graph[current][v]
            }
        }
        
        // 이제 이 노드(u)는 접근할 일이 없다. 플래그를 true로 설정.
        isVisted[current] = true

    }
}
