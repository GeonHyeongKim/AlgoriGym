//
//  수열의 변화.swift
//  Question Link: https://www.acmicpc.net/problem/1551
//  Primary idea:       (Simulation)
//                      1. 입력과 출력에 주의하면서 B[i] = A[i+1]-A[i]를 계산
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first!
let k = input.last!
let sequence = readLine()!.split(separator: ",").map{Int($0)!}
var answer = ""

print(sequence)

for i in 0..<sequence.count - 1 {
    let calulation = sequence[i+1] - sequence[i]
    print("\(sequence[i+1]) - \(sequence[i]) = \(calulation)")
    answer += "\(calulation),"
}

answer.removeLast()
print(answer)
