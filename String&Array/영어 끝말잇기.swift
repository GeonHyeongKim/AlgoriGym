//
//  영어 끝말잇기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12981
//  Primary idea:       <String & Array>
//                      1. words를 한개씩 꺼내며 게임을 진행할 배열에 넣는다.
//                      2. 첫단어를 제외하고 게임을 진행할 배열에서 마지막으로 게임했던 단어를 가져온다.
//                      3. 종료 조건
//                          i) 단어가 게임에 속해있을 경우
//                          ii) 현재 단어의 첫 알파벳와 마지막 단어의 마지막 알파벳이 다를 경우
//                      4. 종료 조건에 해당하지않고 반복문이 끝났을 경우, [0,0]을 return
//
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.21 ~ 0.92 ms
//  Memory Usage: 23.8 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/07/06.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var games = [String]()
    
    for (i, word) in words.enumerated() {
        guard let lastWord = games.last else { // 이전 단어를 가져온다. 없을경우(첫 단어), 게임에 넣는다.
            games.append(word)
            continue
        }
        
        if games.contains(word) || (word.first! != lastWord.last) { // 종료 조건
            let person = (i % n) + 1 // 게임 진행중인 사람 번호
            let turn = (i / n) + 1
            
            return [person, turn]
        } else {
            games.append(word) // 해당 단어를 게임에 넣는다.
        }
    }
    
    return [0, 0]
}
