/*
*  Unique Morse Code Words.swift
*  Question Link: https://leetcode.com/problems/unique-morse-code-words/
*  Primary idea:   <String & Array>
*                  1. morse : 미리 dictionary를 만들어 놓는다
*                  2. 이중 for문 : 단어와 일치하는 모스부호를 입력해 결과(result<set>)에 넣는다.
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/04.
*/

import Foundation

class Solution {
    let morse: [Character : String] = ["a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--", "z": "--.."] // 1. more

    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var someSet: Set<String> = Set()
        for s in words {
            var result: String = ""
            for char in Array(s) { // 2.이중 for문
                
                if let data = morse[char] {
                    result.append(data)
                }
            }
            someSet.insert(result)
        }
        
        return someSet.count
    }
}
