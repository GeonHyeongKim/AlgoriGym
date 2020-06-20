//
//  카펫.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42842
//  Primary idea:       <String & Array> - Brute force
//                      1. 방정식을 이용
//                          i) x + y : (brown + 4) / 2
//                          ii) xy : brown + yellow
//                      2, 2중 반복문을 돌면서 방정식의 값들과 같으면 return
//
//  Time Complexity : O(sqrt(n))
//  Space Complexity : O(1)
//  Runtime: 0.14 ~ 0.16 ms
//  Memory Usage: 24.0 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/06/19.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let equation1 = (brown + 4) / 2 // x + y
    let equation2 = brown + yellow // xy

    for x in 3...5000 {
        if equation2 % x != 0 {
            continue
        }
        
        let y = equation2/x
        if equation1 == x + y {
            return x > y ? [x,y] : [y,x]
        }
    }
    
    return []
}


print(solution(10, 2))
