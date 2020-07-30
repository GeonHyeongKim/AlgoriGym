//
//  토마토.swift
//  Question Link: https://www.acmicpc.net/problem/7576
//  Primary idea:       (Graph & BFS)
//                      1. BFS로 토마토를 익히는 문제
//                      2.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/07/30.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let row = input.first!
let col = input.last!
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var box = [[Int]](repeating: [Int](), count: col)
var queue = [Point]()

for i in 0..<col {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    box[i].append(contentsOf: input)
}


for i in 0..<col {
    for j in 0..<row {
        if box[i][i] == 1 {
            queue.append(Point(i, j))
        }
    }
}

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let x = cur.x
    let y = cur.y
    
    for i in 0..<4 {
        let posX = x + dx[i]
        let posY = y + dy[i]
        
        if posX < 0 || posY < 0 || posX >= row || posY >= col || box[posX][posY] == 1 { continue }
        
        box[posX][posY] = box[x][y] + 1
        queue.append(Point(posX, posY))
    }
}

var maxInt = -1
for i in 0..<col {
    for j in 0..<row {
        if box[i][i] == 0 {
            print("-1")
            break
        }
        
        maxInt = max(maxInt, box[i][j])
    }
}

print(maxInt)

struct Point {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
