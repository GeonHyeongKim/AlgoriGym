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
var aboutE = [[Int]]()

for _ in 0..<cntE {
    let contents = readLine()!.split(separator: " ").map{Int($0)!}
    aboutE.append(contents)
}

class Node {
    var vertex: Int
    
    init(_ vertex: Int) {
        self.vertex = vertex
    }
}

class Edg {
    var start: Int
    var end: Int
    var value: Int
    
    init(_ start: Int, _ end: Int, _ value: Int) {
        self.start = start
        self.end = end
        self.value = value
    }
}
