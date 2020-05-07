/*
*  토너먼트 만들기.swift
*  Question Link: https://www.acmicpc.net/problem/1120
*  Primary idea:        <Greedy>
*                       1. 랭킹이 가장 낮은 선수부터 찾고 좌,우 선수 중 랭킹 차이가 적은 선수와 시합 하도록 한다.
*                            ex) 1 6 2 5 3 4 (6 - 2 = 4)
*                                1 2 5 3 4 (5 - 3 = 2)
*                                1 2 3 4 (4 - 3 = 1)
*                                1 2 3 (3 - 2 = 1)
*                                1 2 (2 - 1 = 1)
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 8 ms
*  Memory Usage: 64.052 MB
*
*  Created by gunhyeong on 2020/05/07.
*/

import Foundation

var n = Int(readLine()!)!
var ranks = Array(readLine()!.split(separator: " ").map{Int($0)!})
var maxRank = n
var diff = 0

for _ in 0..<ranks.count - 1 {
    let maxIndex = ranks.firstIndex(of: maxRank)!
    if maxIndex == 0 { // 가장 왼쪽일 경우
        diff += ranks[maxIndex] - ranks[maxIndex + 1]
    } else if maxIndex == ranks.count - 1 { // 가장 오른쪽일 경우
        diff += ranks[maxIndex] - ranks[maxIndex - 1]
    } else {
        let left = ranks[maxIndex] - ranks[maxIndex + 1]
        let right = ranks[maxIndex] - ranks[maxIndex - 1]
        diff += min(left, right) // 좌,우 선수 중 랭킹 차이가 적은 선수와 시합
    }
    
    ranks.remove(at: maxIndex) // 시합 후 퇴장
    maxRank -= 1
}

print(diff)
