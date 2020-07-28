//
//  바이러스.swift
//  Question Link: https://www.acmicpc.net/problem/2606
//  Primary idea:       (Union-find)
//                      1. 각각이 연결되어 있는 vertex를 연결 Uinon
//                      2. 1번과 연결되어 있는 모든 컴퓨터 갯수를 센다
//
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/28.
//

import Foundation

let cntComputer = Int(readLine()!)!
let cntNetwork = Int(readLine()!)!
var network = Array(0...cntComputer)
var answer = 0

for _ in 0..<cntNetwork {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let start = input.first!
    let end = input.last!
    
    union(start, end)
}

let startComputerNumber = find(1)

for i in 2...cntComputer {
    if startComputerNumber == find(i) {
        answer += 1
    }
}

print(answer)

func union(_ start: Int, _ end: Int) {
    let start = find(start)
    let end = find(end)
    
    if start != end {
        network[end] = start
    }
}

func find(_ computer: Int) -> Int {
    if network[computer] == computer {
        return computer
    }
    
    network[computer] = find(network[computer])
    return network[computer]
}
