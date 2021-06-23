//
//  그래프 모든 경로 경우의 수.swift
//

//  Created by gunhyeong on 2021/06/23.

import Foundation
func info(_ n: Int, _ edges: [(Int, Int)]) -> Int {
    var edgeInfo = [Int: [Int]]()
    
    for edge in edges {
        if var array = edgeInfo[edge.0] {
            array.append(edge.1)
            edgeInfo[edge.0] = array
        } else {
            edgeInfo[edge.0] = [edge.1]
        }
    }
        
    var res = 0
    var list = [[Int]]()
    
    func dfs(node: Int, visited: [Int]) {
        guard node != n else {
            res += 1
            list.append(visited)
            return
        }
                
        guard let neighbors = edgeInfo[node] else { return }
        
        for edge in neighbors {
            guard visited.contains(edge) == false else { continue }
            dfs(node: edge, visited: visited + [edge])
        }
    }
    
    dfs(node: 1, visited: [1])
    print(list)
    
    return res
}

print(info(5, [(1, 2), (1, 3), (1, 4), (2, 1), (2, 4), (2, 5), (3, 2), (3, 4), (4, 5)]))

