//
//  n하0-1.swift
//  
//
//  Created by gunhyeong on 2020/12/03.
//

import Foundation

func solution(_ m:String, _ k:String, _ answer: String) -> String {
    var arrM = Array(m)
    var standardIndex = 0

    for key in k {
        let index = arrM[standardIndex..<arrM.count].firstIndex(of: key)!
        standardIndex = index
        arrM.remove(at: index)
    }

    return String(arrM) == answer ? "정답" : "틀림"
}

print(solution("kkaxbycyz", "abc", "kkxyyz"))
print(solution("acbbcdc", "abc", "cbdc"))

