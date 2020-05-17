//
//  회의실배정.swift
//  Question Link: https://www.acmicpc.net/problem/1931
//  Primary idea:       <Greedy>
//                      1. sort : 회의 시작 시간을(start) 기준으로 오름차순으로 정렬
//                      2. priority queue 개념 응용 : 회의 종료 시간(end)을 기준으로 먼저 넣는다.
//                      3. end <= start 합치기
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/17.
//

import Foundation
