//
//  우주신과의 교감.swift
//  Question Link: https://www.acmicpc.net/problem/1774
//  Primary idea:       <Greedy> & <MST>
//                      1. 이미 사용된 간선이 있을 때 최소 비용으로 나머지를 완성하는 문제
//                         point : 이미 연결되어있는 간선에 대해 union으로 연결해 놓는다.
//                      2. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      3. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      4. 간선(edge.distance)을 기준으로 오름차순으로 정렬
//                      5. universe[i]는 노드 i의 부모 노드를 저장하는 배열
//                      6. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/07/19.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]

var edges = [Edge]()
var universe = [Int](repeating: 0, count: n+1)
var gods = [Int:[Int]]()

var needDistance = 0.0

// 신들의 위치 저장
for i in 1...n {
    let god = readLine()!.split(separator: " ").map{Int($0)!}
    gods[i] = god
}

for i in 1...n {
    universe[i] = i
}

// 이미 연결되어 있음
for _ in 0..<m {
    let connect = readLine()!.split(separator: " ").map{Int($0)!}
    let start = connect[0]
    let end = connect[1]
    
    union(&universe, start, end)
}

for start in 1..<n {
    for end in start+1...n {
        let distance = getDistance(gods[start]!, gods[end]!)
        edges.append(Edge(start, end, distance))
    }
}

edges = edges.sorted(by: {$0.distance < $1.distance})

for edge in edges {
    let start = find(&universe, edge.start)
    let end = find(&universe, edge.end)
    
    if start != end {
        union(&universe, start, end)
        needDistance += edge.distance
    }
}

print(String(format: "%.2f", needDistance))

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

func getDistance(_ start: [Int], _ end: [Int]) -> Double {
    let startDx = Double(start.first!)
    let endDx = Double(end.first!)
    let startDy = Double(start.last!)
    let endDy = Double(end.last!)
    
    return sqrt(pow(startDx - endDx, 2) + pow(startDy - endDy, 2))
}

func find(_ universe: inout [Int], _ vertex: Int) -> Int {
    if universe[vertex] == vertex {
        return vertex
    }
    
    universe[vertex] = find(&universe, universe[vertex])
    
    return universe[vertex]
}

func union(_ universe: inout [Int], _ start: Int, _ end: Int) {
    let startVertex = find(&universe, start)
    let endVertex = find(&universe, end)
    
    if startVertex != endVertex {
        universe[startVertex] = endVertex
    }
}
