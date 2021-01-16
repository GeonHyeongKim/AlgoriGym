//
//  aj-1.swift
//  
//
//  Created by gunhyeong on 2021/01/16.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0] // 음식을 평가하는 사람의 수
let m = info[1]
let k = info[2]
let score = readLine()!.split(separator: " ").map{Int($0)!}

var half = n / 2
var isMiMi = true
var count = 0

for s in score {
    if s < m {
        isMiMi = false
        break
    }

    if s >= k && count <= half {
        count += 1
    }
}

if !isMiMi {
    print(0)
} else {
    if count >= half {
        print(1)
    } else {
        print(0)
    }
}
