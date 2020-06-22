//
//  기능개발.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42586
//  Primary idea:       <String & Array> - Queue
//                      1. 첫 번째 반복문을 통해 각 progresse의 최종 배포일을 알아내 배열에 담아낸다.
//                      2. 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포 된다는 점을 이용해 계산 하는 값보다 작은 큰 값이 나오기 전까지 count를 세면서 result에 넣는다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.19 ~ 0.33 ms
//  Memory Usage: 24.2. 24.4 MB
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
    
    var maxDay = distributeStack.removeFirst()
    var cnt = 1
    
    while !distributeStack.isEmpty {
        let next = distributeStack.first!
        
        if next <= maxDay {
            cnt += 1
            distributeStack.removeFirst()
        } else {
            maxDay = next
            result.append(cnt)
            cnt = 0
        }
    }
    
    result.append(cnt)
        
    return result
}
