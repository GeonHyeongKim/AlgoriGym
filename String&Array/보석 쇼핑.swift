//
//  보석 쇼핑.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/67258
//  Primary idea:       (String & Array & Dictionary)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/16.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {
    var answer = [[Int]]()
    let setGem = Set(gems)
    let count = setGem.count
    var dic = [String:Int]()
    
    for (i, gem) in gems.enumerated() {
        dic[gem] = i + 1
        
        if count == dic.count {
            answer.append([dic.values.min()!, dic.values.max()!])
        }
    }
    
    answer.sort(by: {
        if ($0.first! - $0.last!) == ($1.first! - $1.last!) {
            return $0.first! < $1.first!
        } else {
            return ($0.first! - $0.last!) > ($1.first! - $1.last!)
        }
        
    })
    
    return answer.first!
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3, 7]
print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1, 3]
print(solution(["XYZ", "XYZ", "XYZ"])) // [1, 1]
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])) // [1, 5]
