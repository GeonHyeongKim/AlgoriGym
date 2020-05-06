/*
*  문자열.swift
*  Question Link: https://www.acmicpc.net/problem/1120
*  Primary idea:        <Greedy>
*                       1. 앞/뒤로는 무조건 긴 문자열과 같은 값이 되도록 값을 넣는다고 가정
*                       2. a의 길이 < b의 길이 : a[i] != b[j]의 개수가 가장 짧은 구간으로 선택
*
*  Time Complexity : O(a^b)
*  Space Complexity : O(1)
*  Runtime: 8 ms
*  Memory Usage: 64.048 MB
*
*  Created by gunhyeong on 2020/05/06.
*/

import Foundation

var input = readLine()!.split(separator : " ")
var A = Array(input[0])
var B = Array(input[1])
var diff = B.count

for i in 0..<B.count-A.count + 1 {
    var count = 0
    for j in 0..<A.count {
        if A[j] != B[i+j] {
            count += 1
        }
    }
    
    if diff > count {
        diff = count
    }
}

print(diff)

