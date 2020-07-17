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

let input = readLine()!.split(separator: " ").map{Int($0)!}
let cntV = input[0]
let cntE = input[1]
var aboutE = [[Int]]()

for _ in 0..<cntE {
    let contents = readLine()!.split(separator: " ").map{Int($0)!}
    aboutE.append(contents)
}

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
