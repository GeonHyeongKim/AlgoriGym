//
//  국영수.swift
//  Question Link: https://www.acmicpc.net/problem/10825
//  Primary idea:       <String & Array> - 정렬
//                      1. soted(lamda $0, $1)로 풀이
//
//  Time Complexity :
//  Space Complexity :
//  Runtime: 452 ms
//  Memory Usage: 78.200 MB
//  Created by gunhyeong on 2021/07/02.
//

import Foundation

let n = Int(readLine()!)!
var list = [String:[Int]]()

for _ in 0..<n {
    let info = readLine()!.split(separator: " ")
    let name = String(info.first!)
    let korean = Int(info[1])!
    let math = Int(info[2])!
    let english = Int(info[3])!
    
    list[name, default: [Int]()].append(contentsOf: [korean, math, english])
}

let new_list = list.sorted(by: {
    if $0.value[0] == $1.value[0] {
        if $0.value[1] == $1.value[1] {
            if $0.value[2] == $1.value[2] {
                return $0.key < $1.key
            } else {
                return $0.value[2] > $1.value[2]
            }
        } else {
            return $0.value[1] < $1.value[1]
        }
    } else {
        return $0.value[0] > $1.value[0]
    }
})

for name in new_list {
    print(name.key)
}
