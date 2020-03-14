/*
*  비밀지도.swift
*  Question Link: https://programmers.co.kr/learn/courses/30/lessons/60057
*  Primary idea:   <Bit 연산>
*                  1. OR 계산을 통해 두 map(arr1, arr2)중 한쪽이라도 벽이 있을 경우 1로 판별
*                  2. 계산한 bit 중 갯수가 mapSize(=n) 보다 작을 경우
*                      1) mapSize와 같아 질때까지 앞에서 부터 "0"을 삽입
*
*  Time Complexity:
*  Space Complexity:
*  result : 100점
*  Created by gunhyeong on 2020/03/14.
*/

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    guard 1 <= n && n <= 16 else { // Constrains
        return []
    }
    
    // rename
    let mapSize = n
    var answer: [String] = []
    
    for row in 0..<mapSize {
        var bit = Array(String(arr1[row]|arr2[row], radix: 2)) // 1. OR 계산을 통해 block을 계산
        var str = "" // result

        while bit.count < mapSize { // 2. 계산한 bit 갯수가 전체 mapSize와 다를 경우
            bit.insert("0", at: 0) // 2-1. mapSize크기 만큼 앞에 "0" 삽입
        }

        for block in bit {
            if block == "1" {
                str += "#"
            } else {
                str += " "
            }
        }
        
        answer.append(str)
    }
    
    
    
    return answer
}
