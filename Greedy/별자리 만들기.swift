//
//  별자리 만들기.swift
//  Question Link: https://www.acmicpc.net/problem/4386
//  Primary idea:       <Greedy> & <MST> & <강한 연결 요소> & <최대 독립 집합>
//                      1. 좌표평면에서 MST를 만드는 문제
//                      2. MST를 적용하여, 좌표 평명 값의 떨어진 거리를 Double 타입의 값으로 저장하고 비교
//
//  Time Complexity : O(E logE)
//  Space Complexity : O(E)
//  Runtime: 16 ms
//  Memory Usage: 81.652 MB
//
//  Created by gunhyeong on 2020/07/19.
//

import Foundation

let cntStar = Int(readLine()!)!
var starts = [Int:[Double]]()
var universe = [Int](repeating: 0, count: cntStar)
var edges = [Edge]()
var totalDistance = Double(0.0)

for i in 0..<cntStar {
    universe[i] = i
}

for i in 0..<cntStar {
    let posStar = readLine()!.split(separator: " ").map {Double($0)!}
    let dx = posStar[0]
    let dy = posStar[1]
    
    starts[i] = [dx, dy]
}

for start in 0..<cntStar {
    for end in start+1..<cntStar {
        let distance = getDistance(starts[start]!, starts[end]!)
        edges.append(Edge(start, end, distance))
    }
}

edges = edges.sorted(by: {$0.distance < $1.distance})

for edge in edges {
    let start = find(&universe, edge.start)
    let end = find(&universe, edge.end)
    
    if start != end {
        universe[start] = end
        totalDistance += edge.distance
    }
}

print(String(format: "%.2f", totalDistance))

class Edge {
    var start: Int
    var end: Int
    var distance: Double
    
    init(_ start: Int, _ end: Int, _ distance: Double) {
        self.start = start
        self.end = end
        self.distance = distance
    }
}

func getDistance(_ start: [Double], _ end: [Double]) -> Double {
    let startDx = start.first!
    let endDx = end.first!
    let startDy = start.last!
    let endDy = end.last!
    
    return sqrt(pow((startDx - endDx), 2) + pow((startDy - endDy), 2))
}

func find(_ universe: inout [Int], _ starNum: Int) -> Int {
    if universe[starNum] == starNum {
        return starNum
    }
    
    return find(&universe, universe[starNum])
}
