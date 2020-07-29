//
//  단지번호붙이기.swift
//  Question Link: https://www.acmicpc.net/problem/2667
//  Primary idea:       (DFS & BFS)
//                      1. dfs를 통해 모든 근접한 경로를 탐색한다.
//                      2. 4방향의 배열값을 담은 dx,dy를 통해 주변 정사각형을 검사한다.
//                      3. 단지의 조건
//                          i) 이동 가능 (mapSquere[][] = 1)
//                          ii) 전체 map을 벗어 나지 않아야함
//                          iii) 한번도 방문한적이 없는 곳 ( !visited[][] )
//                      4. 입력의 마지막 줄에는 0이 두 개 주어지는 조건 때문에 무한 반복문으로 해야한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/29.
//

import Foundation
