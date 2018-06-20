//
//  DisplayPage.swift
//  alg
//
//  Created by Yu, Huiting on 6/15/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class DisplayPage {
    func getPages(_ input: [String], _ pageSize: Int) -> [String] {
        var csv = input
        var ret = [String]()
        while !csv.isEmpty {
            var page = [String]()
            var hset = Set<String>()
            while page.count < pageSize && !csv.isEmpty {
                let str = csv.first {
                    return !hset.contains(hostId($0))
                }
                if str == nil {
                    break
                } else {
                    hset.insert(hostId(str!))
                    page.append(str!)
                    let ind = csv.index(of: str!)
                    csv.remove(at: ind!)
                }
            }
            if page.count < pageSize && !csv.isEmpty {
                let toAdd = pageSize - page.count
                page.append(contentsOf: csv.prefix(toAdd))
                csv.removeFirst(min(toAdd, csv.count))
            }
            if !csv.isEmpty {
                page.append(" ")
            }
            ret.append(contentsOf: page)
        }
        return ret
    }
    
    func hostId(_ s: String) -> String {
        return s.components(separatedBy: ",")[0]
    }
}
