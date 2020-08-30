//
//  로봇 청소기.swift
//  Question Link: https://www.acmicpc.net/problem/14503
//  Primary idea:       <Simulation>
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//
//  Created by gunhyeong on 2020/08/30.
//

import Foundation

let input1 = readLine()!.split(separator: " ").map{Int($0)!}
let row = input1.first!
let col = input1.last!

let input2 = readLine()!.split(separator: " ").map{Int($0)!}
let r = input2[0]
let c = input2[1]
let d = input2[2]

let area = [[Int]()
for _ in 0..<row {
    let cols = readLine()!.split(separator: " ").map{Int($0)!}
    area.append(cols)
}

