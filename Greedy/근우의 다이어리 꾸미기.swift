//
//  근우의 다이어리 꾸미기.swift
//  Question Link: https://www.acmicpc.net/problem/16676
//  Primary idea:       (Greedy)
//                      1. 문자열을 입력 받는다.
//                      2. 문자열의 길이를 계산한다.
//                      3. 문자열의 길이만큼 1이 포함되는 경우가 존재하는지 판단한다.
//                      4. 3의 조건을 만족하면 문자열의 길이를, 만족하지 않으면 문자열 길이 -1을 출력한다.
//
//  Time Complexity : O(n)
//  Space Complexity : O(1)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/10/02.
//


import Foundation

var n = readLine()! // 0~n
let size = n.count
var digit = 1

for _ in 1..<size {
    digit = digit * 10 + 1
}

if size == 0 {
    print(1)
} else if digit > Int(n)! {
    print(size - 1)
} else {
    print(size)
}
