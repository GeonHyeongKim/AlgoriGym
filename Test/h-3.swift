//
//  h-3.swift
//  Primary idea:       <String & Array>
//                      1. 문자에 "01"과 "10"이 포함되어 있는지 contains로 확인한다
//                      2. 01과 10을 ""로 대체한다.
//                      3. 남은 문자열의 길이를 결과값에 넣는다.
//
//  Time Complexity :
//  Space Complexity :
//
//  Created by gunhyeong on 2020/07/02.
//

import Foundation

func solution(_ S: [String]) -> [Int] {
    var answer = [Int]()
    
    for str in S {
        var str1 = str
        
        while str1.contains("01") || str1.contains("10") {
            str1 = str1.replacingOccurrences(of: "01", with: "")
            str1 = str1.replacingOccurrences(of: "10", with: "")
        }
        
        answer.append(str1.count)
    }
    
    return answer
}

print(solution(["1011", "0110011", "000111"])) // [2, 1, 0]
