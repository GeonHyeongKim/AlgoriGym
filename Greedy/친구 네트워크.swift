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
//  Time Complexity : O(E logE)
//  Space Complexity : O(E)
//  Runtime: 272 ms
//  Memory Usage: 83.504 MB
//
//  Created by gunhyeong on 2020/07/20.
//

import Foundation

var cntTestCase = Int(readLine()!)!
let maxRelation = 100000 + 1
var network = [Int](repeating: 0, count: maxRelation)
var setSize = [Int](repeating: 0, count: maxRelation)

while cntTestCase > 0 {
    cntTestCase -= 1
    var cntRelationship = Int(readLine()!)!
    var infoFriend = [String:Int]()
    var id = 0

    // 초기화
    for i in 0..<maxRelation {
        network[i] = i
        setSize[i] = 1
    }
    
    while cntRelationship > 0 {
        cntRelationship -= 1
        let friends = readLine()!.split(separator: " ").map{String($0)}
        
        // friend 정보 입력
        if !infoFriend.keys.contains(friends[0]) {
            infoFriend[friends[0]] = id
            id += 1
        }
        
        // friend 정보 입력
        if !infoFriend.keys.contains(friends[1]) {
            infoFriend[friends[1]] = id
            id += 1
        }
                
        let one = find(&network, infoFriend[friends[0]]!)
        let other = find(&network, infoFriend[friends[1]]!)
    
        if one == other { // 다른 그룹이라면
            print(max(setSize[one], setSize[other]))
        } else {
            merge(&network, &setSize, one, other)
            print(max(setSize[one], setSize[other]))
        }
    }
}

func find(_ network: inout [Int], _ friend: Int) -> Int {
    if network[friend] == friend {
        return friend
    }
    
    network[friend] = find(&network, network[friend])
    return network[friend]
}

func merge(_ network: inout [Int], _ setSize: inout [Int], _ one: Int, _ other: Int) {
    var one = find(&network, one)
    var other = find(&network, other)
    
    if one != other { // 같은 그룹이 아닐 경우,
        
        // 크기가 더 큰 그룹에 작은 그룹이 합류
        if setSize[one] < setSize[other] {
            let temp = one
            one = other
            other = temp
        }
        
        network[other] = one // other 그룹(작은 그룹)이 one 그룹(더큰 그룸)에 합쳐짐
        setSize[one] += setSize[other] // one의 집합 크기가 other의 집합 크기를 가져옴
        setSize[other] = 0
    }
}
