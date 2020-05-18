//
//  대회 or 인턴.swift
//  Question Link: https://www.acmicpc.net/problem/2875
//  Primary idea:       <Greedy>
//                      1. 대회에 보낼 인원이 없을 경우
//                        i) 여자 인원 / 2
//                        ii) 남자 인원
//                      2. 대회에 보낼 인원이 있을 경우
//                        (여자 인원 + 남자 인원 - 대회에 보낼 인원) / 3
//
//  Time Complexity : O(1)
//  Space Complexity : O(1)
//  Runtime: 8 ms
//  Memory Usage: 64.048 MB
//
//  Created by gunhyeong on 2020/05/18.
//

import Foundation

let people = readLine()!.split(separator: " ")
let N = Int(people[0])!
let M = Int(people[1])!
let K = Int(people[2])!

print(min(min(N/2, M), (N+M-K)/3))
