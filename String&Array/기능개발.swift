//
//  기능개발.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42586
//  Primary idea:       <String & Array> - Stack & Queue
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/22.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result = [Int]()
    var distributeStack = [Int]()
    
    for i in 0..<progresses.count {
        var progresse = progresses[i]
        var cnt = 0
        
        while progresse < 100 {
            progresse += speeds[i]
            cnt += 1
        }
        
        distributeStack.append(cnt)
    }
    
    return []
}
