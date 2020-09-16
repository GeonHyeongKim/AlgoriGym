//
//  탈출.swift
//  Question Link: https://www.acmicpc.net/problem/3055
//  Primary idea:       (Simulation & BFS)
//                      1. graph에서 고슴도치와 물이 4방지로 움직이기 때문에 BFS로 고려
//                      2. 방향을 나타내는 배열을 만든다.
//                      3. 고슴도치가 움직일수 있는지 없는지와 비버굴에 도착도착의 여부 2가지를 통해 계산을 종료한다.
//                          i) 물이 먼저 채워진다 => 고슴도치가 움직일 수 없다.
//                          ii) 고슴도치가 비버굴(D)에 도착한다. => Break
//                      4. 초기에 고슴도치의 시작 위치 저장
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let row = input.first!
let col = input.last!
var map = [[Character]](repeating: [Character](repeating: Character("."), count: col), count: row)
var hedgehog = [Point]() // 고슴도치 위치
var water = [Point]() // 물 위치
var endPoint: Point

for i in 0..<row {
    let str = readLine()!
    for (j, c) in str.enumerated() {
        if c == "S" { // 시작지점
            hedgehog.append(Point(i, j))
        } else if c == "*" { // 물의 위치
            water.append(Point(i, j))
        } else if c == "D" { // 도착지점
            endPoint = Point(i, j)
        }
        map[i][j] = c
    }
}

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

var answer = 0

while true {
    answer += 1
    if hedgehog.count == 0 {
        print("KAKTUS")
        break
    }
    
    extendWater()
    if extendHedgehog() {
        print(answer)
        break
    }
    
    printArr()
}

// 고슴도치 확장 경로 계산
func extendHedgehog() -> Bool {
    let size = hedgehog.count
    
    for _ in 0..<size {
        let h = hedgehog.removeFirst()
        
        // 고슴도치 이동
        for i in 0..<4 {
            let x = h.x + dx[i]
            let y = h.y + dy[i]
            
            if x < 0 || x >= row || y < 0 || y >= col { continue } // 경계선
            
            if map[x][y] == "." {
                map[x][y] = "S"
                hedgehog.append(Point(x, y))
            } else if map[x][y] == "D" {
                hedgehog.append(Point(x, y))
                return true
            }
        }
    }
    return false
}

// 물이 확장되는 경로 계산
func extendWater() {
    let size = water.count
    
    for _ in 0..<size {
        let w = water.removeFirst()
        
        for i in 0..<4 {
            let x = w.x + dx[i]
            let y = w.y + dy[i]
            
            if x < 0 || x >= row || y < 0 || y >= col { continue } // 경계선
            
            if map[x][y] == "." {
                map[x][y] = "*"
                water.append(Point(x, y))
            }
        }
    }
}

// map의 상황을 출력
func printArr() {
    print()
    for i in 0..<row {
        for j in 0..<col {
            print(map[i][j], terminator: "")
        }
        print()
    }
}

struct Point {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
