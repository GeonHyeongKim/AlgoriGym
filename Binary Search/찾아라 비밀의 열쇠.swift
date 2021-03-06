/*
    찾아라 비밀의 열쇠.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    어느 날 홍현이는 잠에서 깨어보니 현실과 또 다른 세상, 환상의 디지털 세상에 있었다.
    처음엔 몹시나 당황했지만 왠지 모르게 익숙한 풍경을 본 홍현이는 새로운 모험이 기다리고 있다는 사실에 이내 마음이 편해지며 설레기 시작했다.
    디지털 세상은 게임을 좋아했던 홍현이에게는 천국과도 같았고, 모험을 즐기던 홍현이는 알 수 없는 열쇠들을 얻고 있었다.

    모험을 즐기던 중, 문득 이번 주 위클리 비타알고의 문제를 내지 않고 디지털 세상 속으로 날아왔다는 사실을 깨달았다.
    많은 수강생들이 새로운 문제가 올라올 것을 기다리고 있겠다는 사실을 깨달은 홍현이는 한시바삐 현실 세계로 돌아가기 위해 수많은 비밀의 문이 있었던 장소로 획득한 열쇠를 가지고 이동했다.
    장소에 도착한 홍현이는 벽에 붙어있는 문구를 보았다.

    이곳은 현실 세계로 이동하기 위한 장소이다.
    현실 세계로 이동하기 위해 최소 C개 이상의 문을 열어야 하며, 이 문을 열 수 있는 열쇠는 총 N개이고, 그 열쇠 목록은 다음과 같다.
    ...
    위클리 비타알고의 문제를 등록하기 위해 홍현이가 현실 세계로 이동할 수 있는지 확인해보자!

    [입력]
    첫 번째 줄에는 비밀의 문을 열 수 있는 열쇠의 개수 N, 홍현이가 가지고 있는 열쇠의 개수 K와 현실 세계로 이동하기 위해 필요한 열쇠의 최소 개수 C가 주어진다.
    두 번째 줄에는 비밀의 문을 열 수 있는 열쇠에 포함된 번호 a_i가 공백으로 구분되어 주어진다.
    이때 a_i는 중복되지 않는다.
    세 번째 줄에는 홍현이가 가지고 있는 열쇠에 포함된 번호 b_i가 공백으로 구분되어 주어진다.
 
    [출력]
    홍현이가 현실 세계로 이동할 수 있다면 yes, 이동할 수 없다면 no를 출력한다.

    [Primary idea] : 이분 탐색
    1. 시간 복잡도 줄이기! O(KN) -> O((K+N)logN)

    Time Complexity : O((K+N)logN)
    Space Complexity : O(N)

    Created by gunhyeong on 2021/01/23.
*/

import Foundation

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let k = input[1]
var c = input[2]

let roomKey = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
let haveKey = readLine()!.split(separator: " ").map{Int($0)!}.sorted()

for have in haveKey {
    if binarySearch(have) != -1 {
        c -= 1
        if c == 0 { break }
    }
}

if c == 0 {
    print("yes")
} else {
    print("no")
}

func binarySearch(_ num: Int) -> Int {
    var l = 0, r = roomKey.count - 1
    while l <= r {
        let mid = (l+r)/2
        
        if roomKey[mid] == num { return mid }
        else if roomKey[mid] < num {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }
    return -1
}
