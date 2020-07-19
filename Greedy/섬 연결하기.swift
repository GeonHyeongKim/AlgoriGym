//
//  섬 연결하기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42861
//  Primary idea:       <Greedy> & <MST> & <Kruskal> & <Union-Find>
//                      1. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      2. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      3. 간선(edge.cost)을 기준으로 오름차순으로 정렬
//                      4. graph[i]는 노드 i의 부모 노드를 저장하는 배열
//                      5. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//
//  Time Complexity : 정렬(O(E lgE)), Union-Find(O(E))
//  Space Complexity : O(E)
//  Runtime: 0.24 ~ 3.06 ms
//  Memory Usage: 23.9 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/07/18.
//

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var answer = 0
    var graph = [Int](repeating: 0, count: n+1) // graph[i] = 노드, i의 부모 노드를 가리킨다.
    var edges = [Edge]()
    
    for i in 0...n {
        graph[i] = i
    }
    
    for cost in costs {
        edges.append(Edge(cost[0], cost[1], cost[2]))
    }
    
    edges = edges.sorted(by: {$0.cost < $1.cost}) // (O(E lgE))
    
    // 2. 모든 간선을 검사
    for edge in edges { // union
        let startVertex = find(&graph, edge.start)
        let endVertex = find(&graph, edge.end)
        
        // start와 end가 아직 연결되지 않았을 때
        if startVertex != endVertex {
            // start를 end의 parent로 설정
            graph[startVertex] = endVertex
            answer += edge.cost
        }
    }
    
    return answer
}

class Edge {
    var start: Int
    var end: Int
    var cost: Int
    
    init(_ start: Int, _ end: Int, _ cost: Int){
        self.start = start
        self.end = end
        self.cost = cost
    }
}

// 최상위 노드를 찾는 함수 (Union-find)
func find(_ graph: inout [Int], _ vertex: Int) -> Int {
    if graph[vertex] == vertex {
        return vertex
    }
    
    graph[vertex] = find(&graph, graph[vertex])
    return graph[vertex]
}

print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])) // 4
