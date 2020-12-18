//
//  t-3.swift
//  
//
//  Created by gunhyeong on 2020/08/28.
//

import Foundation

func solve(_ args: (Int, [(Int, UInt32)])) -> [(String, UInt64)] {
    let (n, history) = args
    var answer = [(String, UInt64)]()
    var infoUser = [(Int, UInt32)]()

    let totalAmount = history.reduce(0, {$0 + $1.1})
    let distributedPrice = Double(Double(totalAmount)/Double(n))

    for info in history {
        let id = info.0
        let amount = info.1

        if infoUser.contains(where: {$0.0 == id}) {
            infoUser[id].1 += amount
        } else {
            infoUser.append((id, amount))
        }
    }

    for info in 1..<infoUser.count {
        let amount = Double(infoUser[info].1)
        if amount > distributedPrice {
            answer.append(("send", UInt64(floor(amount - distributedPrice))))
        } else if amount < distributedPrice{
            answer.append(("receive", UInt64(floor(distributedPrice - amount))))
        } else {
            answer.append(("none", 0))
        }
    }

    return answer
}
