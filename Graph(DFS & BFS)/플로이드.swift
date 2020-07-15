//
//  플로이드.swift
//  Question Link: https://www.acmicpc.net/problem/11404
//  Primary idea:       <Graph>
//                      1. 플로이드 워셜을 적용
//                      2. 입력받은 버스 정보 cntBus개에 대해서 A도시에서 B도시로 가는 기존 백만과 비용의 최솟값을 저장
//                      3. i에서 k, k에서 j를 가는 경우와 i,k를 가는 경우를 비교
//
//  Time Complexity : O(n^3)
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/13.
//

import Foundation

let cntCity = Int(readLine()!)!
let cntBus = Int(readLine()!)!
let costMax = 100000
var answer = [[Int]](repeating: [Int](repeating: costMax, count: cntCity), count: cntCity)

//init
for i in 0..<cntCity {
    for j in 0..<cntCity {
        if i == j {
            answer[i][j] = 0
        }
    }
}

//input
for _ in 0..<cntBus {
    let content = readLine()!.split(separator: " ").map{Int($0)!}
    let start = content[0] - 1
    let end = content[1] - 1
    let cost = content[2]
    
    answer[start][end] = min(answer[start][end], cost)
}

// compare
for k in 0..<cntCity {
    for i in 0..<cntCity {
        for j in 0..<cntCity {
            if answer[i][j] > answer[i][k] + answer[k][j] {
                answer[i][j] = answer[i][k] + answer[k][j]
            }
        }
    }
}

// print
for i in 0..<cntCity {
    for j in 0..<cntCity {
        if answer[i][j] >= costMax {
            answer[i][j] = 0
        }
        print(answer[i][j], terminator:" ")
    }
    print()
}


