//
//  CheapestFlight.swift
//  alg
//
//  Created by Yu, Huiting on 6/16/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class CheapestFlight {
    var result = Int.max
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var edges = [Int: Set<Int>](), prices = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for f in flights {
            if nil == edges[f[0]] {
                edges[f[0]] = Set<Int>()
            }
            edges[f[0]]?.insert(f[1])
            prices[f[0]][f[1]] = f[2]
        }
        
        var visited = Set<Int>()
        dfs(edges, prices, src, dst, K, 0, 0, &visited)
        return result == Int.max ? -1 : result
    }
    
    func dfs(_ edges: [Int: Set<Int>], _ prices: [[Int]], _ src: Int, _ dst: Int, _ K: Int, _ p: Int, _ steps: Int, _ visited: inout Set<Int>) {
        visited.insert(src)
        defer {
            visited.remove(src)
        }
        
        if src == dst {
            result = min(result, p)
            return
        }
        if steps > K { return }
        guard let nbs = edges[src] else { return }
        for n in nbs {
            if visited.contains(n) { continue }
            dfs(edges, prices, n, dst, K, p+prices[src][n], steps + 1, &visited)
        }
    }
}

