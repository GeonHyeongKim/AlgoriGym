//
//  공.swift
//  Question Link: https://www.acmicpc.net/problem/1547
//  Primary idea:       (Simulation)
//                      1. 야바위를 하는 문제!
//                      2. 배열의 swapAt을 이용
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 8 ms
//  Memory Usage: 64.056 MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation

var n = Int(readLine()!)! // m : 바꿀 횟수
var swapList = [[Int]]()
var cups = [1, 0, 0]

// 입력
while n > 0 {
    n -= 1
    let input = readLine()!.split(separator: " ").map{Int($0)! - 1}
    swapList.append(input)
}

for swap in swapList {
    cups.swapAt(swap.first!, swap.last!)
}

print(cups.firstIndex(of: 1)! + 1)
