//
//  보너스 점수.swift
//  Question Link: https://www.acmicpc.net/problem/17389
//  Primary idea:       (Simulation)
//                      1. 전체 점수(score)와 보너스 점수(bonus)를 변수로 선언한다.
//                      2. 반복문을 통해 "O","X"일 경우를 나누어
//                          i) "O"일경우, 전체 점수에 (i+1)과 보너스 점수(bonus)를 누적한다
//                          ii) "X"일경우, bonus를 0으로 초기화한다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 12 ms
//  Memory Usage: 81.324 MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let n = Int(readLine()!)!
let ox = readLine()!
var score = 0
var bonus = 0

for (i, v) in ox.enumerated() {
    if v == "O" {
        score += (i+1) + bonus
        bonus += 1
    } else {
        bonus = 0
    }
}

print(score)
