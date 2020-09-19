//
//  뱀.swift
//  Question Link: https://www.acmicpc.net/problem/3190
//  Primary idea:       (Simulation)
//                      1. 'Dummy'게임 : 사과를 먹으면 뱀의 길이가 길어진다.
//                      2. 뱀은 1초부터 움직임을 시작한다.
//                      3. 뱀의 몸통은 움직이기 전까지 그 자리에 정지해있다. 즉, 길이가 5인 뱀의 움직임은 ----- => ---- - => --- -- => -- --- => - ---- => ----- 식으로 움직인다는 것이다.
//                      4. 뱀의 이동 방향은 뱀의 머리 기준 오른쪽 왼쪽이다.
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
    let input = readLine()!.split(separator: " ").map{Int($0)! - 1}
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
