//
//  캐슬 디펜스.swift
//  Question Link: https://www.acmicpc.net/problem/17135
//  Primary idea:       (DFS & BFS)
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/08.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let row = info[0]
let col = info[1]
let maxDist = info[2]
var visited = [Bool](repeating: false, count: col)
var artherPosList = [[Int]]()
var board = [[Int]]()
var answer = 0

for _ in 0..<row {
    let cols = readLine()!.split(separator: " ").map{Int($0)!}
    board.append(cols)
}

board.append([Int](repeating: 0, count: col))
dfs(0, [])
for artherPos in artherPosList {
    game(artherPos)
}
print(answer)

func game(_ artherPos: [Int]) {
    var cnt = 0
    var gameCnt = row
    while gameCnt > 0 {
        gameCnt -= 1
        
        var enemies = [(Int, Int)]()
        var candidateEnemies = [(Int, Int, Int)]()
        for pos in artherPos {
            find(pos, &candidateEnemies, &enemies)
        }
        
        cnt += kill(&enemies)

        move()
    }
    
    answer = max(answer, cnt)
}

// 죽일 수 있는 적들의 위치 찾기
func find(_ pos: Int, _ candidateEnemies: inout [(Int, Int, Int)],  _ enemies: inout [(Int, Int)]) {
    for i in 0..<row {
        for j in 0..<col {
            if board[i][j] == 1 {
                let distance = dist(i, j, col, pos)
                if distance < maxDist {
                    candidateEnemies.append((i, j, distance))
                }
            }
        }
    }
    
    if candidateEnemies.count > 0 {
        candidateEnemies.sort(by: {
            if $0.2 == $1.2 {
                return $0.1 > $1.1
            } else {
                return $0.2 > $1.2
            }
        })
        
        let candidate = candidateEnemies.first!
        enemies.append((candidate.0, candidate.1))
    }
}

// 적 죽이기
func kill(_ enemies: inout [(Int, Int)]) -> Int {
    var cnt = 0
    for e in enemies {
        if board[e.0][e.1] == 1 {
            board[e.0][e.1] = 0
            cnt += 1
        }
    }
    return cnt
}

// 전쟁 후, 적들을 움직임
func move() {
    for i in stride(from: row-2, through: 0, by: -1) {
        for j in 0..<col {
            board[i+1][j] = board[i][j]
        }
    }
    for i in 0..<col {
        board[0][i] = 0
    }
}

// 거리 계산
func dist(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int ) -> Int {
    return abs(x - xx) + abs(y - yy)
}

// 궁수의 모든 위치 구하기 - 호합
func dfs(_ startIndex: Int, _ cur: [Int]) {
    if cur.count == 3 {
        artherPosList.append(cur)
        return
    }
    
    for i in startIndex..<col {
        if !visited[i] {
            visited[i] = true
            dfs(i, cur + [i])
            visited[i] = false
        }
    }
}
