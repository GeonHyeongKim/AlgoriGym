/*
*  Maximum Number of Balloons.swift
*  Question Link: https://leetcode.com/problems/maximum-number-of-balloons/
*  Primary idea:   <String & Array>
*                  1. balloon : balloon의 알파벳에 대한 갯수를 나타내는 dictionary를 선언
*                  2. 갯수 계산 : 알파벳의 갯수를 전부 돌면서 1개씩 누적
*                  3. 최솟값 : min(알파벳의 갯수 중 가장 작은 것, 알파벳 "l"을 2로 나눈 값, 알파벳 "o"을 2로 나눈 값)을 구한다.
*
*  Time Complexity : O(n)
*  Space Complexity : O(1)
*  Runtime: 28 ms
*  Memory Usage: 22.4 MB
*
*  Created by gunhyeong on 2020/04/10.
*/

import Foundation

class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var dic: [Character:Int] = ["b":0, "a":0, "l":0, "o":0, "n":0] // 1. balloon
        
        for alphabet in text {
            if dic.keys.contains(alphabet) { // 2. 갯수 계산
                dic[alphabet]! += 1
            }
        }
        
        return min(dic.values.min()!, dic["l"]!/2, dic["o"]!/2) // 3. 최솟값
    }
}
