//
//  분해합.swift
//  Question Link: https://www.acmicpc.net/problem/2231
//  Primary idea:       (String & Array & Bruth force)
//                      1. 1~n 까지 반복하면 모든 경우의 수를 구한다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime: 24 ms
//  Memory Usage: 81.324 MB
//
//  Created by gunhyeong on 2020/09/28.
//

import Foundation

let input = Int(readLine()!)!

print(solution(input))

func solution(_ n: Int) -> Int {
    for i in 0..<n {
        if isSolve(i) { return i }
    }
    
    return 0
}


func isSolve(_ n: Int) -> Bool {
    var num = n
    var sum = n
    
    while num > 0 {
        sum += num % 10
        num /= 10
    }
    
    return sum == input
}
