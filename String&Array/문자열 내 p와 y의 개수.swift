//
//  문자열 내 p와 y의 개수.swift
//  Question Link: https://programmers.co.kr/learn/courses/30/lessons/12916
//  Primary idea:       <String & Array> - filter
//                      1. P(p)와 Y(y)를 담는 변수 두개를 선언
//                      2. filter() 통해 p,y를 구분해서 배열로 만든다
//                      3. count를 통해 갯수를 파악
//
//  Time Complexity : O(n)
//  Space Complexity : O(n)
//  Runtime: 0.13 ~ 0.17 ms
//  Memory Usage: 23.6 ~ 24.3 MB
//
//  Created by gunhyeong on 2020/07/04.
//

import Foundation

func solution(_ s:String) -> Bool
{
    let cntP = s.filter({$0 == "p" || $0 == "P"}).count
    let cntY = s.filter({$0 == "y" || $0 == "Y"}).count

    return cntP == cntY ? true : false
}
