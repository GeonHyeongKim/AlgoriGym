//
//  수빈이의 수열.swift
//  Question Link: https://www.acmicpc.net/problem/10539
//  Primary idea:       (String & Array & 구현 & Math)
//                      1. 수학적 원리
//                         해당값 = 지금까지 평균값(sequence[i]) * (i+1) - 지금까지의 합
//
//  Time Complexity : O(n), n은 수열의 갯수
//  Space Complexity : O(n)
//  Runtime: 8 ms
//  Memory Usage: 64.056 MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map{Int($0)!}
var answer = [Int]()
var result = "\(sequence.first!) "
answer.append(sequence.first!)

for i in 1..<sequence.count {
    let num = sequence[i] * (i+1) - answer.reduce(0, +)
    answer.append(num)
    result += "\(num) "
}

result.removeLast()
print(result)
