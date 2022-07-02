//
//  비밀번호 .swift
//  Algorithm
//
//  Created by gunhyeong on 2021/06/22.
//  Copyright © 2021 geonhyeong. All rights reserved.
//

import Foundation

extension Character {
    var isValid: Bool {
        let ascii = self.asciiValue!
        return (ascii >= 97 && ascii <= 122
        || ascii >= 48 && ascii <= 57
        || self == "-" || self == "_" || self == ".")
    }
}

func solution(_ new_id:String) -> String {
    var myId: String = new_id

    // 1단계
    myId = myId.lowercased()

    // 2단계
    myId = myId.filter {$0.isValid}

    // 3단계
    while myId.contains("..") {
        myId = myId.replacingOccurrences(of: "..", with: ".")
    }

    // 4단계
    if myId.first == "." {
        myId.removeFirst()
    }

    if myId.last == "." {
        myId.removeLast()
    }

    // 5단계
    if myId.count == 0 {
        myId = "a"
    }

    // 6단계
    if myId.count >= 16 {
        let i = myId.index(myId.startIndex, offsetBy: 15)
        myId = String(myId[myId.startIndex..<i])
        if myId.last == "." {
            myId.removeLast()
        }
    }

    // 7단계
    if myId.count <= 2 {
        while myId.count < 3 {
            myId = myId + String(myId.last!)
        }
    }

    return myId
}


