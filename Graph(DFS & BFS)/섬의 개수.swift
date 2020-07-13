//
//  섬의 개수.swift
//  Question Link: https://www.acmicpc.net/problem/4963
//  Primary idea:       <DFS & BFS> - dfs
//                      1. dfs를 통해 모든 근접한 경로를 탐색한다.
//                      2. 8방향의 배열값을 담은 dx,dy를 통해 주변 정사각형을 검사한다.
//                      3. 섬의 조건
//                          i) 이동 가능 (island[][] = 1)
//                          ii) 전체 땅을 벗어 나지 않아야함
//                          iii) 한번도 방문한적이 없는 곳 ( !visited[][] )
//                      4. 입력의 마지막 줄에는 0이 두 개 주어지는 조건 때문에 무한 반복문으로 해야한다.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime: 20 ms
//  Memory Usage: 64.260 MB
//
//  Created by gunhyeong on 2020/07/12.
//

import Foundation

// 북, 동북, 동, 동남, 남, 남서, 서, 북서
let dx = [-1,-1,0,1,1,1,0,-1]
let dy = [0,1,1,1,0,-1,-1,-1]
var w = 0
var h = 0

while true {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    w = input[0]
    h = input[1]
    if w == 0 && h == 0 {
        break
    }
    
    var island = [[Int]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    var cnt = 0

    for _ in 0..<h {
        let land = readLine()!.split(separator: " ").map{Int($0)!}
        island.append(land)
    }

    for i in 0..<h {
        for j in 0..<w {
            if !visited[i][j] && island[i][j] == 1 { // 방문을 아직한적이 없고 땅(1)이라면 섬으로 인식
                dfs(&island, &visited, i, j)
                cnt += 1
            }
        }
    }

    print(cnt)
}

func dfs(_ island: inout [[Int]], _ visited: inout [[Bool]], _ i: Int, _ j: Int) {
    visited[i][j] = true
    
    for dir in 0..<8 { // 8개 방향
        let x = i + dx[dir]
        let y = j + dy[dir]
        
        if x < 0 || x >= h || y < 0 || y >= w {
            continue
        }
        
        if !visited[x][y] && island[x][y] == 1 {
            dfs(&island, &visited, x, y)
        }
    }
}
