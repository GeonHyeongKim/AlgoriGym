//
//  주사위 네개.swift
//  Question Link: https://www.acmicpc.net/problem/2484
//  Primary idea:       (Simulation & Math & 사칙연산)
//                      1. 주사위 세개와 비슷하게 풀이
//                      2. func getPrice를 계산된 가격을 반환한다.
//                      3. 입력받은 배열을 Set으로 만든뒤
//                          i) 1개일 경우 -  50,000원+(같은 눈)*5,000원의 상금
//                          ii) 2개일 경우
//                              가) 같은 눈이 3개 - 10,000원+(3개가 나온 눈)*1,000원의 상금
//                              나) 같은 눈이 2개씩 두 쌍이 나오는 경우 - 2,000원+(2개가 나온 눈)*500원+(또 다른 2개가 나온 눈)*500원원의 상금
//                          iii) 3개일 경우 - 1,000원+(같은 눈)*100원의 상금
//                          iv) 4개일 경우 - (그 중 가장 큰 눈)*100원의 상금
//
//  Time Complexity : O(1)
//  Space Complexity : O(n)
//  Runtime: 20 ms
//  Memory Usage: 81.344 MB
//
//  Created by gunhyeong on 2020/09/25.
//

import Foundation

let people = Int(readLine()!)!
var answer = 0

for _ in 0..<people {
    let dice = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    answer = max(answer, getPrice(dice))
}

func getPrice(_ dice: [Int]) -> Int {
    let setDice = Set(dice).count

    if setDice == 1 {
        return 50000 + dice.first! * 5000
    } else if setDice == 2 {
        return dice[1] == dice[2] ? 10000 + dice[1] * 1000 : 2000 + (dice[1] + dice[2])*500
    } else if setDice == 3 {
        for i in 0..<4 {
            if dice[i] == dice[i+1] {
                return 1000 + dice[i] * 100
            }
        }
        return 0
    } else { //setDice == 4
        return dice.last! * 100
    }
}

print(answer)
