//
//  키패드 누르기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/67256
//  Primary idea:       (Simulation)
//                      1. 키패드를 dictionary로 선언하여 숫자에 맞는 2차원 배열값을 미리 넣어둔다.
//                      2. 왼손과 오른손의 위치를 저장
//                      3. 왼손과 키패드간에 거리, 오른손과 키패드간의 거리를 계산
//                      4. 키패드간 거리는 가로길이차이 + 세로길이차이로 계산
//                      5. 키패드마다 좌표를 딕셔너리 형태로 저장하여 거리를 계산
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.14 ~ 2.15 ms
//  Memory Usage: 23.6 ~ 24.2 MB
//
//  Created by gunhyeong on 2020/08/14.
//

import Foundation

let phoneNumber = [
    "1":(0, 0),"2":(0, 1),"3":(0, 2),
    "4":(1, 0),"5":(1, 1),"6":(1, 2),
    "7":(2, 0),"8":(2, 1),"9":(2, 2),
    "*":(3, 0),"0":(3, 1),"#":(3, 2)
]

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var left = "*"
    var right = "#"
    let hand = hand == "right" ? "R" : "L"
    
    for number in numbers {
        if [1,4,7].contains(number) {
            answer += "L"
            left = String(number)
        } else if [2,5,8,0].contains(number) {
            let distByLeft = dist(left, String(number))
            let distByRight = dist(right, String(number))
            
            // 거리 계산
            if distByLeft < distByRight {
                answer += "L"
                left = String(number)
            } else if distByLeft > distByRight {
                answer += "R"
                right = String(number)
            } else if distByLeft == distByRight {
                answer += hand
                if hand == "L" {
                    left = String(number)
                } else if hand == "R" {
                    right = String(number)
                }
            }
        } else if [3,6,9].contains(number) {
            answer += "R"
            right = String(number)
        }
    }
    
    return answer
}

func dist(_ start: String, _ dest: String) -> Int {
    let x = phoneNumber[start]!.0
    let y = phoneNumber[start]!.1

    let xx = phoneNumber[dest]!.0
    let yy = phoneNumber[dest]!.1
    
    return abs(x-xx) + abs(y-yy)
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")) // "LRLLLRLLRRL"
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left")) // "LRLLRRLLLRR"
print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right")) // "LLRLLRLLRL"

