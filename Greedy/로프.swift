//
//  로프.swift
//  Question Link: https://www.acmicpc.net/problem/1120
//  Primary idea:       <Greedy>
//                      1. 각각의 로프에 모두 동일한 중량 : 각 로프를 선택했을 때 최대로 걸리는 중량을 계산
//                      2. preValue = max(preValue, str[index] * (N - index)
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime: 65.228 ms
//  Memory Usage: 52 MB
//
//  Created by gunhyeong on 2020/05/16.
//

import Foundation

var N = Int(readLine()!)!
var weightList = [Int](repeating: 0, count : N)
var result = 0

for i in 0..<N {
    weightList[i] = Int(readLine()!)!
}

weightList.sort(by: <) // 입력 받은 후 정렬

for i in 0..<N {
    result = max(result, weightList[i]*(N-i))
}

print(result)
