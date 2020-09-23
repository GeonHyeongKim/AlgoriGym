//
//  수 찾기.swift
//  Question Link: https://www.acmicpc.net/problem/1920
//  Primary idea:       (이분 탐색)
//                      1.배열값들을 받고 A,B에 들어 있는지 contains()를 통해 확인한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let n = Int(readLine()!)!
let nList = readLine()!.split(separator: " ").map{Int($0)!}
let m = Int(readLine()!)!
let mList = readLine()!.split(separator: " ").map{Int($0)!}
var answer = ""

for num in mList.map({nList.contains($0) ? 1 : 0}) {
    answer += "\(num) "
}

