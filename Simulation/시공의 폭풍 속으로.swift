/*
    시공의 폭풍 속으로.swift
    [Question Link] : 위클리 비타알고 시즌2 강의 https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8
 
    [문제]
    시공의 폭풍은 87명의 영웅(편의상 1~87번까지 번호가 매겨져 있다고 하자)들 중 각 팀별로 5명씩 골라 총 10명이 플레이하는 게임이다.
    당신의 팀원들이 선택한 4명의 영웅들과 당신이 선택하길 원하는 영웅 5명의 번호가 주어졌을 때, 선택할 수 있는 영웅이 몇 명인지 세어보자!

    [입력]
    첫 번째 줄에는 당신의 팀원들이 선택한 4명의 영웅 번호가 중복 없이 공백으로 구분되어 주어진다. ﻿
    두 번째 줄에는 당신이 선택하고자 하는 5명의 영웅 번호가 중복 없이 공백으로 구분되어 주어진다.
 
    [출력]
    당신이 선택하고자 하는 영웅들 중 선택할 수 있는, 즉 이미 팀원이 선택한 영웅이 아닌 영웅의 수를 출력한다.

    [Primary idea] : Simulation
    1. bool 또는 int 배열을 이용하여 확인(contains 이용)하는 방법

    Time Complexity : O(n^m), n은 첫 번쨰 줄의 크기, m은 두 번째 줄의 크기
    Space Complexity : O(1)

    Created by gunhyeong on 2020/12/29.
*/

import Foundation

let selectedHero = readLine()!.split(separator: " ").map{Int($0)!}
let selectHero = readLine()!.split(separator: " ").map{Int($0)!}

var count = 0
for hero in selectHero {
    if !selectedHero.contains(hero) {
        count += 1
    }
}

print(count)
