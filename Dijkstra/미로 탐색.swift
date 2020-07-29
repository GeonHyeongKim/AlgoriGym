//
//  미로 탐색.swift
//  Question Link: https://www.acmicpc.net/problem/2178
//  Primary idea:       (Graph & BFS & Dijkstra)
//                      1. BFS의 특징은 각 정점을 최단경로로 방문한다는 것입니다. 이 점을 활용해 최단거리를 구해 봅시다.
//                      2. BFS을 응용 -> queue이용
//                      3. 3차원 배열을 만들어 x, y, 방향을 저장함 -> 초기값은 0,0에서 4가지 방향을 살핌(0)
//                      4. Point 구조체를 만들어 x,y,codt,방향을 저장함
//                      5. queue에 초기값 0,0에서 값을 넣은 후, 한개씩 꺼내어 quque가 빌때까지 반복함
//                      6. 4가지 방향을 돌면서 조건에 맞지 않으면 움직이지 않음
//                          i) 방금왔던 거리를 다시 가지 않도록 방지
//                          ii) 미로를 벗어남
//                          iii) 값이 1(벽)일 경우
//                      7. 움직인 거리에서의 값을 계산후, 3차원 배열의 값과 비교해 최소값을 저장함
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:   ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let row = input.first!
let col = input.last!
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
let INF = Int.max

var maze = [[Character]](repeating: [Character](), count: row)
var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: 4), count: 101), count: 101)

for i in 0..<row {
    let input = readLine()!
    
    for num in input {
        maze[i].append(num)
    }
}

// dist[x][y][dirction]
dist[0][0][0] = 0
dist[0][0][1] = 0
dist[0][0][2] = 0
dist[0][0][3] = 0

//초기화
var queue = [Point]()
queue.append(Point(0, 0, 1, 0))
queue.append(Point(0, 0, 1, 1))
queue.append(Point(0, 0, 1, 2))
queue.append(Point(0, 0, 1, 3))

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let x = cur.x
    let y = cur.y
    let cost = cur.cost
    let dir = cur.direction
    
    for i in 0..<4 {
        let x = x + dx[dir]
        let y = y + dy[dir]
        
        if abs(dir - i) == 2 { continue }
        
        if x < 0 || y < 0 || x >= row || y >= col || maze[x][y] == "0" { continue }
        
        let nextCost = cost + 1
        if dist[x][y][i] > nextCost {
            dist[x][y][i] = nextCost
            queue.append(Point(x, y, nextCost, i))
        }
    }
}

print(dist[row-1][col-1].min()!)

struct Point {
    var x: Int
    var y: Int
    var cost: Int
    var direction: Int
    
    init(_ x: Int, _ y: Int, _ cost: Int, _ direction: Int) {
        self.x = x
        self.y = y
        self.cost = cost
        self.direction = direction
    }
}

