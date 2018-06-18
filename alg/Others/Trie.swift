//
//  Solution.swift
//  alg
//
//  Created by Yu, Huiting on 6/13/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class Node {
    typealias CallbackType = (String)->Void
    var value: String = ""
    var callbacks: [CallbackType] = []
    var children: [String: Node] = [:]
}


class Trie {
    var root = Node()
    func create(_ path: String, value: String) -> Bool {
        if let npath = findPath(path, false), let last = npath.last {
            let key = path.components(separatedBy: "/").filter { $0.count > 0}.last!
            let n = Node()
            last.children[key] = n
            n.value = value
            return true
        } else {
            return false
        }
    }
    
    func set(_ path: String, value: String) {
        if let npath = findPath(path) {
            npath.last?.value = value
            npath.forEach { $0.callbacks.forEach { cb in
                cb(value)
                } }
        }

    }
    
    func get(_ path: String) -> String {
        if let npath = findPath(path) {
            return npath.last?.value ?? ""
        }

        return ""
    }
    
    func watch( _ path: String, _ callback: @escaping Node.CallbackType) {
        let arr = path.components(separatedBy: "/").filter { $0.count > 0 }
        if arr.count == 0 { return }
        var cur = root, toCall = [Node]()
        for i in 0..<arr.count {
            if let n = cur.children[arr[i]] {
                cur = n
                toCall.append(cur)
            } else {
                print("watch: cannot find \(arr[i])")
                return
            }
        }
        cur.callbacks.append(callback)
        return
    }
    
    private func findPath(_ path: String, _ includeLast: Bool = true) -> [Node]? {
        let arr = path.components(separatedBy: "/").filter { $0.count > 0 }
        if arr.count == 0 { return nil }
        var cur = root, ret: [Node] = [root]
        for i in 0..<(includeLast ? arr.count : arr.count - 1){
            if let n = cur.children[arr[i]] {
                cur = n
                ret.append(cur)
            } else {
                print("findPath: cannot find \(arr[i])")
                return nil
            }
        }
        return ret
    }
    
    
}
