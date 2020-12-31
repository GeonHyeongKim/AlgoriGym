/*
    애틋한 친구.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    아무래도 먼 거리에 있는 친구보다는 가까운 거리에 있는 친구일수록 친하기 마련이다.
    하지만 가까운 거리에 지내며 자주 만나던 친구가 갑작스럽게 먼 곳으로 가게 되었다면 이 둘은 애틋한 사이가 될 수 있다.
    좌표평면상에 명의 위치정보가 주어졌을 때 가장 애틋한 친구가 누구인지 찾아보자!

    [입력]
    첫 번째 줄에는 사람의 수 과 최고의 팀을 만들기 위한 수 S가 주어진다. (5 <= N <= 20), (|S| <= 10,000)
    두 번째 줄에는 각 사람의 수치화된 능력가 공백으로 구분되어 주어진다.
    (|ai| <= 10,000)
    이때 첫 번째로 주어지는 능력은 홍현이의 능력이다.
 
    첫 번째 줄에는 사람의 수 N 이 주어진다. (5 <= N <= 1,000)
    두 번째 줄부터 N + 1 번째 줄 까지 번째 사람의 위치 정보가 좌표로 주어진다. (-1,000,000 <= xi, yi <= 1,000,000)
    이때 좌표는 정수로만 주어진다.

    [출력]
    가장 애틋한 친구의 번호를 공백으로 구분하여 낮은 번호부터 출력한다.
    가장 애틋한 친구는 가장 멀리 떨어져 있는 두 친구를 말한다.
    만약 답이 여러 개인 경우 첫 번째 번호가 가장 작은 번호를, 첫 번째 번호가 같다면 두 번째 번호가 가장 작은 번호를 출력한다.
 
    [Primary idea] : 완전탐색
    1. 2개를 확인하는 것이므로 2중반복문으로 완전탐색을 한다.
    2. 주의사항
        i)  거리를 계산할 때 오버플로우에 주의
        ii) 두 거리를 비교할 때 언더플로우에 주의
    
    Time Complexity : O(n^2)
    Space Complexity : O(n^2)

    Created by gunhyeong on 2020/12/29.
*/


import Foundation

let people = Int(readLine()!)!
var relationship = [[Int]]()
var maxValue = 0.0
var first = 0
var second = 0

for _ in 0..<people {
    let peoples = readLine()!.split(separator: " ").map{Int($0)!}
    relationship.append([peoples.first!, peoples.last!])
}

for one in 0..<relationship.count {
    for other in one+1..<relationship.count {
        let dis = distance(relationship[one][0], relationship[one][1], relationship[other][0], relationship[other][1])
        if maxValue < dis {
            maxValue = dis
            first = one + 1
            second = other + 1
        }
    }
}

print("\(first) \(second)")

// 거리 구하기
func distance(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int) -> Double {
    return sqrt(Double((x-xx)*(x-xx) + (y-yy)*(y-yy)))
}
