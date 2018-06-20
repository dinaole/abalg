//
//  QueueWithFixedArray.swift
//  alg
//
//  Created by Yu, Huiting on 6/15/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class QueueWithFixedArray {
    static let maxSize = 5
    var head: FixedArray = FixedArray(QueueWithFixedArray.maxSize)
    var tail: FixedArray?
    var h = 0, t = 0
    var count = 0
    init() {
        tail = head
    }
    func push(_ value: Int) -> Bool {
        guard nil != tail else {
            print("no tail ")
            return false
        }
        count += 1
        if t == QueueWithFixedArray.maxSize - 1 {
            tail!.items[t] = FixedArray(QueueWithFixedArray.maxSize)
            tail = tail!.items[t] as? FixedArray
            t = 0
        }
        tail!.items[t] = value
        t += 1
        return true
    }
    func pull() -> Int? {
        var ret: Int?
        if let v = head.items[h] as? Int {
            ret = v
        } else {
            print("nothing to pull")
            return nil
        }
        count -= 1
        h += 1
        if h == QueueWithFixedArray.maxSize - 1 {
            if let n = head.items[h] as? FixedArray {
                head = n
                h = 0
            }
        }
        return ret
    }
    
    func size() -> Int {
        return count
    }
}

class FixedArray {
    var items: [Any?] = []
    init(_ maxSize: Int) {
        items = Array(repeating: nil, count: maxSize)
    }
}
