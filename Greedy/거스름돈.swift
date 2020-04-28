/*
*  거스름돈.swift
*  Question Link: https://www.acmicpc.net/problem/5585
*  Primary idea:    <Greedy>
*                    1. 총 거스름돈을 넘지 않고 줄 수 있는 최대 금액을 거스름돈을 준다. (Ex: 500엔)
*                    2. 총 거스름돈에서 1번에서 구한 금액을 제외한다(Ex:120엔)
*                    3. 답을 사용한 동전만큼 더한다.
*                    4. 1~3번의 과정을 총 거스름돈이 0원이 될때까지 반복한다.(Ex : 120 - 100 = 20엔, 20 - 10 = 10엔, 10 - 10 = 0엔)
*                    5. 더해진 총 동전 개수를 구한다.(500엔 1개, 100엔 1개, 10엔 2개 -> 4개)
*
*  Time Complexity : O(1)
*  Space Complexity : O(1)
*  Runtime: 8 ms
*  Memory Usage: 64.044 MB
*
*  Created by gunhyeong on 2020/04/27.
*/

import Foundation

var changeCoin: [Int] = [500, 100, 50, 10, 5, 1]

var price = Int(readLine()!)!
var change = 1000 - price // 1
var result = 0


for coin in changeCoin {
    let curCnt = change / coin // 현재 단계에서 사용한 동전 수
    result += curCnt // 3. 이번 단계에서 사용한 동전 수를 더함
    change -= curCnt * coin // 2. 거스름돈에서 사용한 돈을 빼준다.
}

print(result)
