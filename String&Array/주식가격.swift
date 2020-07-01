//
//  주식가격.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42584
//  Primary idea:       <String & Array>
//                      1. 반복문을 통해 1초가 흐를떄마다 각각의 방의 값을 1씩 늘려간다.
//                      2. 값이 작아지는 구간에 반복문으로 멈춘다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/01.
//

import Foundation

func solution(_ prices: [Int]) -> [Int] {
    let size = prices.count
    
    var result = [Int](repeating: 0, count: size)
    
    for i in 0..<size {
        for j in 1+i..<size {
            result[i] += 1
            if prices[i] > prices[j] {
                break
            }
        }
    }
    
    return result
}
