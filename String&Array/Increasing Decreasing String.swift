/*
*  Increasing Decreasing String.swift
*  Question Link: https://leetcode.com/problems/increasing-decreasing-string/
*  Primary idea:   <String & Array>
*                  1. dictionary : reduce를 이용해, [char:int]로 alphabet과 각 갯수(cnt)를 저장해놓는다.
*                  2. alphabet의 갯수가 1이상일때, 1개씩 감소
*                  3. sort : i(index)의 홀짝을 판별하면서, smallest, largest를 표현
*
*  Time Complexity :
*  Space Complexity :
*  Runtime:  ms
*  Memory Usage:  MB
*
*  Created by gunhyeong on 2020/04/03.
*/

import Foundation

class Solution {
    func sortString(_ s: String) -> String {
        var dict = s.reduce(into: [Character: Int](), { $0[$1] = $0[$1, default: 0] + 1 }) // 1. dictionary
        var index = 0
        var subStrings = [String]()
        
        while !dict.isEmpty{
            subStrings.append("")

            for (char, cnt) in dict {
                subStrings[index].append(char)

                if cnt > 1 { // 2. 1개 이상일때
                    dict[char] = cnt - 1
                } else {
                    dict[char] = nil
                }
            }
            index += 1
        }
        var result = ""
        for i in 0..<subStrings.count {
            result += i % 2 == 0 ? subStrings[i].sorted(by : <) : subStrings[i].sorted(by : >) // 3. sort
        }
        
        return result
    }
}
