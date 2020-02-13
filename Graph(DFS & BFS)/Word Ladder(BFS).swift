//
//  Word Ladder(BFS).swift
//  Question Link: https://leetcode.com/problems/word-ladder/
//  Primary idea:   1. queue 개념을 이용한 BFS 방식을 이용한다.
//                  2. guard 조건을 통해 입력값 return
//                  3. 현재 단어에 대해 한글자씩 분해후 모든 알파벳 대입해서 반환하기

//  Time Complexity :
//  Space Complexity ://
//  Created by gunhyeong on 2020/02/12.
//

import Foundation

struct Queue<T> {
    private var array: [T]
    var isEmpty: Bool {
        return array.count == 0
    }
        
    var count: Int {
        return array.count
    }
        
    init() {
        array = []
    }
        
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
        
    mutating func dequeue() -> T? {
        if isEmpty { return nil }
        
        return array.removeFirst()
    }
    
    func peek() -> T? {
        return array.first
    }
}

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else {
            return 0;
        }
        
        var queue = Queue<String>()
        var dict = Set<String>(wordList)
        
        queue.enqueue(beginWord)
        dict.insert(endWord)
        dict.remove(beginWord)
        var level = 1
        
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let str = queue.dequeue()
                if str == endWord {
                    return level
                }
                for neighbor in neighbors(str!, dict){
                    queue.enqueue(neighbor)
                }
            }
            
            level += 1
        }
        return 0
    }
    
    func neighbors(_ currentWord: String, _ wordList: Set<String>) -> [String]{
        var result = [String]()
        var dict = wordList
        let allAlphabet = Array("abcdefghijklmnopqrstuvwxyz")
        
        for i in 0..<currentWord.count{
            var chars = Array(currentWord)
            for alphabet in allAlphabet {
                chars[i] = alphabet // ait ~ sit
                let word = String(chars)
                if dict.remove(word) != nil {
                    result.append(word)
                }
            }
        }
        
        return result
    }
}
