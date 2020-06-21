//
//  다리를 지나는 트럭.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42583
//  Primary idea:       <String & Array> - Stack & Queue
//                      1. queue를 이용한다. 
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/06/21.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var bridge = [Int]() // queue
    var curWeight = 0
    var time = 0
        
    while !trucks.isEmpty {
        time += 1
        
        if !bridge.isEmpty { // 다리에 truck이 없는 경우
            
        }
        
        if curWeight + trucks.first! <= weight {
            curWeight += trucks.first!
            
            trucks.removeFirst()
        }
    }
    
    return time
}
