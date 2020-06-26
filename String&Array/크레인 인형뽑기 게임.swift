//
//  크레인 인형뽑기 게임.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/64061
//  Primary idea:       <String & Array>
//                      1.크레인의 위치를 현재 moves배열의 위치의 맨 위부터 0이 아닌 수를 만날 때까지(인형) 하나씩 내려온다.
//                      2. 인형을 만난 경우 스택(바구니)에 넣어준다.
//                          i) 이 때, 바구니의 맨 위(basketStack.last!)에 현재 인형과 같은 인형이 있다면 basketStack.removeLast()을 하여 두 인형을 제거하고 answer에 2를 누적한다.
//                          ii) 같은 인형이 아니라면 스택에 푸쉬를 한다.
//                          iii) 인형을 뽑은 후에 뽑은 자리는 0으로 바꿔주고 현재 반복문을 나간다.
//                      3. 위의 과정을 반복하여 총 몇 개의 인형이 터졌는지 반환한다.
//
//
//  Created by gunhyeong on 2020/06/26.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    return 0
}
