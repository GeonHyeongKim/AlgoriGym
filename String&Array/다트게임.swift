/*
*  다트게임.swift
*  Question Link: https://programmers.co.kr/learn/courses/30/lessons/17682
*  Primary idea:   <Brute force>
*                  1. 숫자일 경우 - isNumber를 통해 판별
*                      1) 10인지 판별 - "1"이 들어 올경우 다음 숫자가 숫자이면 10자리 숫자이다. 즉 10이다.
*                      2) 10의 1의 자리를 나타낼 때 - bool을 통해 switch 역활로 1의 자리를 계산하려 하는지 판별
*                  2. 문자일 경우
*                      1) S, D, T일 경우, Dictionary를 통해 저장된 double형 점수를 가져온다.
*                      2) *일 경우, 이전값을 알아내기 위해 {*가 나타난경기 - (전체경기수 - 배열값조절)}을 통해 적용될 시작 위치를 구한다.
*                      3) #일 경우, 해당값을 음수로 바꾸어 준다.
*
*  Time Complexity: O(n^2)
*  Space Complexity: O(n)
*  result : 100점
*
*  Created by gunhyeong on 2020/03/14.
*/

import Foundation

func solution(_ dartResult:String) -> Int {
    let set = 3 // 경기수
    let dartResult = Array(dartResult)
    let bonus: [Character:Double] = ["S":1.0, "D":2.0, "T":3.0]
    var score = [Int](repeating: 0, count: set) // 경기 수 만큼
    var scoreIndex = 0
    var isTen = false
    
    for index in 0..<dartResult.count {
        if dartResult[index].isNumber { // 1. 숫자인지 판별
            if dartResult[index] == "1" && dartResult[index+1].isNumber { // 1-1. 10점인지 판별
                score[scoreIndex] = 10
                isTen = true
            } else if isTen { // 1-2. 10의 일의 자리일 경우
                isTen = false
                continue
            } else { // 1-3. 한자리 숫자일 경우
                score[scoreIndex] = dartResult[index].wholeNumberValue!
            }
        } else { // 2. 문자일 경우
            switch dartResult[index] {
            case "S": // Singe
                score[scoreIndex] = Int(pow(Double(score[scoreIndex]), bonus["S"]!))
                scoreIndex += 1
            case "D": // Double
                score[scoreIndex] = Int(pow(Double(score[scoreIndex]), bonus["D"]!))
                scoreIndex += 1
            case "T": // Triple
                score[scoreIndex] = Int(pow(Double(score[scoreIndex]), bonus["T"]!))
                scoreIndex += 1
            case "*": // 스타상
                let preScore = (scoreIndex - (set - 1)) < 1 ? 0 : scoreIndex - (set - 1) // 2-2. 경기 수를 배열값에 맞춘값 : (set - 1)
                
                for applyScore in preScore..<scoreIndex {
                    score[applyScore] *= 2
                }
            case "#": // 아차상
                score[scoreIndex-1] *= -1
            default:
                print("알수 없는 문자가 들어왔습니다.")
            }
        }
    }
    
    return score.reduce(0, +)
}
