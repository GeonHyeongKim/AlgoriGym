//
//  지능형 기차.swift
//  Question Link: https://www.acmicpc.net/problem/2455
//  Primary idea:       <Simulation>
//                      1. 4번의 input을 받는다.
//                      2. 현재 타고 있는 사람수를 구한다.
//                      3. 최대 인원인지 비교하며 값을 저장한다.
//
//  Time Complexity : O(1)
//  Space Complexity : O(1)
//  Runtime: 12 ms
//  Memory Usage: 81.332 MB
//
//  Created by gunhyeong on 2020/08/05.
//

import Foundation

var people = 0
var maxPeople = Int.min

for _ in 0..<4 {
    let subway = readLine()!.split(separator: " ").map{Int($0)!}
    let disembark = subway.first!
    let embark = subway.last!
    
    people += embark - disembark
    
    maxPeople = max(maxPeople, people)
}

print(maxPeople)

