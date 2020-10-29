//
//  j-3.swift
//  
//
//  Created by gunhyeong on 2020/10/29.
//

import Foundation

func a(_ num: Int) -> [Int] {
    var answer = 0
    
    for i in 1..<num {
        if num % i == 0 {
            if isp(i) && isp(num/i) {
                return [i, num/i]
            }
        }
    }
    
    return [-1, -1]
}


func isp(_ num: Int) -> Bool {
    return num > 1 && !Array(2..<num).contains(where: {num%$0==0})
}

//print(a(49))
print(a(999962000357))
