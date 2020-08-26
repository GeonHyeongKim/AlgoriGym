//
//  t-1.swift
//  
//
//  Created by gunhyeong on 2020/08/26.
//

import Foundation

func solve(_ transactions: [Transaction]) -> [DailyTransaction] {
    var answer = [DailyTransaction]()

    for tracsaction in transactions {
        let date = tracsaction.0.components(separatedBy: ["T"]).first!
        let amount = Int64(tracsaction.1)

        if answer.contains(where: {$0.0 == date}) {
            let index = answer.firstIndex(where: {$0.0 == date})!
            answer[index].1 += amount
        } else {
            answer.append((date, amount))
        }

    }

    return answer.sorted(by: {$0.0 > $1.0})
}

//5
//2020-07-12T20:11:36 -97033
//2020-07-12T16:41:11 65064
//2020-07-14T03:47:17 12703
//2020-07-13T11:10:45 6694
//2020-07-11T22:46:00 -98936

//2020-07-14 12703
//2020-07-13 6694
//2020-07-12 -31969
//2020-07-11 -98936
