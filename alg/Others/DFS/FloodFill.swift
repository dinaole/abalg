//
//  FloodFill.swift
//  alg
//
//  Created by Yu, Huiting on 6/19/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class FloodFill {
    func floodFillDFS(_ lands: [String], _ i: Int, _ j: Int ) -> [String] {
        var arr = lands
        if arr[i][j] != "W" {
            print("error1")
            return arr
        }
        dfs(&arr, i,j)
        return arr
    }
    
    private func dfs(_ arr: inout [String], _ i: Int, _ j: Int) {
        if i < 0 || i >= arr.count || j < 0 || j >= arr[i].count {
            return
        }
        if arr[i][j] != "W" {
            return
        }
        arr[i].replaceSubrange(arr[i].index(j)..<arr[i].index(j+1), with: "O")
        for (vi, vj) in [(1,0), (-1, 0), (0,1), (0,-1)] {
            dfs(&arr, vi+i, vj+j)
        }
    }
    
    func floodFillBFS(_ lands: [String], _ i: Int, _ j: Int) -> [String] {
        var arr = lands
        if arr[i][j] != "W" {
            print("error1")
            return arr
        }
        var q = [Int](), s = Set<Int>()
        q.append(to1D(i,j, lands))
        while !q.isEmpty {
            let (fi, fj) = to2D(q.removeFirst(), lands)
            
            arr[fi].replaceSubrange(arr[fi].index(fj)..<arr[fi].index(fj+1), with: "O")
            
            for (vi, vj) in [(1,0), (-1, 0), (0,1), (0,-1)] {
                let c = to1D(vi+fi, vj+fj, lands)
                if isValid(vi+fi, vj+fj, lands) && !s.contains(c) && arr[vi+fi][vj+fj] == "W" {
                    q.append(c)
                    s.insert(c)
                }
            }
            
        }
        return arr
    }
    
    func isValid(_ i: Int, _ j: Int, _ lands: [String]) -> Bool {
        return i >= 0 && j >= 0 && i < lands.count && j < lands[0].count
    }
    func to2D(_ k: Int, _ lands: [String]) -> (Int, Int) {
        return (k/lands[0].count, k % lands[0].count)
    }
    
    func to1D(_ i: Int, _ j: Int, _ lands: [String]) -> Int {
        return i * lands[0].count + j
    }
}
