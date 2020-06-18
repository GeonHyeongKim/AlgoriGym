//
//  숫자 야구.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42841
//  Primary idea:       <String & Array> - Brute force
//                      1. 최소 123 ~ 최대 987
//                      2. 모든 경우의 수를 생각해보자
//                          i) 1~9사의 숫자가 각각1개씩 사용한다
//                          ii) 0이 들어간경우와 숫자가 겹치는 경우는 경우의 수에서 제거
//                          iii) 비교해서 스트라이크혹은 볼의 수가 맞지않는다면 경우의 수에서 제거
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/17.
//

import Foundation

func solution(_ baseball:[[Int]]) -> Int {
    var result = [String]() // 결과
    var isVisit = [Bool](repeating: false, count: 10)
    var curball = [Int]()
    
    dfs(baseball, &curball, &isVisit, &result)
    
    print(result)
    
    return 0
}

func dfs(_ baseball: [[Int]], _ curball: inout [Int], _ isVisit: inout [Bool], _ result: inout [String]) {
    if curball.count == 3 {
        result.append(curball.reduce("", {$0 + "\($1)" }))
        return
    }
    
    for i in 0..<10 {
        if !isVisit[i] {
            curball.append(i)
            isVisit[i] = true
            dfs(baseball, &curball, &isVisit, &result)
            isVisit[i] = false
            curball.removeLast()
        }
    }
}
