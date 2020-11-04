//
//  강의실 배정.swift
//  Question Link: https://www.acmicpc.net/problem/11000
//  Primary idea:       (Greedy)
//                      1. struct로 s, t를 입력
//                      2. 시작시간(s)를 기준으로 정렬
//                      3. 맨 처음에 끝나는 시간(가장 빨리 시작하는)을 넣는다.
//                      4. for을 수행
//                          i) 수업중인 강의실의 끝나는 시간 > 다음 수업시작 시간
//                             강의실 추가(우선순위 큐에 push, 아니면 pop)
//
//  Time Complexity : O(n^n)
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/11/04.
//

import Foundation

let n = Int(readLine()!)! // n개의 수업
var lectures = [(Int, Int)]()

for _ in 0..<n {
    let infoLecture = readLine()!.split(separator: " ").map{Int($0)!} // s, t
    lectures.append((infoLecture.first!, infoLecture.last!))
}

lectures.sort(by: { $0.0 < $1.0 }) // 정렬

var priortyQueue = [Int]()
priortyQueue.append(lectures.first!.1)

for i in 1..<lectures.count {
    let start = lectures[i].0
    let end = lectures[i].1
    
    if priortyQueue.last! <= start { priortyQueue.removeLast() }
    
    priortyQueue.append(end)
    priortyQueue.sort()
}

print(priortyQueue.count)
