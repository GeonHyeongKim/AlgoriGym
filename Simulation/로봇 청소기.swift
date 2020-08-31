//
//  로봇 청소기.swift
//  Question Link: https://www.acmicpc.net/problem/14503
//  Primary idea:       <Simulation>
//                      1. 주변에 방문할 칸이 있는 경우
//                        - 방향을 4방향으로 바꾸면서 방문할 수 있으면 방문 후 표시
//                        - 방문 후 DFS() 호출, 결과++;
//                        - 리턴
//                      2. 방문할 칸이 없는 경우
//                        - 후진
//                        - 후진했는데 벽인 경우 : 종료
//                        - 후진 가능한 경우 : 후진한 위치를 기준으로 DFS() 호출
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//
//  Created by gunhyeong on 2020/08/30.
//

import Foundation

let input1 = readLine()!.split(separator: " ").map{Int($0)!}
let row = input1.first!
let col = input1.last!

let input2 = readLine()!.split(separator: " ").map{Int($0)!}
let r = input2[0]
let c = input2[1]
let d = input2[2]

let area = [[Int]()
for _ in 0..<row {
    let cols = readLine()!.split(separator: " ").map{Int($0)!}
    area.append(cols)
}

