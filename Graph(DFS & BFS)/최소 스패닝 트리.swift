//
//  최소 스패닝 트리.swift
//  Question Link: https://www.acmicpc.net/problem/1197
//  Primary idea:       <Graph> -
//                      1.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/17.
//

import Foundation

class Node {
    var vertex: Int
    
    init(_ vertex: Int) {
        self.vertex = vertex
    }
}

class Edg {
    var start: Int
    var end: Int
    var value: Int
    
    init(_ start: Int, _ end: Int, _ value: Int) {
        self.start = start
        self.end = end
        self.value = value
    }
}
