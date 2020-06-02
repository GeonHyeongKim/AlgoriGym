//
//  소수 찾기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
//  Primary idea:       <String & Array> - Brute force
//                      1. 에라토스테네스의 체 이용
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/02.
//

import Foundation

func solution(_ numbers:String) -> Int {
    return 0
}

// 소수 인지 판별
func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
