//
//  괄호 추가하기.swift
//  Question Link: https://www.acmicpc.net/problem/16637
//  Primary idea:       (DFS & Brute force)
//                      1. 2번의 재귀
//                          i) 이전 계산 결과와 오른쪽에 있는 피연산자를 피연산자로 하여 현재 가리키는 연산자의 연산을 수행하는 함수
//                          ii) 2. 이전 계산 결과와 오른쪽에 있는 연산자의 연산 수행 결과를 피연산자로 하여 현재 가리키는 연산자의 연산을 수행하는 함수
//                      2. 재귀의 탈출 조건 - 연산자의 인덱스를 초과하여 현재 가리키는 연산자가 없는 경우
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/08/05.
//

import Foundation


