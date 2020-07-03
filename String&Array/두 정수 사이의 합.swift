//
//  두 정수 사이의 합.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12912
//  Primary idea:       <String & Array> - max(), min()
//                      1. max(), min()을 이용해 큰수와 작은수를 비교한다.
//                      2. 반복문을 통해 작은수에서 큰수까지의 수를 모두 누적한다.
//
//  Time Complexity : O(n), n은 a~b의 길이
//  Space Complexity : O(1)
//  Runtime: 0.10 ~ 122.21ms
//  Memory Usage: 23.9 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/07/03.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    let start = min(a, b)
    let end = max(a, b)
    var sum = 0
    
    for i in start...end {
        sum += i
    }
    
    return Int64(sum)
}
