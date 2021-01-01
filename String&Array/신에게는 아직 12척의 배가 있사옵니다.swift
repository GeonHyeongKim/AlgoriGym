/*
    신에게는 아직 12척의 배가 있사옵니다.swift
    [Question Link] : 위클리 비타알고 시즌2 강의
    https://edu.goorm.io/lecture/15551/%25ED%2594%2584%25EB%25A6%25AC%25EB%25AF%25B8%25EC%2597%2584-%25EC%2595%258C%25EA%25B3%25A0%25EB%25A6%25AC%25EC%25A6%2598-%25EC%259C%2584%25ED%2581%25B4%25EB%25A6%25AC-%25EB%25B9%2584%25ED%2583%2580%25EC%2595%258C%25EA%25B3%25A0-%25EC%258B%259C%25EC%25A6%258C2-%25EC%259E%2585%25EB%25AC%25B8%25ED%258E%25B8

    [문제]
    때는 2219년, 타임머신을 만들던 한 연구소의 프로그래머인 당신은 연구소에서 난 사고에 의해 과거로 날아가게 되었다.
    불행인지 다행인지 당신은 많은 연구자료들이 포함된 노트북을 지키기 위해 품에 안고 연구소를 빠져나가던 중 사고를 겪었기 때문에 노트북과 함께 과거로 날아왔다.

    뛰어난 두뇌와 노트북을 가진 당신은 임금님의 총애를 사 높은 관직에 올랐다.
    그렇게 시간이 흘렀고, 어느새 명량해전이 일어나는 날이 다가오고 있었다. 당신이 알고 있었던 바와 같이 이순신 장군께서 12척의 배로 죽을 힘을 내어 막아 싸우면 이길 수 있겠다는 말씀을 하셨다.
    당신은 마침 아군의 전투력을 정확하게 수치화시킬 수 있는 연구에서 제법 좋은 결과를 얻고 있었다.
    그렇기에 수치화 된 데이터를 가지고 대장선을 제외한 11척을 이용해 최적의 진형을 찾아 이순신 장군께 도움을 드리고자 한다.

    아군의 수치화 된 전투력이 주어졌을 때 최적의 진형을 찾아보자!

    [입력]
    아군의 수치화 된 전투력이 주어진다.
    전투력은 11x11 크기의 행렬로 이루어져있으며 는 i번째 배가 진형의 j번째 위치했을때의 전투력을 뜻한다.
    (0 <= a_ij <= 100)
 
    [출력]
    첫 번째 줄에는 최적의 진형을 이루었을 때의 전투력의 합을 출력한다.
    두 번째 줄에는 아군의 진형을 첫 번째부터 순서대로 출력한다.
    만약 최적의 진형이 여러 개인 경우 사전순으로 가장 앞선 진형을 출력한다.
 
    [Primary idea] :
    1.
    
    Time Complexity : O()
    Space Complexity : O()

    Created by gunhyeong on 2020/12/29.
*/

import Foundation

import Foundation

var combatPowerBoard = [[Int]]()
let shipCnt = 11

for _ in 0..<shipCnt {
    let row = readLine()!.split(separator: " ").map{Int($0)!}
    combatPowerBoard.append(row)
}

var totalPower = 0
var optimalPlacement = [Int](repeating: 0, count: shipCnt)
var isUsed = [Bool](repeating: false, count: shipCnt)
for _ in 0..<shipCnt {
    var maxPower = -1
    var index = -1
    
    for row in 0..<shipCnt {
        if isUsed[row] { continue }
        let maxValueByRow = combatPowerBoard[row].max()!
        
        if maxPower < maxValueByRow {
            maxPower = maxValueByRow
            index = combatPowerBoard[row].firstIndex(of: maxPower)!
            optimalPlacement[index] = row
        }
    }
    
    isUsed[index] = true
    totalPower += maxPower
}

print(totalPower)
for ship in 0..<shipCnt {
    print("\(optimalPlacement[ship] + 1)", terminator: " ")
}


//10  11  0   0   0   0   0   0   0   0   0   1
//0   11  10  0   0   0   0   0   0   0   0   1, 2
//0   3   20  7   0   1   0   0   0   0   0   3
//3   0   0   9   8   0   0   0   0   0   0   4
//0   0   0   17  2   15  0   0   0   0   0   4
//0   0   13  11  0   19  2   0   0   0   0   6
//2   1   5   4   0   0   0   0   0   0   10  11
//0   0   0   0   0   0   15  14  0   0   0   7
//0   0   0   0   0   0   0   0   3   7   2   10
//0   0   0   0   0   0   9   4   1   10  15  11
//0   0   0   0   10  1   0   5   19  7   0   5
//
//1   2   3   5   4   6   11  8   10  7   9
