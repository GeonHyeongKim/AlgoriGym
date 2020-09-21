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
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0] // 지도의 세로크기
let m = input[1] // 지도의 가로크기
let x = input[2] // 주사위를 놓는곳 x
let y = input[3] // 주사위를 놓는곳 y
var map = [[Int]]()

// init - insert map value
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(input)
}

let k = input[4] // 명령의 갯수
let orderList = readLine()!.split(separator: " ").map{Int($0)!}
