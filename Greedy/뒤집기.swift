/*
*  뒤집기.swift
*  Question Link: https://www.acmicpc.net/problem/1439
*  Primary idea:        <Greedy>
*                       1. 0과 1일 바뀌는 순간, 0과 1로 구성된 연속된 덩어리들을 증가
*                       2. 가장 작은 덩어리를 출력
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 8 ms
*  Memory Usage: 64.044 MB
*
*  Created by gunhyeong on 2020/05/04.
*/

import Foundation

var str = Array(readLine()!)
var zero = 0, one = 0

if str.first == "0" {
    zero += 1
} else {
    one += 1
}

for i in 1..<str.count {
    if str[i] != str[i-1] {
        if str[i] == "0" {
            zero += 1
        } else {
            one += 1
        }
    }
}

print(min(zero, one))
