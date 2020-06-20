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

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    guard 1 <= n && n <= 16 else {
        return []
    }
    
    let mapSize = n
    var answer: [String] = []
    
    for row in 0..<mapSize {
        var bit = Array(String(arr1[row]|arr2[row], radix: 2))
        var str = "" // result

        while bit.count < mapSize {
            bit.insert("0", at: 0)
        }

        for block in bit { // transform
            if block == "1" {
                str += "#"
            } else {
                str += " "
            }
        }
        
        answer.append(str) 
    }
    
    return answer
}
