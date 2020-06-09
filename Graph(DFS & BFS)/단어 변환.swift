//
//  단어 변환.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/43163
//  Primary idea:       <DFS & BFS> - BFS
//                      1. BFS를 이용한다, 즉 queue를 이용해야하기 때문에 queue를 대체할 수 있는 문법을 적용
//                          i) enqueue : append()
//                          ii) dequeue : Array.isEmpty ? nil : Array.removeFirst()
//                      2. 초기값, queue에 시작하는 단어(begin)를 넣고 begin는 queue에서 필요가 없음
//                      3. queue가 비어있을 때까지 무한 루프를 돌리면서, queue의 크기 만큼반복
//                      4. queue에서 한개씩 꺼내면서 단어(str)의 각자리를 a~z까지로 분해해 변형 가능한 words 안에 있는 단어들을 알아낸다.
//                      5. 단어들을 queue에 넣어 target과 같은지 확인 -> 종료
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/06/08.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    return 0
}
