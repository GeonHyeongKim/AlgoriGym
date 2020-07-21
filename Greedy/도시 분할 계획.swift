//
//  도시 분할 계획.swift
//  Question Link: https://www.acmicpc.net/problem/1647
//  Primary idea:       <Greedy> & <MST>
//                      1. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      2. Kruskal 알고리즘을 위한 Union-find를 구현한다.
//                      3. 간선(edge.cost)을 기준으로 오름차순으로 정렬
//                      4. graph[i]는 노드 i의 부모 노드를 저장하는 배열
//                      5. 모든 간선을 검사해서 start와 end가 연결되지 않았으면 연결해준다.
//                         이 때 오름차순으로 정렬했기 때문에 간선의 최소비용을 구할 수 있다.
//                      6. union 시킨때마다 count하여 그 값이 총 마을의 갯수 - 2개와 같을 때까지 반복한다.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/21.
//

import Foundation
