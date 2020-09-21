//
//  블랙잭.swift
//  Question Link: https://www.acmicpc.net/problem/2798
//  Primary idea:       (String & Array & Brute force)
//                      1. 완전탐색으로 삼중반복문을 통해 모든 3가지 조합를 구한뒤 m 보다 작은 합을 색출
//                      2. 색출된 값중 가장 큰 값을 저장
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:MB
//
//  Created by gunhyeong on 2020/09/21.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input.first!
let m = input.last!
let card = readLine()!.split(separator: " ").map{Int($0)!}
var maxValue = 0
var sum = 0

for i in 0..<card.count {
    for j in i+1..<card.count {
        for k in j+1..<card.count {
            sum = card[i] + card[j] + card[k]
            if sum < m {
                maxValue = max(maxValue, sum)
            }
        }
    }
}

print(maxValue)
