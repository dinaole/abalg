//
//  PreferenceList.swift
//  alg
//
//  Created by Yu, Huiting on 6/19/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class PreferenceList {
    func computeListBFS( _ prefLists: [[Int]]) -> [Int] {
        var indegrees = [Int: Int](), edges = [Int: Set<Int>]()
        var ret = [Int](), q = [Int]()
        for pl in prefLists {
            for i in 0..<pl.count - 1 {
                let from = pl[i]
                let to = pl[i+1]
                if nil == indegrees[to] {
                    indegrees[to] = 0
                }
                indegrees[to] = indegrees[to]! + 1
                if nil == indegrees[from] {
                    indegrees[from] = 0
                }
                if edges[from] == nil {
                    edges[from] = Set<Int>()
                }
                edges[from]!.insert(to)
            }
            if indegrees[pl[pl.count - 1]] == nil {
                indegrees[pl[pl.count - 1]] = 0
            }
        }
        
        for n in indegrees.keys {
            if indegrees[n] == 0 {
                q.append(n)
                indegrees.removeValue(forKey: n)
            }
        }
        while !q.isEmpty {
            let node = q.removeFirst()
            ret.append(node)
            if nil == edges[node] {
                
                continue
            }
            for nb in edges[node]! {
                if indegrees[nb] == nil {
                    print("error", nb, indegrees, ret)
                }
                indegrees[nb] = indegrees[nb]! - 1
                if indegrees[nb] == 0 {
                    indegrees.removeValue(forKey: nb)
                    q.append(nb)
                }
            }
        }
        return indegrees.isEmpty ? ret : []
    }
}
