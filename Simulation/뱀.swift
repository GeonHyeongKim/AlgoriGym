//
//  뱀.swift
//  Question Link: https://www.acmicpc.net/problem/3190
//  Primary idea:       (Simulation)
//                      1. 'Dummy'게임 : 사과를 먹으면 뱀의 길이가 길어진다.
//                      2. 
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/17.
//

import Foundation

let n = Int(readLine()!)! // 보드의 크기
let k = Int(readLine()!)! // 사과의 갯수
var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var applePosList = [[Point]]()

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    applePosList.append(Point(input.first!, input.last!))
}

let l = Int(readLine()!)! // 뱀의 방향 변환 횟수


// 사과의 위치
struct Point {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

// 뱀의 방향 변환
struct SnakeDir {
    var num: Int
    var char: String
    
    init(_ num: Int, _ char: String) {
        self.num = num
        self.char = char
    }
}
