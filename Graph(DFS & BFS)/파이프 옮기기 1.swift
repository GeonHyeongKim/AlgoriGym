//
//  파이프 옮기기 1.swift
//  Question Link: https://www.acmicpc.net/problem/17070
//  Primary idea:       (DFS & Brute force)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/07.
//

import Foundation

let size = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<size {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(input)
}

let dirs = [[0, 1], [1, 0], [1, 1]]
var answer = 0
var queue = [(Int, Int, Int)]()
queue.append((0, 1, 0))

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let x = cur.0
    let y = cur.1
    let direction = cur.2
    
    if x == size - 1 && y == size - 1 {
        answer += 1
        continue
    }
    
    for (i, dir) in dirs.enumerated() {
        let x = x + dir.first!
        let y = y + dir.last!
        
        if (direction + i) == 1 { continue } // (row -> col) or (col -> row)
        
        if x >= size || y >= size || map[x][y] == 1 { continue }
        
        if i == 2 { // cross
            if map[x-1][y] == 0 && map[x][y-1] == 0 {
                queue.append((x, y, i))
            }
        } else {
            queue.append((x, y, i))
        }
    }
}

print(answer)
