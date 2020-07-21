//
//  도시 분할 계획.swift
//  Question Link: https://www.acmicpc.net/problem/1647
//  Primary idea:       <Greedy> & <MST>
//                      1. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      2. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      3. 간선(edge.cost)을 기준으로 오름차순으로 정렬
//                      4. graph[i]는 노드 i의 부모 노드를 저장하는 배열
//                      5. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//                      6. union 시킨때마다 count하여 그 값이 총 마을의 갯수 - 2개와 같을 때까지 반복한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/21.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
var n = input[0]
let m = input[1]
var towns = Array(0...n)
var edges = [Edge]()
var rank = [Int](repeating: 1, count: n+1)
var minCost = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    edges.append(Edge(input[0], input[1], input[2]))
}

edges.sort(by: {$0.cost < $1.cost}) // 비용 기준으로 오름차순 -> 마지막 가장 비싼 비용

var num = 0
for edge in edges {
    let start = find(&towns, edge.start)
    let end = find(&towns, edge.end)

    if start != end {
        union(&towns, &rank, start, end)
        minCost += edge.cost
        num += 1
    }
    
    if num == n - 2 {
        break
    }
}

print(minCost)

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

func find(_ towns: inout [Int], _ number: Int) -> Int {
    if towns[number] == number {
        return number
    }
    
    towns[number] = find(&towns, towns[number])
    return towns[number]
}

func union(_ towns: inout [Int], _ rank: inout [Int], _ start: Int, _ end: Int) {
    let start = find(&towns, start)
    let end = find(&towns, end)
    
    let totalRank = rank[start] + rank[end]
    
    if start == end {
        return
    } else if rank[start] > rank[end] {
        towns[end] = start
        rank[start] = totalRank
    } else {
        towns[start] = end
        rank[end] = totalRank
    }
}
