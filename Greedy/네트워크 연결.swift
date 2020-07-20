//
//  네트워크 연결.swift
//  Question Link: https://www.acmicpc.net/problem/1922
//  Primary idea:       <Greedy> & <MST>
//                      1. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      2. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      3. 간선(edge.cost)을 기준으로 오름차순으로 정렬
//                      4. universe[i]는 노드 i의 부모 노드를 저장하는 배열
//                      5. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/20.
//

import Foundation

let cntComputer = Int(readLine()!)!
let cntline = Int(readLine()!)!
var computers = [Int](repeating: 0, count: cntComputer+1)
var lines = [Line]()
var minCost = 0

for i in 0..<cntComputer {
    computers[i] = i
}

for i in 1...cntline {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    lines.append(Line(line[0], line[1], line[2]))
}

lines.sort(by: {$0.cost < $1.cost})

for line in lines {
    let start = find(&computers, line.start)
    let end = find(&computers, line.end)
    
    if start != end {
        computers[start] = end
        minCost += line.cost
    }
}

print(minCost)

class Line {
    var start: Int
    var end: Int
    var cost: Int
    
    init(_ start: Int, _ end: Int, _ cost: Int) {
        self.start = start
        self.end = end
        self.cost = cost
    }
}

func find(_ computers: inout [Int], _ num: Int) -> Int {
    if computers[num] == num {
        return num
    }
    
    computers[num] = find(&computers, computers[num])
    return computers[num]
}
