/*
*  동전 0.swift
*  Question Link: https://www.acmicpc.net/problem/11047
*  Primary idea:    <Greedy>
*                    1. Greedy는 매 순간마다 k를 넘지 않는 가장 큰 값을 고르는 경우를 세면 된다. (DP X)
*                    2. 나누기를 이용해서 횟수를 구하기
*                    3. k는 %연산자를 이용해 값을 갱신
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:
*
*  Created by gunhyeong on 2020/05/03.
*/

import Foundation

var input = readLine()!.split(separator: " ")
var n = Int(input[0])!
var k = Int(input[1])!
var coins = [Int]()
var count = 0

for _ in 1...n {
    let coin = (Int(readLine()!)!)
    coins.append(coin)
}

var currentIndex = coins.count - 1

while currentIndex >= 0 {
    count += k/coins[currentIndex]
    k %= coins[currentIndex]
    currentIndex -= 1
}

print(count)
