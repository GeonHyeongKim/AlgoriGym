//
//  j-1.swift
//  
//
//  Created by gunhyeong on 2020/10/30.
//

import Foundation
func a(_ consumers: [String]) -> [Int] {
    var dict = [Int:[Int]]()
    var answer = [Int]()
    
    for info in consumer {
        if dict.keys.contains(info) {
            dict[info]! += 1
        } else {
            dict[info] = 0
        }
    }
    
    for info in dict {
        let id = info.keys
        let b = info.value
        
        while b >= 4 {
            answer.append(id)
            b -= 4
        }
    }
    
    return answer.count > 0 ? answer.sorted(by : <) : [-1]
}
