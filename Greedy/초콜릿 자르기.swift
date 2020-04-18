/*
*  초콜릿 자르기.swift
*  Question Link: https://www.acmicpc.net/problem/2163
*  Primary idea:   <Greedy>
*                  1. 초기값 : dp[1](초콜릿 1개)일때, 나눌 필요가 없기 때문에 0
*                  2. bottom-up approach : 매번 반으로 잘라서 모든 조각의 크기가 1 x 1이 될 때 까지 자르기
*                  3. 계산 : 반으로 잘랐을 때 초콜릿의 값(dp[half]) + 나머지(dp[remainder]) + 현재 초콜릿 크기(i)에서 한번 반으로 자르기 1회
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/18.
*/

import Foundation

var input = readLine()!.split(separator: " ")

let size = Int(input[0])! * Int(input[1])!
var dp = [Int](repeating: 0, count: size+1)
dp[1] = 0 // 1. 초기값

for i in 2...size { // 2. bottom-up approach
    let half = i/2
    let remainder = i-half
    
    dp[i] = dp[half] + dp[remainder] + 1 // 3. 계산
}

print(dp[size])
