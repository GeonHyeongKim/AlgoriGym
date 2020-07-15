//
//  상근이의 여행.swift
//  Question Link: https://www.acmicpc.net/problem/9372
//  Primary idea:       <Graph> - BFS
//                      1. BFS로 풀이한다.
//                      2. 현재 baseAirplane에서 다른 otherAirplane로 왕복 가능한 비행기들이 주어지고 출발점부터 모든 노드까지 이동 가능한                         경로를 센다
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n)
//  Runtime: 500 ms
//  Memory Usage: 81.888 MB
//
//  Created by gunhyeong on 2020/07/15.
//

import Foundation

var cntTestCase = Int(readLine()!)!

while(cntTestCase > 0) {
    cntTestCase -= 1
    
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let cntCountry = input[0]
    let cntAirplane = input[1]
    var airport = [Int:[Int]]() // Vector 개념
    var visited = [Bool](repeating: false, count: cntCountry+1)
    
    for country in 1...cntCountry {
        airport[country] = []
    }
    
    for _ in 0..<cntAirplane {
        initAirport(&airport, cntAirplane)
    }
    
    let answer = findAirport(&airport, &visited)
    print(answer)
}

func initAirport(_ airport: inout [Int:[Int]], _ cntAirplane: Int) {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let baseAirplane = input[0]
    let otherAirplane = input[1]
    
    airport[baseAirplane]!.append(otherAirplane)
    airport[otherAirplane]!.append(baseAirplane)
}

func findAirport(_ airport: inout [Int:[Int]], _ visited: inout [Bool]) -> Int {
    var queue = [Int]()
    var answer = 0

    queue.append(1)
    while !queue.isEmpty {
        let currentAirplane = queue.removeFirst()
        if !visited[currentAirplane] { // 방문하지 않았을 경우
            visited[currentAirplane] = true
            answer += 1

            for i in 0..<airport[currentAirplane]!.count { //현재 baseAirplane에서 연결되어있는 otherAirplane 꺼낸다.
                let nextAirplane = airport[currentAirplane]![i]
                if !visited[nextAirplane] {
                    queue.append(nextAirplane)
                }
            }
        }
    }

    return answer - 1
}

// 모든 경로를 한번씩 모두 거쳐만 가면 되니까 주어진 나라의 갯수에서 -1
func otherSolution(_ cntCountry: Int) {
    print(cntCountry)
}
