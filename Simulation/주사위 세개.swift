//
//  주사위 세개.swift
//  Question Link: https://www.acmicpc.net/problem/2480
//  Primary idea:       (Simulation & Math & 사칙연산)
//                      1. Set을 통해 unique한 갯수를 찾아낸다.
//                      2. 정렬을 통해 개수가 2개일 경우를 계산한다.
//
//  Time Complexity : O(1)
//  Space Complexity : O(n)
//  Runtime: 12 ms
//  Memory Usage: 81.340 MB
//
//  Created by gunhyeong on 2020/09/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var reward = 0
let count = Set(input).count

if count == 1 {
    reward = 10000 + input.first! * 1000
} else if count == 2 {
    reward = 1000 + input[1] * 100
} else if count == 3 {
    reward = input.last! * 100
}

print(reward)
