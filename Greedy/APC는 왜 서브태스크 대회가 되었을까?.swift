//
//  APC는 왜 서브태스크 대회가 되었을까?.swift
//  Question Link: https://www.acmicpc.net/problem/17224
//  Primary idea:       (Greedy & sort)
//                      1. 문제를 입력받은 후 내림차순으로 정렬한다.
//                      2. 그리고 역량을 넘지 않은 선에서 문제를 풀어낸다.
//
//  Time Complexity : O(n^2)
//  Space Complexity : O(n)
//  Runtime: 16 ms
//  Memory Usage: 81.340 MB
//
//  Created by gunhyeong on 2020/09/23.
//
// MARK:- 1번째 다른 풀이 - 100점
import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0] // 문제 개수
let l = input[1] // 역량
let k = input[2] // 풀수 있는 최대 개수
var problem = [Problem]()
var count = 0 // 풀어낸 문제의 수
var sum = 0

for _ in 0..<n {
    let sub = readLine()!.split(separator: " ").map{Int($0)!}
    problem.append(Problem(sub.first!, sub.last!))
}

// 내림차순 정렬 - 1순위. sub2, 2순위 sub1
problem.sort(by: {
    if $0.sub2 > $1.sub2 {
        return true
    } else if $0.sub2 < $1.sub2{
        return false
    } else {
        if $0.sub1 > $1.sub1 {
            return true
        }
    }
    
    return false
})

// 풀이
for p in problem {
    if count > k { break } // 풀수 있는 최대 개수를 넘지 못함
    count += 1
    
    if p.sub1 <= l && p.sub2 <= l {
        sum += 140
    } else if p.sub1 <= l {
        sum += 100
    }
}

print(sum)

struct Problem {
    var sub1: Int
    var sub2: Int
    
    init(_ sub1: Int, _ sub2: Int) {
        self.sub1 = sub1
        self.sub2 = sub2
    }
}

// MARK:- 2번째 다른 풀이 - 140점
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 16 ms
//  Memory Usage: 81.332 MB

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0] // 문제 개수
let l = input[1] // 역량
let k = input[2] // 풀수 있는 최대 개수
var count = 0 // 풀어낸 문제의 수
var sum = 0
var hard = 0
var easy = 0

for _ in 0..<n {
    let sub = readLine()!.split(separator: " ").map{Int($0)!}
    let sub1 = sub.first!
    let sub2 = sub.last!
    
    if sub2 <= l {
        hard += 1
    } else if sub1 <= l {
        easy += 1
    }
}

// hard 문제
sum += min(hard, k) * 140

// easy 문제
if hard < k {
    sum += min(k-hard, max(0, easy)) * 100
}

print(sum)
