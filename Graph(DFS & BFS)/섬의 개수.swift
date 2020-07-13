//
//  섬의 개수.swift
//  Question Link: https://www.acmicpc.net/problem/4963
//  Primary idea:       <DFS & BFS> - dfs
//                      1. dfs를 통해 모든 근접한 경로를 탐색한다.
//                      2. 8방향의 배열값을 담은 dx,dy를 통해 주변 정사각형을 검사한다.
//                      3. 섬의 조건
//                          i) 이동 가능 (island[][] = 1)
//                          ii) 전체 땅을 벗어 나지 않아야함
//                          iii) 한번도 방문한적이 없는 곳 ( !visited[][] )
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/12.
//

import Foundation
