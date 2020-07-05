//
//  최댓값 최솟값.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12939
//  Primary idea:       <String & Array> - split(separator:), map{Int($0)!}
//                      1. 공백을 제거하고 배열로 만든다. 이떄, Int형으로 바꾸어 배열로 만든다.
//                      2. min()과 max()를 이용해 최솟값과 최댓값을 알아낸다.
//                      3. "\()"를 이용해 답을 반환한다.
//
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime: 0.22 ~ 0.41 ms
//  Memory Usage: 24.0 24.3 MB
//
//  Created by gunhyeong on 2020/07/05.
//

import Foundation

func solution(_ s:String) -> String {
    let numbers = s.split(separator: " ").map{Int($0)!}
    let minNum = numbers.min()!
    let maxNum = numbers.max()!

    return "\(minNum) \(maxNum)"
}
