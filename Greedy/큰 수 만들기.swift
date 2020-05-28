//
//  큰 수 만들기.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/42883
//  Primary idea:       <Greedy>
//                      1) 입력된 숫자가 모두 0일 경우 예외처리를 한다
//                      2) 큰 수를 만드는 문자들을 모으는 String(result, number의 갯수 - k 크기의 길이)을 선언
//                      3) 각 자리 숫자 하나 하나 뽑을 때마다 그때의 최대값을 선택해야 한다
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime:  ms
//  Memory Usage:  MB
//
//  Created by gunhyeong on 2020/05/28.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    guard number != "0" else { // 입력된 숫자가 모두 0일 경우 예외처리
        return "0"
    }
    
    let arrNumber = Array(number)
    let len = arrNumber.count - k
    var result = ""
    
    var startIndex = 0
    for i in 0..<len {
        var maxNumber: Character = "0"

        for j in startIndex...k+i {
            if maxNumber < arrNumber[j] { // 각 자리 숫자 하나 하나 뽑을 때마다 그때의 최대값을 선택
                maxNumber = arrNumber[j]
                startIndex = j + 1
            }
        }
        
        //제일 큰수를 정답에 추가
        result += String(maxNumber)
    }
    
    return result
}
