//
//  음계.swift
//  Question Link: https://www.acmicpc.net/problem/2920
//  Primary idea:       <구현>
//                      1. 오름차순과 내림차순을 담당하는 Bool을 선언후 true로 초기화한다.
//                          이때, 오름차순과 내림차순이 아닐때, flase로 바꾸어 준다.
//
//  Time Complexity : O(1)
//  Space Complexity : O(1)
//  Runtime: 8 ms
//  Memory Usage: 64.052 MB
//
//  Created by gunhyeong on 2020/09/21.
//

import Foundation

let play = readLine()!.split(separator: " ").map{Int($0)!}
var ascending = true
var descending = true

for i in 1..<play.count {
    if play[i] < play[i-1] {
        ascending = false
    } else {
        descending = false
    }
}

if ascending {
    print("ascending")
} else if descending {
    print("descending")
} else {
    print("mixed")
}
