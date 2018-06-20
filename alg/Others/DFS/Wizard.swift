//
//  Wizard.swift
//  alg
//
//  Created by Yu, Huiting on 6/19/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class Wizard {
    var minCost = Int.max
    var minPath = [Int]()
    var w = [[Int]](), src = -1, dst = -1
    
    func wizardByDFS(_ w: [[Int]], _ src: Int, _ dst: Int) -> [Int] {
        minCost = Int.max
        minPath = []
        self.w = w
        self.src = src
        self.dst = dst
        var path = [Int]()
        dfs(&path, src, 0)
        return minPath
    }
    
    private func dfs(_ path: inout [Int], _ cur: Int, _ cost: Int) {
        path.append(cur)
        if cur == dst {
            if minCost > cost {
                minCost = cost
                minPath = path
            }
            path.removeLast()
            return
        }
        for nb in w[cur] {
            if path.contains(nb ) {
                continue
            }
            let c = cost + (nb - cur) * (nb - cur)
            dfs(&path, nb, c)
        }
        path.removeLast()
    }
}


/*
 BFS + heapq
 def wizarddist(g, target):
 q = [(0,0)] # cost, node id
 seen = set()
 while q:
 cost, v = heappop(q)
 print("pop, ", q, cost, v)
 seen.add(v)
 if v==target:
 print("target", v, cost)
 return cost
 
 for nei in g.get(v, ()):
 if nei not in seen:
 c = (v-nei)*(v-nei)
 heappush(q, (cost+c, nei))
 print("heappush, ", q, (cost+c, nei))
 
 return float("inf")
 
 g = {0: [2,1], 1: [0,2]}
 assert wizarddist(g, 2)==2 # the min is 2 instead of 4
 
 #assert wizarddist(g, 3)==float("inf")
 #g = {0: [5, 9], 5:[9]}
 #assert wizarddist(g, 9)==41
 */
