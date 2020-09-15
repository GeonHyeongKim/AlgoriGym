//
//  수열의 변화.swift
//  Question Link: https://www.acmicpc.net/problem/1551
//  Primary idea:       (Simulation)
//                      1. 입력과 출력에 주의하면서 B[i] = A[i+1]-A[i]를 계산
//                      2. k번 반복을 주의
//
//  Time Complexity : O(n^k)
//  Space Complexity : O(n)
//  Runtime: 8 ms
//  Memory Usage: 64.052 MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first!
let k = input.last!
var sequence = readLine()!.split(separator: ",").map{Int($0)!}
var answer = ""

for j in 0..<k {
    for i in 0..<sequence.count - 1 - j{
        let calulation = sequence[i+1] - sequence[i]
        sequence[i] = calulation
    }
}

for i in 0..<sequence.count - k  {
    answer += "\(sequence[i]),"
}

answer.removeLast()
print(answer)
