//
//  우주신과의 교감.swift
//  Question Link: https://www.acmicpc.net/problem/1774
//  Primary idea:       <Greedy> & <MST>
//                      1. 이미 사용된 간선이 있을 때 최소 비용으로 나머지를 완성하는 문제
//                         point : 이미 연결되어있는 간선에 대해 union으로 연결해 놓는다.
//                      2. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      3. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      4. 간선(edge.distance)을 기준으로 오름차순으로 정렬
//                      5. universe[i]는 노드 i의 부모 노드를 저장하는 배열
//                      6. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage: MB
//
//  Created by gunhyeong on 2020/07/19.
//

import Foundation
