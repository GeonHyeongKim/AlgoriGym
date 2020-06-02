//
//  모의고사.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42840
//  Primary idea:       <String & Array> - Brute force
//                      1. 패턴 파악
//                          i) index 5 번마다 반복
//                          ii) index 8 번마다 반복
//                          iii) index 10 번마다 반복
//                      2. answers를 반복하면서 패턴마다 반복되는 index 만큼 %(나머지 값) 연산을 해서 결과값에 넣는다.
//                      3. 이때, 결과값(result)는 key값을 반환하기위해 dictionary로 만든다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/02.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let first: [Int] = [1, 2, 3, 4, 5] // index = 5
    let second: [Int] = [2, 1, 2, 3, 2, 4, 2, 5] // index = 8
    let third: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index = 10
    
    var result: [Int:Int] = [1:0, 2:0, 3:0]
    
    for (index, answer) in answers.enumerated() {
        if answer == first[index % 5] {
            result[1]! += 1
        }
        
        if answer == second[index % 8] {
            result[2]! += 1
        }
        
        if answer == third[index % 10] {
            result[3]! += 1
        }
    }
            
    return result.filter { result.values.max() == $0.value }.map { $0.key }.sorted(by: <)
}
