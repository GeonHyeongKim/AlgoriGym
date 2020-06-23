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
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.21 ~ 3.62 ms
//  Memory Usage: 24.1 ~ 24.4 MB
//
//  Created by gunhyeong on 2020/06/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = [(Int,Int)]() // queue 개념을 이용 (index,priority)
    var priorityQueue = [Int]()
    var result = 1
    
    // 주어진 배열을 먼저 index값을 포함하여 배열로 만든다
    for (i, priority) in priorities.enumerated() {
        queue.append((i,priority))
        priorityQueue.append(priority)
    }
    
    priorityQueue.sort(by: >) // 내림차순으로 정렬
        
    while !queue.isEmpty {
        let index = queue.first!.0
        let priority = queue.removeFirst().1
        
        if priority == priorityQueue.first! { // 현재 빠질 수 있는 큐의 우선순위가 최고일 경우
            if index == location { // 해당 위치가 요구하는 인덱스일 경우
                return result
            } else { // 아직 요구하는 인덱스가 아닐 경우,
                priorityQueue.removeFirst() // 우선순위 큐에서 pop, 즉 가장 우선순위 제거
                result += 1 // 출력 수 증가
            }
        } else { // 방금 queue의 데이터가 최우선 순위가 아닐 경우, 다시 맨 뒤로 넣는다.
            queue.append((index, priority))
        }
    }
    
    
    return result
}
