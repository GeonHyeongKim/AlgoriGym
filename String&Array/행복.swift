//
//  행복.swift
//  Question Link: https://www.acmicpc.net/problem/15969
//  Primary idea:       (String & Array & 구현 & Math)
//                      1. 배열에서 가장 큰 값을 구한다. Array.max()
//                      2. 배열에서 가장 작은 값을 구한다. Array.min()
//                      3. 두개의 차이를 구한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let cntStudent = Int(readLine()!)!
let score = readLine()!.split(separator: " ").map{Int($0)!}
let maxScore = score.max()!
let minScore = score.min()!
print(maxScore - minScore)
