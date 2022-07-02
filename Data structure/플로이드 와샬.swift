//
//  플로이드 와샬.swift
//  Algorithm
//
//  Created by gunhyeong on 2021/04/21.
//  Copyright © 2021 geonhyeong. All rights reserved.
//

import Foundation
class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var distance = [[Int]](repeating: [Int](repeating: 10001, count: n), count: n)

        // 초기 설정
        for edge in edges {
            let start = edge[0]
            let end = edge[1]
            let weight = edge[2]

            distance[start][end] = weight
            distance[end][start] = weight
        }

        // 자기자신으로 가는 가중치는 0
        for node in 0..<n {
            distance[node][node] = 0
        }

        // 플로이드 와샬
        for middle in 0..<n {
            for start in 0..<n {
                for end in 0..<n {
                    if distance[start][middle] + distance[middle][end] < distance[start][end] {
                        distance[start][end] = distance[start][middle] + distance[middle][end]
                    }
                }
            }
        }

        var res = 0
        var minValue = Int.max
        for (j, yList) in distance.enumerated() {
            var cnt = 0
            for (i, x) in yList.enumerated() {
                if i != j {
                    if x <= distanceThreshold {
                        cnt += 1
                    }
                }
            }

            if minValue >= cnt {
                minValue = cnt
                res = j
            }
        }

        return res
    }
}
