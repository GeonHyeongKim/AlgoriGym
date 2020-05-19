//
//  기타줄.swift
//  Question Link: https://www.acmicpc.net/problem/1049
//  Primary idea:       <Greedy>
//                      1. 패키지와 단품 가격 각각의 최소 가격을 계산
//                      2. 패키지 or (낱개의 가격*6) 중 더 최소 가격을 계산
//                      3. 끊어진 기타줄 만큼 패키지 구매 + min(개당 구매, 패키지구매)
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/19.
//

import Foundation

let input = readLine()!.split(separator: " ")
let N = Int(input[0])! // 끊긴 기타줄
let M = Int(input[1])! // 브랜드
var minPackageCost = Int.max
var minUnitCost = Int.max

// 최소 패키지 가격과 단품 가격
for _ in 1...M {
    let brand = readLine()!.split(separator: " ")
    let packageCost = Int(brand[0])! // package
    let unitCost = Int(brand[1])! // unit
    
    minPackageCost = min(minPackageCost, packageCost)
    minUnitCost = min(minUnitCost, unitCost)
}

if N <= 6 { // 6개 이하
    print(min(minPackageCost, minUnitCost*N))
} else { // 7개 이상
    print((N/6)*minPackageCost + min((N%6)*minUnitCost, minPackageCost))
}
