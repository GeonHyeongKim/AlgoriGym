//
//  쇠막대기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42585
//  Primary idea:       <String & Array> - Stack
//                      1. '(' 가 나오면
//                          i) 스택에 Push() 해준다.
//                          ii) ')'이 나오면 스택의 사이즈 만큼 정답에 더해주고, 다음 index는 skip
//                      2. ')'가 나오면 스택에 removeLast() (즉, pop())을 해서 짝을 맞춰주고 1을 더해준다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/23.
//

import Foundation

func solution(_ arrangement:String) -> Int {
    var result = 0
    var stack = [String]()
    let arrArrangement = Array(arrangement)
    let size = arrArrangement.count
    var skip = false
        
    for (i, char) in arrangement.enumerated() {
        if skip { // 다음으로 뛰어 넘는 기능
            skip = false
            continue
        }
        
        if char == "(" {
            if (i+1 < size) && (arrArrangement[i+1] == ")"){
                result += stack.count
                skip = true
            } else {
                stack.append("(") // push (
            }
        } else if char == ")" {
            stack.removeLast()
            result += 1
        }
    }
    
    return result
}
