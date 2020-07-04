//
//  JadenCase 문자열 만들기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12951
//  Primary idea:       <String & Array> - lowercased() & isFirst:Bool
//                      1. lowercased()을 통해 문자열을 소문자로 바꾸어 준다.
//                      2. isFirst를 통해 공백 뒤에 올 첫문자를 대문자로 바꾸어 준다.
//                      * 주의! 공백이 연속으로 나올수도 있다. 그렇다면 그 문자열 형태로 반환해야한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/04.
//

import Foundation

func solution(_ s:String) -> String {
    let lowerCaseStr = s.lowercased()
    var isFirst = true
    var answer = ""
    
    for char in lowerCaseStr {
        if char == " " {
            answer += " "
            isFirst = true
            continue
        }
        
        if isFirst {
            answer += char.uppercased()
            isFirst = false
        } else {
            answer += String(char)
        }
    }
    
    return answer
}
