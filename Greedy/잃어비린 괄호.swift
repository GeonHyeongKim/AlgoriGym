/*
*  잃어비린 괄호.swift
*  Question Link: https://www.acmicpc.net/problem/2200
*  Primary idea:        <Greedy>
*                       1. 최솟값을 위해 덧셈끼리 모두 묶기
*
*  Time Complexity : O(n)
*  Space Complexity : O(n)
*  Runtime: 64.044 ms
*  Memory Usage: 8 MB
*
*  Created by gunhyeong on 2020/05/08.
*/

import Foundation

var input = readLine()!
var newStr = [Int]()
var sum = 0
var temp = 0

for char in input {
    if char == "-" {
        sum += temp
        newStr.append(sum)
        sum = 0
        temp = 0
    } else if char == "+" {
        sum += temp
        temp = 0
    } else { // 숫자일 경우
        temp *= 10
        temp += char.wholeNumberValue! // 숫자로 변경
    }
}

sum += temp
newStr.append(sum)

sum = newStr.first!
newStr.removeFirst()
print(sum - newStr.reduce(0, +))

