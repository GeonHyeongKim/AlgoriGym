//
//  수 찾기.swift
//  Question Link: https://www.acmicpc.net/problem/1920
//  Primary idea:       (Binary Search)
//                      1. 배열값들을 받고 A,B에 들어 있는지 contains()를 통해 확인한다. (x)
//                      2. containsO(n)로 탐색하지 않고 BinarySearch(O(logN))를 직접 구현하여 값을 찾음
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/22.
//

import Foundation

let n = Int(readLine()!)!
let nList = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
let m = Int(readLine()!)!
let mList = readLine()!.split(separator: " ").map{Int($0)!}

for num in mList {
    if binarySearch(nList, num, n) == -1 {
        print(0)
    } else {
        print(1)
    }
}

func binarySearch(_ nList: [Int], _ target: Int, _ n: Int) -> Int {
    var low = 0
    var high = n - 1
    
    while low <= high {
        let mid = (low + high) / 2
        if nList[mid] > target {
            high = mid - 1
        } else if nList[mid] < target {
            low = mid + 1
        } else {
            return mid
        }
    }
    return -1
}
