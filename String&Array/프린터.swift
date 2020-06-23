//
//  프린터.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42587
//  Primary idea:       <String & Array> - Queue
//                      1. 주어진 배열을 먼저 index값을 포함하여 이중배열(queue)로 만든다. 또한 우선순위 큐를 위해 priority값을 저장 후 내림차순으로 정렬한다.
//                      2. 2중배열(queue)에 값이 없을때 까지 순회를 돈다.
//                      3. 2중배열의 가장 첫번째 값을 꺼낸다. (Dequeue)
//                      4. 2중배열의 우선순위 값만 다시 배열로 만든다.
//                      5. 우선순위 배열의 가장 큰 값을 꺼낸다.
//                      6. POP한 우선순위와 우선순위배열의 가장 큰값과 비교하여 POP 크다면 새로운 배열에 append 아니라면 이중배열의 가장뒤쪽으로 보낸다 (Enqueue)
//                      7. 1 ~ 6 과정을 이중배열이 없을때 까지 반복
//                      8. 결과배열을 순회하여 index값과 location을 비교하여 같은경우 index에 +1 한 값을 출력해주면 된다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var sortedPriorities = priorities.sorted(by : >)
    return sortedPriorities.lastIndex(of : priorities[location])! + 1
}
