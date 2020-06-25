//
//  숫자 야구.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42841
//  Primary idea:       <String & Array> - Brute force
//                      1. 최소 123 ~ 최대 987
//                      2. point!!!
//                          i) 123 ~ 987까지 각 자릿수가 겹치지 않은 숫자들을 어떻게 만들 것인가? -> 건너 뛴다
//                              가) 1~9사의 숫자가 각각1개씩 사용한다 : (number[0] == number[1]) || (number[1] == number[2]) || (number[0] == number[2])
//                              나) 0이 들어간경우와 숫자가 겹치는 경우는 경우의 수 : for char in number where char == "0"
//                          ii) request, candidate를 비교해서 스트라이크 개수와, 볼 개수를 어떻게 구할 것인가?
//                              가) 스트라이크 : request[i] == candidate[i]
//                              나) 볼 : request[i] != candidate[i] && candidate.contains(request[i])
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
    var result = 0
    
    for number in 123...987 { // 최소 ~ 최대
        let arrNumber = Array(String(number))
        var value = 0
        
        if checkDuplicate(arrNumber) {
            continue
        }
        
        for game in baseball {
            if (game[1], game[2]) == checkCandidate(Array(String(game[0])), arrNumber) {
                value += 1
            }
        }
        
        if value == baseball.count { // 경기 내용이 모두 일치하는 경우
            result += 1
        }
    }
    
    return result
}

// 숫자가 될 수 있는지 확인
func checkDuplicate(_ number: [Character]) -> Bool {
    for char in number where char == "0" { // 숫자에 0이 포함되어 있을 경우 pass
        return true
    }
    
    return (number[0] == number[1]) || (number[1] == number[2]) || (number[0] == number[2]) // 각자리의 숫자가 겹치는경우
}

func checkCandidate(_ game: [Character], _ candidate: [Character]) -> (Int, Int) {
    var strike = 0
    var ball = 0

    for i in 0..<3 {
        if game[i] == candidate[i] { //strike
            strike += 1
        } else if game[i] != candidate[i] && candidate.contains(game[i]) { // ball
            ball += 1
        }
    }
    
    return (strike, ball)
}
