//
//  회전하는 큐.swift
//  Question Link: https://www.acmicpc.net/problem/1021
//  Primary idea:       (Simulation & 양방향 queue)
//                      1. 문제 이해에 도움을 준 site : http://dailyddubby.blogspot.com/2018/05/128-1021.html
//                      2. 양방향으로 회전한다는 점을 인지
//                      3. Queue의 길이 계산이 중요한 문제! - 뽑으려는 값을 기준으로
//                          i) 왼쪽이 더 짧은 경우 : '왼쪽'으로 밀어가며 첫번째로 위치 할 수 있도록 한다.
//                          ii) 오른쪽이 더 짧은 경우 : '오른쪽'으로 밀어가며 첫번째로 위치 할 수 있도록 한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation
