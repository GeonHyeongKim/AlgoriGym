/*
    환상의 조합.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    대학에는 다양한 사람들이 있고, 다양한 조별과제가 있다. 조별과제를 위해 팀을 짜다보면 정말 잘 맞는 팀을 만나는 경우도, 그렇지 못한 경우도 있다.
    개개인의 능력이 뛰어난 사람들끼리 모였다고 최고의 능력을 발휘하는 팀이 만들어지는 것도 아니고, 뛰어나지 못한 사람들이 모였다고 최고의 능력을 발휘하지 못하는 팀이 만들어지지도 않는다.

    오랫동안 조별과제에 시달리던 홍현이는 특정 과제가 주어지면 해당 과제에 맞게 사람들의 능력을 수치화시키고, 수치화된 능력을 이용하여 최고의 팀을 짜는 법을 깨닫게 되었다.
    그 방법은 바로 모든 팀원의 능력의 합이 가 되는 경우이다. 예를 들어  일 때, 사람들의 능력치가 각각 -3, 0, -1, 8, 9라고 해보자. 그렇다면 홍현이를 포함하여 만들 수 있는 최고의 팀은 다음과 같다.

    {-3, 8}, {-3, 0, 8}, {-3, -1, 9}, {-3, 0, -1, 9}

    하지만 최고의 팀을 꾸리는 방법을 알게 되었다고 하여 항상 최고의 팀에 속할수는 없는 법이다.
    그렇기 때문에 홍현이가 현재 상황에서 자신을 포함하여 최고의 팀을 짤 수 있는 경우의 수가 궁금해졌다.
    홍현이를 도와 홍현이를 포함하는 최고의 팀을 짤 수 있는 경우의 수를 구해보자!

    [입력]
    첫 번째 줄에는 사람의 수 과 최고의 팀을 만들기 위한 수 S가 주어진다. (5 <= N <= 20), (|S| <= 10,000)
    두 번째 줄에는 각 사람의 수치화된 능력가 공백으로 구분되어 주어진다.
    (|ai| <= 10,000)
    이때 첫 번째로 주어지는 능력은 홍현이의 능력이다.

    [출력]
    최고의 팀을 만들 수 있는 경우의 수를 출력한다. 팀의 팀원은 최소 1명 이상이어야 한다. (즉 홍현이 혼자서도 팀을 구성할 수 있다)

    [Primary idea] : 구현, 재귀함수, 비트마스크
    방법 1 - 재귀
    1. 홍현이를 포함하는 부분집합의 합이 S가 되는 경우의 수를 찾는 문제
    2. 합 A의 크기가 S일 때 공집합을 포함하는 부분집합의 개수는 2^S개
    

    Time Complexity : O()
    Space Complexity : O()

    Created by gunhyeong on 2020/12/29.
*/

import Foundation

// 방법 1 - 재귀함수
let info = readLine()!.split(separator: " ").map{Int($0)!}
let size = info.first!
let target = info.last!
let skills = readLine()!.split(separator: " ").map{Int($0)!}
var answer = 0

func recursive(_ cur: Int, _ sum: Int) {
    if cur == size {
        answer += sum == target ? 1 : 0
        return
    }
    
    recursive(cur + 1, sum + skills[cur])
    recursive(cur + 1, sum)
}

recursive(1, skills.first!)
print(answer)

// 방법 2 - bit mask
// 몇가지 TestCase에서 Time out
let info = readLine()!.split(separator: " ").map{Int($0)!}
let size = info.first!
let target = info.last!
let skills = readLine()!.split(separator: " ").map{Int($0)!}
var hong = skills.first!
var answer = 0

for mask in (0...((1 << (size - 1)) - 1)).reversed() { //N-1 개의 비트를 켜준다.
    var sum = hong //홍현이의 능력 수치
    
    for bit in 0..<size - 1 {
        if (mask & (1 << bit)) != 0 { // bit 번째 비트가 켜져있다면 sum에 해당 값을 더해준다.
            sum += skills[size - 1 - bit]
        }
    }
    
    if sum == target { // 현재 부분집합의 합(sum)과 S가 같다면 정답을 1 더해준다.
        answer += 1
    }
}

print(answer)
