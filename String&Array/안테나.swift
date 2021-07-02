//
//  안테나.swift
//  Question Link: https://www.acmicpc.net/problem/18310
//  Primary idea:       <String & Array> - 정렬
//                      1. 처음에는 너무 어렵게 생각했는데 생각해보니 정렬하고 중간 지점에 세우면 되더라..
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: 246 ms
//  Memory Usage: 77.712 MB
//
//  Created by gunhyeong on 2021/07/02.
//

import Foundation

//MARK: 첫번째 풀이 시간초과
let n = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map{Int($0)!}

var min_distance = (-1, Int.max) // index, distance

for base in list {
    var sum = 0
    
    for other in list {
        if base != other {
            sum += abs(base - other)
        }
    }
    if sum < min_distance.1 {
        min_distance.0 = base
        min_distance.1 = sum
    }
}

print(min_distance.0)

//MARK: 두번째 풀이

let n = Int(readLine()!)!
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
let half = list.count % 2 == 0 ? list.count / 2 - 1 : list.count / 2

print(list[half])
