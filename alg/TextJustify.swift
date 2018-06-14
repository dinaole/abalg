//
//  TextJustify.swift
//  alg
//
//  Created by Yu, Huiting on 6/13/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation
class TextJustify {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var tmp = [[String]]()
        for w in words {
            if let last = tmp.last, totalLen(last) + w.count + last.count <= maxWidth {
                tmp[tmp.count-1] += [w]
            } else {
                tmp.append([w])
            }
        }
        var ret: [String] = tmp.map { (sarr) -> String in
            if sarr.count == 1 {
                
                return sarr[0] + String(repeating: " ", count: maxWidth - sarr[0].count)
            }
            let spaces = maxWidth - totalLen(sarr)
            let avg = spaces / (sarr.count - 1)
            let extraCnt =  spaces % (sarr.count - 1)
            var finals = ""
            for (i, s) in sarr.enumerated() {
                finals.append(s)
                if i < sarr.count - 1 {
                    finals.append(String(repeating: " ", count: avg + (i < extraCnt ? 1 : 0)))
                }
                
            }
            return finals
        }
        ret[ret.count - 1] = tmp.last!.joined(separator: " ") + String(repeating: " ", count: maxWidth - tmp.last!.joined(separator: " ").count)
        return ret
    }
    
    func totalLen(_ s: [String]) -> Int {
        return s.reduce(0, { (res, str) -> Int in
            res + str.count
            })
    }
}
