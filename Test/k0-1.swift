//
//  k0-1.swift
//  
//
//  Created by gunhyeong on 2020/12/13.
//

import Foundation

func solution(_ N:Int) -> [Int] {
    var max = -1
    var answer = [Int]()

    for i in stride(from: 9, to: 2, by: -1) {
        let digit = String(N, radix: i).filter({$0 != "0"}).map{$0.hexDigitValue!}.reduce(1, *)
        if max < digit {
            max = digit
            answer = [i, digit]
        }
    }
    return answer
}

print(solution(14))
