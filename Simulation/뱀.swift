//
//  뱀.swift
//  Question Link: https://www.acmicpc.net/problem/3190
//  Primary idea:       (Simulation)
//                      1. 'Dummy'게임 : 사과를 먹으면 뱀의 길이가 길어진다.
//                      2. 뱀은 1초부터 움직임을 시작한다.
//                      3. 뱀의 몸통은 움직이기 전까지 그 자리에 정지해있다. 즉, 길이가 5인 뱀의 움직임은 ----- => ---- - => --- -- => -- --- => - ---- => ----- 식으로 움직인다는 것이다.
//                      4. 뱀의 이동 방향은 뱀의 머리 기준 오른쪽 왼쪽이다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/17.
//

import Foundation

let n = Int(readLine()!)! // 보드의 크기
let k = Int(readLine()!)! // 사과의 갯수
var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var snakeDirList = [(Int, String)]()
let dx = [-1, 0 , 1, 0]
let dy = [0, 1, 0, -1]
var time = 0
var dir = 0

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map{Int($0)! - 1}
    board[input.first!][input.last!] = 1 // 사과 위치 저장
}

let l = Int(readLine()!)! // 뱀의 방향 변환 횟수
for _ in 0..<l {
    let input = readLine()!.split(separator: " ")
    snakeDirList.append((Int(input.first!)!, input.last!.description))
}

var snakeQueue = [Point]()
snakeQueue.append(Point(0, 0)) // 벰의 시작 위치값 입력
var x = 0
var y = 0
board[x][y] = 2 // 지도에서 뱀의 시작 위치

while true {
    time += 1 // 1초씩 시간이 경과
    let nextX = x + dx[dir]
    let nextY = y + dy[dir]
    
    // 벽, 자신의 일부
    if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n || board[nextX][nextY] == -1 {
        break
        
    }
    if board[nextX][nextY] == 0 { // 빈 공간일 경우
        board[nextX][nextY] = 2 // 앞머리 이동
        board[snakeQueue.last!.x][snakeQueue.last!.y] = 0 // 뒤꼬리 이동
        snakeQueue.removeLast() // 뒤꼬리 삭제
        snakeQueue.insert(Point(nextX, nextY), at: 0) // 앞머리 삽입
    } else if board[nextX][nextY] == 1 { // 사과가 있을 경우
        board[nextX][nextY] = 2 // 앞머리 이동
        snakeQueue.insert(Point(nextX, nextY), at: 0) // 앞머리 삽입
    }
    
    if !snakeDirList.isEmpty {
        if snakeDirList.first!.0 == time {
            if snakeDirList.last!.1 == "L" {
                dir = (dir + 3) % 4
            } else if snakeDirList.last!.1 == "D" {
                dir = (dir + 1) % 4
            }
            snakeDirList.removeFirst()
        }
    }
    
    x = nextX
    y = nextY
    printArr()
}

print(time)

// 사과의 위치
struct Point {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func printArr() {
    print("\(time)초")
    for i in 0..<n {
        for j in 0..<n {
            print(board[i][j], terminator: " ")
        }
        print()
    }
}
