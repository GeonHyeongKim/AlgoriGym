/*
*  Palindrome Partitioning.swift
*  Question Link: https://leetcode.com/problems/palindrome-partitioning/
*  Primary idea:   <BackTracking>
*                  1. 회문(Palindrome)의 정의 : 앞에서부터 읽나 뒤에서부터 읽나 동일한 단어
*                  2. 기본적으로 DFS로 풀이를 한다.
*                  3. 회문인지 아닌지를 판별 - 앞의 N/2와 그에 상대되는 후반부의 element와 비교하여 끝까지 같음을 확인
*
*  Time Complexity : O(n^n)
*  Space Complexity : O(n)
*  Runtime: 596 ms
*  Memory Usage: 22.1 MB
*
*  Created by gunhyeong on 2020/03/18.
*/

import Foundation

class Solution {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var palindromes = [String]()
        
        backTracking(&result, Array(s), &palindromes, 0)
        return result
    }
    
    func backTracking(_ result: inout [[String]], _ characters: [Character], _ palindromes: inout [String], _ start: Int) { // 2. DFS
        if start == characters.count {
            result.append(palindromes)
            return
        }
        
        for i in start..<characters.count {
            let palindrome = String(characters[start...i])
            if isPalindrome(Array(palindrome)) { // 3. 회문인가?
                palindromes.append(palindrome)
                backTracking(&result, characters, &palindromes, i+1) // 2. DFS
                palindromes.removeLast()
            }
        }
    }
    
    func isPalindrome(_ palindrome: [Character]) -> Bool { // 3. 회문인가?
        let lenth = palindrome.count
        
        for i in 0...(lenth/2) { // 앞의 N/2와 그에 상대되는 후반부의 element와 비교하여 끝까지 같음을 확인
            if palindrome[i] != palindrome[lenth-1-i]{
                return false
            }
        }
        return true
    }
}
