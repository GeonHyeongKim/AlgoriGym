//
//  크레인 인형뽑기 게임.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/64061
//  Primary idea:       <String & Array> - Brute force
//                      1.크레인의 위치를 현재 moves배열의 위치의 맨 위부터 0이 아닌 수를 만날 때까지(인형) 하나씩 내려온다.
//                      2. 인형을 만난 경우 스택(바구니)에 넣어준다.
//                          i) 이 때, 바구니의 맨 위(basketStack.last!)에 현재 인형과 같은 인형이 있다면 basketStack.removeLast()을 하여 두 인형을 제거하고 answer에 2를 누적한다.
//                          ii) 같은 인형이 아니라면 스택에 푸쉬를 한다.
//                          iii) 인형을 뽑은 후에 뽑은 자리는 0으로 바꿔주고 현재 반복문을 나간다.
//                      3. 위의 과정을 반복하여 총 몇 개의 인형이 터졌는지 반환한다.
//
//  Time Complexity : O(n*m), n은 moves의 갯수, m은 board의 size
//  Space Complexity : O(n)
//  Runtime: 0.19 ~ 1.57 ms
//  Memory Usage: 24.0 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/06/26.
//

import Foundation

//func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
//    var boom = 0 // 터트린 인형 갯수
//    var basketStack = [Int]() // 담는 바구니
//    var board = board
//    let reMoves = moves.map {$0 - 1} // moves의 값들을 1을 빼준다
//    let size = board.count
//
//    for move in reMoves {
//        for i in 0..<size {
//            let position = board[i][move] // 집개의 위치
//            if position == 0 { // 값이 0일 경우
//                continue
//            }
//
//            if !basketStack.isEmpty && basketStack.last! == position { // 바구니가 비어 있지않을 경우, 바구니 가장 위에 같은 인형
//                basketStack.removeLast() // 마지막 제거
//                boom += 2 // 2개 터짐
//            } else {
//                basketStack.append(position) // 바구니에 넣기
//            }
//
//            board[i][move] = 0 // 인형이 뽑힌 후 0으로 만들기
//            break
//        }
//
//    }
//
//    return boom
//}
