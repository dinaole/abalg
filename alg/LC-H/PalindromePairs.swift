//
//  PalindromePairs.swift
//  alg
//
//  Created by Yu, Huiting on 6/14/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class PalindromePairs {
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var dict = [String: Int](), res = [[Int]]()
        words.enumerated().forEach { (i, w) in
            dict[w] = i
        }
        for (i, w) in words.enumerated() {
            for k in 0...w.count {
                if isP(String(w.prefix(k))), let ind = dict[String(w.suffix(w.count - k)).reversedStr()], ind != i {
                    res.append([ind, i])
                }
                if k > 0 && isP(String(w.suffix(k))), let ind = dict[String(w.prefix(w.count - k)).reversedStr()], ind != i {
                    res.append([i, ind])
                }
            }
        }
        return res
    }
    func isP(_ w: String) -> Bool {
        for i in 0..<w.count/2 {
            if w[i] != w[w.count - i - 1] {
                return false
            }
        }
        return true
    }
}
