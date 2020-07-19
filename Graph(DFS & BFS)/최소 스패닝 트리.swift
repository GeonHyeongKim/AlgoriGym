//
//  최소 스패닝 트리.swift
//  Question Link: https://www.acmicpc.net/problem/1197
//  Primary idea:       <Greedy> & <MST> & <Kruskal> & <Union-Find>
//                      1. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      2. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      3. 간선(edge.cost)을 기준으로 오름차순으로 정렬
//                      4. graph[i]는 노드 i의 부모 노드를 저장하는 배열
//                      5. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//
//  Created by gunhyeong on 2020/07/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let cntV = input[0]
let cntE = input[1]

var graph = [Int](repeating: 0, count: cntV+1)
var edges = [Edge]()
var answer = 0

for i in 0...cntV {
    graph[i] = i
}

for _ in 0..<cntE {
    let contents = readLine()!.split(separator: " ").map{Int($0)!}
    edges.append(Edge(contents[0], contents[1], contents[2]))
}
edges = edges.sorted(by: {$0.cost < $1.cost}) // 오름차순 정렬

for edge in edges {
    let start = find(&graph, edge.start)
    let end = find(&graph, edge.end)
    
    if start != end {
        graph[start] = end
        answer += edge.cost
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

func find(_ graph: inout [Int], _ vertex: Int) -> Int {
    if graph[vertex] == vertex {
        return vertex
    }
    
    graph[vertex] = find(&graph, graph[vertex])
    return graph[vertex]
}

print(answer)

/*
3 3
1 2 1
2 3 2
1 3 3
 
결과 : 3
*/
