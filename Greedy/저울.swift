//
//  저울.swift
//  Question Link: https://www.acmicpc.net/problem/2437
//  Primary idea:       (Greedy)
//                      1. 저울추를 오름차순으로 정렬
//                      2. 저울추의 총 합을 재는 변수는 sum
//                      3. 이제 저울추를 하나씩 올려보며 주어진 저울추로 무게는 측정할 수 있는지 검사
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 8 ms
//  Memory Usage: 64.056 MB
//
//  Created by gunhyeong on 2020/10/04.
//

import Foundation

let n = Int(readLine()!)! // 저울추의 개수
let weight = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var sum = 0

for w in weight {
    if sum + 1 < w { break }
    sum += w
}

print(sum + 1)
