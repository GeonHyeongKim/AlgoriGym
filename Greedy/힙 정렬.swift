/*
*  힙 정렬.swift
*  Question Link: https://www.acmicpc.net/problem/2220
*  Primary idea:    <Greedy>
*                    0. Bottom Up방식
*                    1. 1) n-1 힙 뒤에 최댓값 n을 추가해준다.
*                    2) n-1 힙의 맨 뒤 숫자인 1과 바꾼다.
*                    3) nodeIndex(parent)에 위치한 부모 노드로 최댓값을 올려보낸다.(스위치)
*                    4) n-1위치에서 1의 위치로 최댓값이 갈 때 까지 3)을 반복
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:
*  Created by gunhyeong on 2020/04/29.
*/

import Foundation

var n = Int(readLine()!)!
var result = [0, 1]

for i in 2...n {
    result.append(i) // 배열의 맨 뒤에 최댓값 추가
    result.swapAt(i, i-1) // 1과 위치 변경
    var nodeIndex = i-1 // 최댓값이 있는 index
    
    while nodeIndex != 1 { // 최댓값이 배열의 가장 앞(index : 0 제외)에 위치 할때까지 반복
        let parent = nodeIndex/2 // 부모 node의 위치
        result.swapAt(nodeIndex, parent)
        nodeIndex = parent
    }
}

for i in 1..<result.count {
    print(result[i], terminator: " ")
}
