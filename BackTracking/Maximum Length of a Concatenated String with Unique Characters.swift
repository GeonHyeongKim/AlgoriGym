//
//  Maximum Length of a Concatenated String with Unique Characters.swift
//  Question Link: https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
//  Primary idea:   <BackTracking>
//                  1. 이중 반복문을 통해 해결
//                      1) 1번째 반복문 : 배열의 모든 값을 탐색
//                      2) 2번째 반복문 : characters에 대해 spelling(Character) 하나하나를 탐색
//                          * 1 : spelling(Character)가 최대 길이에 포함되어 있는지 check
//                          * 2 : 문자 자체가 Unique한지 check
//

//  Runtime: 96 ms
//  Memory Usage: 21.3 MB
//
//  Created by gunhyeong on 2020/03/10.
//

import Foundation

class Solution {
    var sortedArr = [String]()
    var isContinue: Bool = false
    var maxCnt = Int(0)
    
    func maxLength(_ arr: [String]) -> Int {
        guard arr.count >= 1 && arr.count <= 26 else { // Contrains
            return maxCnt
        }
        self.sortedArr = arr.sorted(by: { (a, b) -> Bool in // 정렬
            a.count < b.count
        })
                
        backTracking("", 0)
                
        return maxCnt
    }
    
    func backTracking(_ maxLen: String, _ startIndex: Int){
        for i in startIndex..<sortedArr.count {
            var checkUniqueChar = ""
            
            for character in sortedArr[i] {
                if checkUniqueChar.contains(character){ // 1-2)-2 : 문자 자체가 Unique한지 check
                    isContinue = true
                    continue
                }
                
                if maxLen.contains(character) { //  1-2)-1 :maxLenth에 포함되어 있지 않은 charater인지 check
                    isContinue = true
                    continue
                }
                
                checkUniqueChar += String(character)
            }
            
            if !isContinue {
                let concatenations = maxLen+sortedArr[i]
                maxCnt = max(maxCnt, concatenations.count) // 최댓값
                backTracking(concatenations, i + 1)
            }
            
            isContinue = false
        }
    }
}

