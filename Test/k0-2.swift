//
//  k0-1.swift
//  
//
//  Created by gunhyeong on 2020/12/12.
//

import Foundation

func solution(_ n:Int, _ customers: [String]) -> Int {
    var kiosk = [Int : Int]() // 키호스크 번호 : 이용횟수

    // init
    for i in 1...n { kiosk[i] = 0 }

    let format = DateFormatter()
    format.locale = Locale(identifier: "ko_kr")
    format.dateFormat = "MM/dd HH:mm:ss"

    for customer in customers {
        let info = customer.components(separatedBy: " ")
        let day = info[0]
        let time = info[1]
        let lapse = info[2]

        var s = format.date(from: day + " " + time)!
        print(s)
    }
    return 0
}

print(solution(2, ["02/28 23:59:00 03", "03/01 00:00:00 02", "03/01 00:05:00 01"]))
