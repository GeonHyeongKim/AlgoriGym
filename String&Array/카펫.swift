//
//  카펫.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42842
//  Primary idea:       <String & Array> - Brute force
//                      1. 방정식을 이용
//                          i) x + y : (brown + 4) / 2
//                          ii) xy : brown + yellow
//                      2, 2중 반복문을 돌면서 방정식의 값들과 같으면 return
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/19.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let equation1 = (brown + 4) / 2 // x + y
    let equation2 = brown + yellow // xy

    for x in 1...5000 {
        for y in 1...x {
            if (x + y == equation1) && (x * y == equation2) {
                return [x, y]
            }
        }
    }
    
    return []
}

print(solution(10, 2))
