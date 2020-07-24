//
//  경주로 건설 .swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/43164
//  Primary idea:       (Graph & BFS & Dijkstra)
//                      1. 다익스트라 최단경로를 살짝 변형한 문제 (직선 코스와 코너 코스로 이동이 가능)
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
//
//  Time Complexity :
//  Space Complexity : O(n^2)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/22.
//

import Foundation

