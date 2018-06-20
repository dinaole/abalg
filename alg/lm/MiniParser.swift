//
//  MiniParser.swift
//  alg
//
//  Created by Yu, Huiting on 6/19/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class NestedIntList {
    var isNumber: Bool = false
    var value: Int?
    var list: [NestedIntList] = []
    
    init(value: Int) {
        self.value = value
        self.isNumber = true
    }
    init() {
        
    }
}


class MiniParser {
    func deserialize(_ s: String) -> NestedIntList {
        var arr = [NestedIntList]()
        arr.append(NestedIntList())
        var i = 0
        while i < s.count {
            if s[i] == "[" {
                arr.append(NestedIntList())
                i += 1
            } else if s[i] == "-" || (s[i] <= "9" && s[i] >= "0") {
                var j = i + 1
                while j < s.count && (s[j] <= "9" && s[j] >= "0") {
                    j += 1
                }
                let ni = NestedIntList(value: Int(s[i..<j])!)
                arr.last!.list.append(ni)
                i = j
            } else if s[i] == "]" {
                let ni = arr.removeLast()
                arr.last!.list.append(ni)
                i += 1
            } else if s[i] == "," {
                i += 1
            }
        }
        return arr.last!.list.first!
    }
}
