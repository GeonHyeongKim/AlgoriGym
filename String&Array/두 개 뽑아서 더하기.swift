//
//  두 개 뽑아서 더하기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/68644
//  Primary idea:       (Bruth force)
//                      1.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n)
//  Runtime: 0.16 ~ 1.74 ms
//  Memory Usage: 16.2 ~ 16.6 MB
//
//  Created by gunhyeong on 2020/11/05.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var setNum = Set<Int>()
    
    for (i, base) in numbers.enumerated() {
        for j in i+1..<numbers.count {
            setNum.insert(numbers[i] + numbers[j])
        }
    }
    
    return setNum.sorted(by: <)
}
