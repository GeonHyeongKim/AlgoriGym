//
//  주사위 굴리기.swift
//  Question Link: https://www.acmicpc.net/problem/14499
//  Primary idea:       <Simulation>
//                      1. 먼저 구를수 있는지 판단(다음 좌표가 지도 내부인지)
//                      2. 다음 주사위 상태에서 2번과 5번 면은 변하지 않는다. 오른쪽이므로, 현재 1번 면이 다음 3번 면으로, 현재 4번 면이 다음 1번 면으로, 현재 6번 면이 다음 4번 면으로, 현재 3번 면이 다음 6번 면으로 바뀌게 된다.
//                      3. 다음 상태공간을 만들었다면 6번 면과 지도 값을 비교하여 문제에 주어진 조건에 맞게 구현한다.
//                      4. dice배열에 의미 부여
//                          i)      dice[0]은 주사위 윗면에 적힌 숫자
//                          ii)     dice[1]은 주사위 앞면에 적힌 숫자
//                          iii)    dice[2]은 주사위 오른쪽면에 적힌 숫자
//                          iv)     dice[3]은 주사위 뒷면에 적힌 숫자
//                          v)      dice[4]은 주사위 왼쪽면에 적힌 숫자
//                          vi)     dice[5]은 주사위 아랫면에 적힌 숫자
//
//  Time Complexity : O(n), n은 명령의 갯수, 즉 k의 갯수
//  Space Complexity : O(n^m), n과 m은 지도의 세로, 가로 크기
//  Runtime: 16 ms
//  Memory Usage: 81.336 MB
//
//  Created by gunhyeong on 2020/09/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0] // 지도의 세로크기
let m = input[1] // 지도의 가로크기
var x = input[2] // 주사위를 놓는곳 x
var y = input[3] // 주사위를 놓는곳 y
var map = [[Int]]()

// init - insert map value
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(input)
}

let k = input[4] // 명령의 갯수
let operList = readLine()!.split(separator: " ").map{Int($0)! - 1}
let dx = [0, 0, -1, 1] // 동, 서, 북, 남
let dy = [1, -1, 0, 0]
var dice = [0, 0, 0, 0, 0, 0]

// 주사위의 현재 인덱스를 정합니다.
let direction = [
    [4, 1, 0, 3, 5, 2], // 동쪽
    [2, 1, 5, 3, 0, 4], // 서쪽
    [1, 5, 2, 0, 4, 3], // 북쪽
    [3, 0, 2, 5, 4, 1]  // 남쪽
]

for i in 0..<k {
    let oper = operList[i]
    let nextX = x + dx[oper]
    let nextY = y + dy[oper]
    
    // map 보다 커질경우
    if nextX < 0 || nextX >= n || nextY < 0 || nextY >= m { continue }
    
    // 주사위 굴리기 전 - 값 복사
    let temp = dice
    switch oper {
    case 0:
        print("동", terminator: " ")
    case 1:
        print("서", terminator: " ")
    case 2:
        print("남", terminator: " ")
    case 3:
        print("북", terminator: " ")
    default:
        print("에러", terminator: " ")
    }
    print("굴리기 전 : \(dice) -> ", terminator: "")

    // 주사위 굴린 후 - 값 전달
    for j in 0..<direction[0].count { dice[j] = temp[direction[oper][j]] }
    print("\(dice)")
    
    if map[nextX][nextY] == 0 { // 주사위 놓은 칸에 쓰여있는 숫자가 0일 때
        map[nextX][nextY] = dice[5]
    } else { // 주사위 놓은 칸에 쓰여있는 숫자가 0이 아닐 때
        dice[5] = map[nextX][nextY]
        map[nextX][nextY] = 0
    }
    
    x = nextX
    y = nextY
    // 주사위 윗 면에 쓰여있는 숫자 출력
    print(dice.first!)
}
