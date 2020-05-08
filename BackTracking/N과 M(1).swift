/*
*  N과 M(1).swift
*  Question Link: https://www.acmicpc.net/problem/15649
*  Primary idea:        <BackTracking>
*                       1. 모든 경우의 수를 고려한다는 점에서 BackTracking
*                       2. 자기 자신(i)가 포함되어 있으면 반복문을 실행하지 않음
*
*  Time Complexity : O(n^n)
*  Space Complexity : O(n)
*  Runtime: 204 ms
*  Memory Usage: 70.784 MB
*
*  Created by gunhyeong on 2020/05/08.
*/

import Foundation

var input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!
var result = [[Int]]()
var sub = [Int]()

backTracking(n, m, &sub)

func backTracking(_ n: Int, _ m : Int, _ sub: inout [Int]) {
    if sub.count == m {
        result.append(sub)
        return
    }
    
    for i in 1...n {
        if !sub.contains(i) { // 이미 자기 자신이 포함되어 있으면 제외
            sub.append(i)
            backTracking(n, m, &sub)
            sub.removeLast()
        }
    }
}

for r in result {
    for one in r {
        print(one, terminator: " ")
    }
    print("")
}
