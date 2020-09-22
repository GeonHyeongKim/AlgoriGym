//
//  수빈이의 수열.swift
//  Question Link: https://www.acmicpc.net/problem/10539
//  Primary idea:       (String & Array & 구현 & Math)
//                      1. 수학적 원리
//                         해당값 = 지금까지 평균값(sequence[i]) * (i+1) - 지금까지의 합
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map{Int($0)!}
var answer = [Int]()
answer.append(sequence.first!)

for i in 1..<sequence.count {
    let num = sequence[i] * (i+1) - answer.reduce(0, +)
    answer.append(num)
}

print(answer)
