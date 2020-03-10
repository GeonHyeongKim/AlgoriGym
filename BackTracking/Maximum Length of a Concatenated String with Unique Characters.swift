//
//  Maximum Length of a Concatenated String with Unique Characters.swift
//  Question Link: https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
//  Primary idea:   <BackTracking>
//                  1.
//

//  Runtime:
//  Memory Usage:
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
            var sortedCharacters = sortedArr[i].sorted()
            
            for character in sortedCharacters {
                sortedCharacters.remove(at: sortedCharacters.firstIndex(of: character)!) // 첫 번째 character 제거
                
                if sortedCharacters.contains(character) { // character 자체가 unique지 check
                    isContinue = true
                    continue
                }
                
                if maxLen.contains(character) { // maxLenth에 포함되어 있지 않은 charater인지 check
                    isContinue = true
                    continue
                }
            }
            
            if !isContinue {
                let concatenations = maxLen+sortedArr[i]
                maxCnt = max(maxCnt, concatenations.count) // 최댓값 저장
                backTracking(concatenations, i + 1)
            }
            
            isContinue = false
        }
    }
}
