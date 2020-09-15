//
//  공.swift
//  Question Link: https://www.acmicpc.net/problem/1547
//  Primary idea:       (Simulation)
//                      1. 야바위를 하는 문제!
//                      2. 배열의 swapAt을 이용
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation

var m = Int(readLine()!)!
let switchList = [Int]()

// 입력
while m > 0 {
    m -= 1
    let input = readLine()!.split(separator: " ").map{Int($0)! - 1}
    switchList.append(input)
}

