/*
    수의 비밀.swift
    [Question Link] : 위클리 비타알고 시즌2 강의 https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    고대 유적지를 연구하던 인디아나 홍스는 유적지의 벽에 새겨진 엄청난 숫자들을 발견했다.
    벽에 새겨진 숫자 중 일부는 비밀스러운 정보를 조회할 수 있는 열쇠 역할을 하는 비밀스러운 수이다.
    오랜 연구 끝에 인디아나 홍스는 엄청난 숫자들이 특별한 규칙을 가지고 있다는 사실을 발견하였다.
    엄청난 숫자들 중 의미 있는 숫자들은 항상  형태로 적혀 있고, 그 외의 수들은 모두 비밀스러운 정보와는 관련 없다는 것이다.
    인디아나 홍스를 도와 벽에 새겨진 숫자가 비밀스러운 정보인지 아닌지를 판별해보자!

    [입력]
    첫 번째 줄에 벽에 새겨진 수가 주어진다. 이 수는 10^18이하의 자연수이다.

    [출력]
    주어진 수가 비밀스러운 정보를 가진 숫자라면 Yes, 아니라면 No를 출력한다.

    [Primary idea] : 구현, 비트연산사
    1. 2진법으로 바꾼뒤, 1의 개수 count

    Time Complexity : O(n)
    Space Complexity : O(1)

    Created by gunhyeong on 2020/12/29.
*/

import Foundation

var secretNum = Int(readLine()!)!

var count = 0
for bit in String(secretNum, radix: 2) {
    if count > 1 { break }
    
    if bit == "1" {
        count += 1
    }
}

if count <= 1 {
    print("Yes")
} else {
    print("No")
}

// Mark : 다른 풀이 - 비트 연산자 이용
// [Primary idea] : 구현, 비트연산사
// 1. 비트 연산사를 이용하여 해결한다.

var secretNum = Int(readLine()!)!

if secretNum == (secretNum & (~secretNum + 1)) {
    print("Yes")
} else {
    print("No")
}

