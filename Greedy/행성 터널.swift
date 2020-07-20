//
//  행성 터널.swift
//  Question Link: https://www.acmicpc.net/problem/2887
//  Primary idea:       <Greedy> & <MST>
//                      1. 문제의 특성을 활용하여 고려할 간선의 개수를 줄임으로써 푸는 문제
//                         point : n이 100,000개까지 가능 -> 메모리 초과
//                         해결 방안 : 좌표값을 각각 정렬하여 활용하는 방법
//                      2. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      3. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      4. 간선(edge.cost)을 기준으로 오름차순으로 정렬
//                      5. universe[i]는 노드 i의 부모 노드를 저장하는 배열
//                      6. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//
//  Time Complexity : O(E logE)
//  Space Complexity : O(E)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/20.
//

import Foundation

let cntPlanet = Int(readLine()!)!
var universe = [Int](repeating: 0, count: cntPlanet)
var planets = [Planet]()
var edges = [Edge]()
var cost = 0

for i in 0..<cntPlanet {
    let pos = readLine()!.split(separator: " ").map{Int($0)!}
    planets.append(Planet(i, pos[0], pos[1], pos[2]))
    universe[i] = i
}

planets.sort(by: {$0.x < $1.x})
for i in 1..<cntPlanet {
    let cost = abs(planets[i].x - planets[i-1].x)
    edges.append(Edge(planets[i].id, planets[i-1].id, cost))
}

planets.sort(by: {$0.y < $1.y})
for i in 1..<cntPlanet {
    let cost = abs(planets[i].y - planets[i-1].y)
    edges.append(Edge(planets[i].id, planets[i-1].id, cost))
}

planets.sort(by: {$0.z < $1.z})
for i in 1..<cntPlanet {
    let cost = abs(planets[i].z - planets[i-1].z)
    edges.append(Edge(planets[i].id, planets[i-1].id, cost))
}

edges.sort(by: {$0.cost < $1.cost})

for edge in edges {
    let start = find(&universe, edge.start)
    let end = find(&universe, edge.end)
    
    if start != end {
        union(&universe, start, end)
        cost += edge.cost
    }
}

print(cost)

class Planet {
    var id: Int
    var x: Int
    var y: Int
    var z: Int
    
    init(_ id: Int, _ x: Int, _ y: Int, _ z: Int) {
        self.id = id
        self.x = x
        self.y = y
        self.z = z
    }
}

class Edge {
    var start: Int
    var end: Int
    var cost: Int
    
    init(_ start: Int, _ end: Int, _ cost: Int) {
        self.start = start
        self.end = end
        self.cost = cost
    }
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
    
    universe[startVertex] = endVertex
}
