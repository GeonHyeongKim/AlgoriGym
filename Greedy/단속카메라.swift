//
//  단속카메라.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42884
//  Primary idea:       (Greedy)
//                      1. 차량이 고속도로에서 나간 지점을 기준으로 routes를 정렬한다.
//                      2. 차량이 들어온 지점이 기존 카메라 위치보다 우측에 있으면 차량이 나가는 지점에 카메라를 설치한다.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(1)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/01.
//

import Foundation

func solution(_ routes: [[Int]]) -> Int {
    var answer = 0
    var camera = Int.min
    
    for route in routes.sorted(by: {$0.last! < $1.last!}) {
        if camera < route.first! {
            camera = route.last!
            print(camera)
            answer += 1
        }
    }
    return answer
}

print(solution([[-20,15], [-14,-5], [-18,-13], [-5,-3]]))

