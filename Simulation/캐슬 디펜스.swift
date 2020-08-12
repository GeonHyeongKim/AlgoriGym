//
//  캐슬 디펜스.swift
//  Question Link: https://www.acmicpc.net/problem/17135
//  Primary idea:       (Simulation & DFS)
//                      1. 궁수 3명의 배치는 row의 값에 따라 DFS로 조합을 구한다
//                      2. 게임을 진행에 따라 구현한다.
//                          1) 궁수의 위치가 정해진 후, 기존 board을 copyBoard에 복사하여 시뮬레이션 용 copyBoard을 생성
//                          2) find() : 궁수의 위치에 따라 적들의 위치를 찾아낸다.
//                          3) 적들의 위치 중 정렬을 한다.
//                              가) 궁수가 공격하는 적은 거리가 D이하인 적 중에서 가장 가까운 적이고,
//                              나) 그러한 적이 여럿일 경우에는 가장 왼쪽에 있는 적을 공격한다
//                          4) kill() : 적들의 위치를 1에서 0으로 바꾼다. 이떄, 죽인 적들의 수를 누적한다.
//                          5) move() : 턴이 끝난 후, 적들을 움직인다.
//                          6) 결과값을 누적한 값과 비교하여 max값을 결과값에 저장한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: 112 ms
//  Memory Usage: 64.068 MB
//
//  Created by gunhyeong on 2020/08/08.
//

let info = readLine()!.split(separator: " ").map{Int($0)!}
let row = info[0]
let col = info[1]
let maxDist = info[2]
var visited = [Bool](repeating: false, count: col)
var artherPosList = [[Int]]()
var board = [[Int]]()
var copyBoard = [[Int]]()
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
    copyBoard = board
    var cnt = 0
    var gameCnt = row
    while gameCnt > 0 {
        gameCnt -= 1
        
        var enemies = [(Int, Int)]()
        for pos in artherPos {
            find(pos, &enemies)
        }
        
        cnt += kill(&enemies)
        
        move()
    }
    
    answer = max(answer, cnt)
}

// 죽일 수 있는 적들의 위치 찾기
func find(_ pos: Int, _ enemies: inout [(Int, Int)]) {
    var candidateEnemies = [(Int, Int, Int)]()

    for i in 0..<row {
        for j in 0..<col {
            if copyBoard[i][j] == 1 {
                let distance = dist(i, j, row, pos)
                if distance <= maxDist {
                    candidateEnemies.append((i, j, distance))
                }
            }
        }
    }
    
    if candidateEnemies.count > 0 {
        candidateEnemies.sort(by: {
            if $0.2 == $1.2 {
                return $0.1 < $1.1
            } else {
                return $0.2 < $1.2
            }
        })
        let candidate = candidateEnemies.first!
        enemies.append((candidate.0, candidate.1))
    }
}

func kill(_ enemies: inout [(Int, Int)]) -> Int {
    var cnt = 0
    for e in enemies {
        if copyBoard[e.0][e.1] == 1 {
            copyBoard[e.0][e.1] = 0
            cnt += 1
        }
    }
    return cnt
}

// 전쟁 후, 적들을 움직임
func move() {
    for i in stride(from: row-2, through: 0, by: -1) {
        for j in 0..<col {
            copyBoard[i+1][j] = copyBoard[i][j]
        }
    }
    for i in 0..<col {
        copyBoard[0][i] = 0
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
