//
//  Iterator for Combination.swift
//  Question Link: https://leetcode.com/problems/iterator-for-combination/
//  Primary idea:   <BackTracking>
//                  1. 2자리의 모든 경우의 수를 구한다.


//  Runtime :
//  Memory :
//
//  Created by gunhyeong on 2020/02/28.
//

import Foundation

class CombinationIterator {
    var result = Set<String>()
    
    init(_ characters: String, _ combinationLength: Int) {
        var characters = Array(characters)
        var combinationLength = combinationLength
        self.backtracking(&characters, &combinationLength, 0, "")
        print(result)
    }
    
    func next() -> String {
        var first: String = ""
        if hasNext() {
            first = result.first!
            result.removeFirst()
        }
        return first
    }
    
    func hasNext() -> Bool {
        let isExist = result.first
        return (isExist == nil) ? false : true
    }
    
    private func backtracking(_ characters: inout [Character], _  combinationLength: inout Int, _ currentLength: Int, _ currentString: String){
        if currentString.count == combinationLength {
            result.insert(currentString)
            return
        }
        
        for index in currentLength..<characters.count {
            backtracking(&characters, &combinationLength, index + 1, currentString+String(characters[index]))
        }
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
