//
//  H-Index.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42747?language=swift
//  Primary idea:       <String & Array> - sorted
//                      1. 내림차순으로 정렬한다.
//                      2. 정렬한 값에서 내림차순 값이 index의 값 보다 작아 질때 return 한다.
//
//  Time Complexity :
//  Space Complexity : 
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/01.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >) // 내림 차순 정렬
    
    for (index, citation) in sorted.enumerated() {
        if index >= citation { // index가 value(=citation)보다 큰 경우
            return index // h-index
        }
    }
    
    return sorted.count
}
