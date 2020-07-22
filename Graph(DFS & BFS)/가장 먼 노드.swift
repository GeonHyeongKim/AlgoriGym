//
//  가장 먼 노드.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/49189
//  Primary idea:       ( Graph & Dijstra & BFS )
//                      1. 1번 정점부터 각 정점까지의 최단거리 -> 다익스트라
//                      2. 마지막에 최단거리 배열값에 있는 값중에 가장 먼 노드들 찾아 출력
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/22.
//

import Foundation

let maxValue = 50001

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var connected = [Int:[Int]]() // 노드 번호 : 연결된 상대방 노드 번호
    var distance = [Int](repeating: maxValue, count: n+1)
    var answer = 0
    
    // Java의 Vector와 비슷한 기능 = key값에 여러 원소를 넣을 수 있음
    for e in edge {
        let node1 = e.first!
        let node2 = e.last!
        
        if !connected.keys.contains(node1) { // key값이 없으면
            connected[node1] = [node2]
        } else {
            connected[e.first!]?.append(e.last!)
        }
        
        if !connected.keys.contains(node2) {
            connected[node2] = [node1]
        } else {
            connected[e.last!]?.append(e.first!)
        }
    }

    let maxDistance = djistra(&connected, &distance, n)
    
    for i in 1...n {
        if maxDistance == distance[i] {
            answer += 1
        }
    }
    
    return answer
}

func djistra(_ connected: inout [Int:[Int]], _ distance: inout [Int], _ n: Int) -> Int {
    var maxDistance = 0
    var queue = [Int]()
    
    queue.append(1)
    distance[1] = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for target in connected[node]! {
            if distance[target] > distance[node] && distance[target] == maxValue {
                distance[target] = distance[node] + 1
                queue.append(target)
                maxDistance = max(maxDistance, distance[target])
            }
        }
    }
        
    return maxDistance
}
