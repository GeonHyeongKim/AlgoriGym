//
//  탈출.swift
//  Question Link: https://www.acmicpc.net/problem/3055
//  Primary idea:       (Simulation & BFS)
//                      1. graph에서 고슴도치와 물이 4방지로 움직이기 때문에 BFS로 고려
//                      2. 방향을 나타내는 배열을 만든다.
//                      3. 고슴도치가 움직일수 있는지 없는지와 비버굴에 도착도착의 여부 2가지를 통해 계산을 종료한다.
//                          i) 물이 먼저 채워진다 => 고슴도치가 움직일 수 없다.
//                          ii) 고슴도치가 비버굴(D)에 도착한다. => Break
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/09/15.
//

import Foundation
