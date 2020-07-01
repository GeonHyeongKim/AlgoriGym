//
//  스킬트리.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/49993
//  Primary idea:       <String & Array>
//                      1. skill tree 배열의 엘리먼트 수 만큼 for문을 돌리며 순차적으로 각 엘리먼트에 접근한다.
//                      2. 1번에서 순차적으로 접근한 엘리먼트들을 각 skillTree 라고 하자.
//                      3. 이 skillTree에서 skill에 포함되는 요소를 learned에 담는다. (skill : abc, skillTree : zdawcb라면 learned는 acb가 된다)
//                      4. 만약 skill이 learned로 시작한다면 correctCount를 1 증가시켜준다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/27.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    
    for skills in skill_trees {
        var murmur = "" // 중얼거리기
        for step in skills {
            if skill.contains(step) {
                murmur += String(step)
            }
        }
        
        if skill.starts(with: murmur) {
            answer += 1
        }
    }
    
    return answer
}
