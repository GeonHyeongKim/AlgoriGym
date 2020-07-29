//
//  미로 탐색.swift
//  Question Link: https://www.acmicpc.net/problem/2178
//  Primary idea:       (Graph & BFS & Dijkstra)
//                      1. BFS의 특징은 각 정점을 최단경로로 방문한다는 것입니다. 이 점을 활용해 최단거리를 구해 봅시다.
//                      2. BFS을 응용 -> queue이용
//                      3. 3차원 배열을 만들어 x, y, 방향을 저장함 -> 초기값은 0,0에서 4가지 방향을 살핌(0)
//                      4. Point 구조체를 만들어 x,y,codt,방향을 저장함
//                      5. queue에 초기값 0,0에서 값을 넣은 후, 한개씩 꺼내어 quque가 빌때까지 반복함
//                      6. 4가지 방향을 돌면서 조건에 맞지 않으면 움직이지 않음
//                          i) 방금왔던 거리를 다시 가지 않도록 방지
//                          ii) 미로를 벗어남
//                          iii) 값이 1(벽)일 경우
//                      7. 움직인 거리에서의 값을 계산후, 3차원 배열의 값과 비교해 최소값을 저장함
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:   ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/29.
//

import Foundation
