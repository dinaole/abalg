//
//  CSVParser.swift
//  alg
//
//  Created by Yu, Huiting on 6/19/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class CSVParser {
    func parse(_ s: String) -> String {
        var tmp = "", inQuote = false, ret = [String]()
        var i = 0
        while i < s.count {
            var shouldIncrement = false
            if inQuote {
                if s[i] == "\"" {
                    if i + 1 < s.count && s[i+1] == "\"" {
                        shouldIncrement = true
                        tmp.append(s[i])
                    } else {
                        inQuote = false
                    }
                } else {
                    tmp.append(s[i])
                }
            } else {
                if s[i] == "\"" {
                    inQuote = true
                } else if s[i] == "," {
                    ret.append(tmp)
                    tmp = ""
                } else {
                    tmp.append(s[i])
                }
            }
            if shouldIncrement {
                i += 1
            }
            i += 1
        }
        if !tmp.isEmpty {
            ret.append(tmp)
        }
        return ret.joined(separator: "|")
    }
}
