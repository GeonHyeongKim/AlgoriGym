/*
*  Add Binary.swift
*  Question Link: https://leetcode.com/problems/add-binary/
*  Primary idea:   <String & Array>
*                  1. 조건 : a,b의 각자리 수를 전부 검사했을때 + sum의 합이 1일때(carray 발생)
*                  2. 판별 : 각자리에 계산 할 수가 있을떄(>=0), 그 값을 가져오고 아닐 경우 0으로 대체
*                  3. 결과 : sum의 경우의 수가 0, 1, 2가 나오는데 2일때는 carray빌셍
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/12.
*/

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aStrArr = Array(a)
        let bStrArr = Array(b)
        var aIndex = aStrArr.count - 1
        var bIndex = bStrArr.count - 1
        var sum = 0 // 각 자리수 합
        var result = ""
        
        while aIndex >= 0 || bIndex >= 0 || sum == 1{ // 1. 조건
            sum += (aIndex >= 0) ? Int(String(aStrArr[aIndex]))! : 0 // 2. 판별
            sum += (bIndex >= 0) ? Int(String(bStrArr[bIndex]))! : 0 // 2. 판별
            result = String(sum%2) + result // 3. 결과
            sum /= 2
                
            aIndex -= 1
            bIndex -= 1
        }
        
        return result
    }
}
