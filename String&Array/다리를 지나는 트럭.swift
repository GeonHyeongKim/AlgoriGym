//
//  다리를 지나는 트럭.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42583
//  Primary idea:       <String & Array> - Stack & Queue
//                      1. queue를 이용한다.
//                      2. 다리에 올라가 있는 무게의 합(bridgeQueue.reduce(0, +)) + 다음 트럭의 무게(trucks.first!)가 <= 다리가 버틸수 있는 무게(weight)
//                          i) 참
//                              가) 다리에 다음 차량이 올라간다 : bridgeQueue.append(trucks.first!)
//                              나) 다리에 올라가는 차량이 내려올 시간을 계산 : timesQueue.append(time+bridge_length)
//                              다) 대기중인 트럭중 첫번째 트럭을 제거 : trucks.removeFirst()
//                          ii) 거짓
//                              가) 시간(time)을 차량이 내려올 시간으로 변경 : timesQueue.removeFirst(), 단 다음차량이 올라가는 것을 고려하여 1을 빼준다
//                                  point! : firstQueue.first < time (시간을 정지하는 개념)
//                              나) 다리에서 차량이 내려온다 : bridgeQueue.removeFirst()
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/21.
//

import Foundation

// 85.7점 - 테스트 4,6 실패
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var bridgeQueue = [Int]()
    var timesQueue = [Int]() // 트럭의 도착 시간
    var time = 0
    
    while !trucks.isEmpty {
        time += 1
        
        if bridgeQueue.reduce(0, +) + trucks.first! <= weight {
            bridgeQueue.append(trucks.first!)
            timesQueue.append(time+bridge_length)
            trucks.removeFirst()
        } else {
            time = timesQueue.first! < time ? timesQueue.removeFirst() : timesQueue.removeFirst() - 1
            bridgeQueue.removeFirst()
        }
    }
    
    return timesQueue.removeLast()
}

//print("\(time) \(cross) \(bridgeQueue) \(trucks) \(timesQueue)")
