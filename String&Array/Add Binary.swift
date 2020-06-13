/*
*  Add Binary.swift
*  Question Link: https://leetcode.com/problems/add-binary/
*  Primary idea:   <String & Array>
*                  1. 조건 : a,b의 각자리 수를 전부 검사했을때 + sum의 합이 1일때(carray 발생)
*                  2. 판별 : 각자리에 계산 할 수가 있을떄(>=0), 그 값을 가져오고 아닐 경우 0으로 대체
*                  3. 결과 : sum의 경우의 수가 0, 1, 2가 나오는데 2일때는 carray빌셍
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 16 ms
*  Memory Usage: 20.8 MB
*
*  Created by gunhyeong on 2020/04/12.
*/

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let arrA = Array(a)
        let arrB = Array(b)
        var lenA = arrA.count - 1
        var lenB = arrB.count - 1
        
        var result = ""
        var sum = 0
        
        while sum == 1 || lenA >= 0 || lenB >= 0 {
            sum += lenA >= 0 ? Int(String(arrA[lenA]))! : 0
            sum += lenB >= 0 ? Int(String(arrB[lenB]))! : 0
            result = String(sum%2) + result
            sum /= 2
            
            lenA -= 1
            lenB -= 1
        }
        
        return result
    }
}
