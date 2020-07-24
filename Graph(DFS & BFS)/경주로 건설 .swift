//
//  경주로 건설 .swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/43164
//  Primary idea:       (Graph & BFS & Dijkstra)
//                      1. 다익스트라 최단경로를 살짝 변형한 문제 (직선 코스와 코너 코스로 이동이 가능)
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
//
//  Time Complexity : O(E logE)
//  Space Complexity : O(n^3)
//  Runtime: 0.24 ~. 9.55  ms
//  Memory Usage: 24.2 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/07/22.
//

import Foundation

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var row = 0
var col = 0
let INF = Int.max

func solution(_ board:[[Int]]) -> Int {
    row = board.count
    col = board[0].count
    var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: 4), count: 25), count: 25)
    var queue = [Point]()
    
    // dist[x][y][direction]
    dist[0][0][0] = 0
    dist[0][0][1] = 0
    dist[0][0][2] = 0
    dist[0][0][3] = 0
    
    // 초기화
    queue.append(Point(0,0,0,0))
    queue.append(Point(0,0,0,1))
    queue.append(Point(0,0,0,2))
    queue.append(Point(0,0,0,3))
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        let x = cur.x
        let y = cur.y
        let cost = cur.cost
        let dir = cur.direction
        
        for i in 0..<4 {
            let x = x + dx[dir]
            let y = y + dy[dir]
            
            // 방금 왔던 칸으로 돌아가는 경우
            if abs(dir - i) == 2 { continue }
            
            // out of range
            if x < 0 || y < 0 || x >= row || y >= col || board[x][y] == 1 { continue }
            
            var curCost = 0
            if dir == i { // 직진인 경우
                curCost = 100
            } else { // 곡선인 경우
                curCost = 600
            }
            
            let nextCost = cost + curCost
            if dist[x][y][i] > nextCost {
                dist[x][y][i] = nextCost
                queue.append(Point(x, y, nextCost, i))
            }
        }
    }
        
    return dist[row-1][col-1].min()!
}

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
