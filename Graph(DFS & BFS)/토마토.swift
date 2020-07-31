//
//  토마토.swift
//  Question Link: https://www.acmicpc.net/problem/7576
//  Primary idea:       (BFS)
//                      1. BFS로 토마토를 익히는 문제
//                      2. BFS을 응용 -> queue이용
//                      3. 2차원 배열을 만들어 x, y값을 저장 -> 초기값은 0,0에서 4가지 방향을 살핌(0)
//                      4. Point 구조체를 만들어 x,y을 저장함
//                      5. queue에 초기값(box의 값이 1인 x,y)을 넣은 후, 한개씩 꺼내어 quque가 빌때까지 반복함
//                      6. 4가지 방향을 돌면서 조건에 맞지 않으면 움직이지 않음
//                          ii) 미로를 벗어남
//                          iii) 값이 0이 아닐 경우 -> 1, -1
//                      7. 움직인 거리에서의 값을 계산후, 값을 update해줌
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
var box = [[Int]](repeating: [Int](repeating: 0, count: row), count: col)
var queue = [Point]()

for i in 0..<col {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    for (j, num) in input.enumerated() {
        if num == 0 { continue }
        
        if num == 1 {
            queue.append(Point(i, j))
        }
        
        box[i][j] = num
    }
}

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let x = cur.x
    let y = cur.y
    
    for i in 0..<4 {
        let posX = x + dx[i]
        let posY = y + dy[i]
        
        if posX < 0 || posY < 0 || posX >= col || posY >= row || box[posX][posY] != 0 { continue }
        
        box[posX][posY] = box[x][y] + 1
        queue.append(Point(posX, posY))
    }
}

var answer = -1

for i in 0..<col {
    if box[i].contains(0) {
        answer = 0
        break
    }
    
    answer = max(answer, box[i].max()!)
}

print(answer-1)

struct Point {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
