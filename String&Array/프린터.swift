//
//  프린터.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42587
//  Primary idea:       <String & Array> - Stack & Queue
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var sortedPriorities = priorities.sorted(by : >)
    return sortedPriorities.lastIndex(of : priorities[location])! + 1
}
