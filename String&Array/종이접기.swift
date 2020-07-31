//
//  종이접기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/62049
//  Primary idea:       (String & Array & Brute force)
//                      1. 규칙성
//                          i) 무조건 0으로 시작한다.
//                          ii) 결과 값 중간은 무조건 0이다.
//                          iii) n은 n-1의 패턴을 가지고있다
//                          iv) 가운데 0을 기준으로 왼쪽 오른쪽이 보수 관계
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n)
//  Runtime: 0.24 ~ 1941.35 ms
//  Memory Usage: 23.9 ~ 74.7 MB
//
//  Created by gunhyeong on 2020/07/31.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    guard n != 1 else { return [0] }
    
    var answer = "0"
    for _ in 1..<n {
        answer = pattern(answer)
    }
    
    return answer.compactMap { Int($0.description) }
}

func pattern(_ curAnswer: String) -> String {
    var right = ""
    
    for num in curAnswer.reversed() {
        if num == "0" {
            right += "1"
        } else {
            right += "0"
        }
    }
    return curAnswer + "0" + right
}

print(solution(1)) // [0]
print(solution(2)) // [0,0,1]
print(solution(3)) // [0,0,1,0,0,1,1]
