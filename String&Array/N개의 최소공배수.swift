//
//  N개의 최소공배수.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12953
//  Primary idea:       <String & Array>
//                      1.
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime: 0.11 ~ 0.18 ms
//  Memory Usage: 23.6 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/07/07.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    var lcm = 1
    
    for element in arr {
        lcm = LCM(lcm, element)
    }
    
    return lcm
}

// 최대 공약수
func GCD(_ min: Int, _ max: Int) -> Int {
    let remain = min % max
    return remain == 0 ? max : GCD(max, remain)
}

// 최소 공배수
func LCM(_ base: Int, _ other: Int) -> Int {
    return base * other / GCD(base, other)
}
