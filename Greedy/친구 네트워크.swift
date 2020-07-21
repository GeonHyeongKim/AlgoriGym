//
//  친구 네트워크.swift
//  Question Link: https://www.acmicpc.net/problem/4195
//  Primary idea:       <Greedy> & <해싱> & <MST> & <강한 연결 요소> & <Disjoint-set> & <최대 독립 집합>
//                      1. 원소가 인덱스로 주어지지 않고 사람 이름으로 주어지는 문제
//                         point : Dictionary 이용 [String -> Int]
//                      2. MST(최소 스패닝 트리) 중 Kruskal로 해결한다.
//                      3. Kruskal 알고리즘을 위한 Union-find(Disjoint-set)를 구현한다.
//                      4. network[i]는 노드 i의 부모 노드를 저장하는 배열
//                         setSize[i]는 본인 그룹의 크기로, 1로 초기화
//                      5. merge()를 통해 그룹들을 합침.
//
//  Time Complexity :
//  Space Complexity :
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/07/20.
//

import Foundation
