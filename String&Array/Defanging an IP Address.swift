/*
*  Defanging an IP Address.swift
*  Question Link: https://leetcode.com/problems/defanging-an-ip-address/
*  Primary idea:   <String&Array>
*                  1. 문자열을 대체하는 내부 함수를 사용(대체, 제거) - replacingOccurrences
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/01.
*/

import Foundation

class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}
