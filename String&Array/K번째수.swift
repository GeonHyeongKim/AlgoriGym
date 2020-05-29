//
//  K번째수.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42748
//  Primary idea:       <String & Array>
//                      1. commands를 반복문으로 돌린다
//                      2. command의 3가지 값(start, end, target)에서 index조절 값 1을 빼기
//                      3. 정렬 후 결과값에 append
//
//  Time Complexity : O(n), n은 commands의 수
//  Space Complexity : O(1)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/29.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    let oneBasedNumbering = 1
    
    for command in commands {
        let start = command[0] - oneBasedNumbering
        let end = command[1] - oneBasedNumbering
        let target = command[2] - oneBasedNumbering
        
        let sortedArr = array[start...end].sorted()
        result.append(sortedArr[target])
    }
    
    return result
}
