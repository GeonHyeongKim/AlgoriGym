//
//  보석 쇼핑.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/67258
//  Primary idea:       (String & Array & Dictionary)
//                      1. 보석의 종류가 몇개인지 세어준다.
//                      2. 보석을 저장할 Dictionary(String:Int)을 만든다.
//                      3. 이제 보석 배열(gems)을 돌면서 Dictionary에 보석과 보석 자리를 저장한다.
//                      4. Dictionary의 count가 보석 종류의 갯수와 일치하면, 해당 구간을 저장한다.
//                      5. 정렬을 통해 시작 진열대 번호가 더 작은 구간 or 더 짧은 구간을 반환한다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.35 ~ 32.69 ms
//  Memory Usage: 23.9 ~ 24.6 MB
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
            answer.append([dic.values.min()!, i+1])
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
