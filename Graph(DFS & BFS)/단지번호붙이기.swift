//
//  단지번호붙이기.swift
//  Question Link: https://www.acmicpc.net/problem/2667
//  Primary idea:       (DFS & BFS)
//                      1. dfs를 통해 모든 근접한 경로를 탐색한다.
//                      2. 4방향의 배열값을 담은 dx,dy를 통해 주변 정사각형을 검사한다.
//                      3. 단지의 조건
//                          i) 이동 가능 (mapSquere[][] = 1)
//                          ii) 전체 map을 벗어 나지 않아야함
//                          iii) 한번도 방문한적이 없는 곳 ( !visited[][] )
//                      4. 입력의 마지막 줄에는 0이 두 개 주어지는 조건 때문에 무한 반복문으로 해야한다.
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime: 8 ms
//  Memory Usage: 64.056 MB
//
//  Created by gunhyeong on 2020/07/29.
//

let size = Int(readLine()!)!
var mapSquare = [[Character]](repeating: [Character](), count: size)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var answer = [Int]()
var cnt = 0
var cntHouse = 0

for i in 0..<size {
    let input = readLine()!
    for num in input {
        mapSquare[i].append(num)
    }
}

for i in 0..<size {
    for j in 0..<size {
        if !visited[i][j] && mapSquare[i][j] == "1" {
            dfs(i, j)
            cnt += 1
            answer.append(cntHouse)
            cntHouse = 0
        }
    }
}

print(cnt)
for house in answer.sorted() {
    print(house)
}

func dfs(_ i: Int, _ j: Int) {
    visited[i][j] = true
    cntHouse += 1
    
    for dir in 0..<4 {
        let x = dx[dir] + i
        let y = dy[dir] + j
        
        if x < 0 || x >= size || y < 0 || y >= size {
            continue
        }
        
        if !visited[x][y] && mapSquare[x][y] == "1" {
            dfs(x, y)
        }
    }
}
