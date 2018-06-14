//
//  AlienDictionary.swift
//  alg
//
//  Created by Yu, Huiting on 6/14/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class AlienDictionary {
    var cset = Set<Character>()
    var g = [Character: Set<Character>]()
    var ret = "", onPath = Set<Character>()
    
    func alienOrder(_ words: [String]) -> String {
        for s in words {
            for c in s {
                cset.insert(c)
            }
        }
        for i in 0..<words.count-1 {
            let w1 = words[i], w2 = words[i+1]
            for j in 0..<min(w1.count, w2.count) {
                if w1[j] == w2[j] { continue }
                if nil == g[w1[j]] {
                    g[w1[j]] = Set<Character>()
                }
                g[w1[j]]!.insert(w2[j])
                break
            }
        }
        
        for c in cset {
            if ret.index(of: c) != nil { continue }
            if !dfs(c) {
                return ""
            }
            
        }
        return String(ret.reversed())
    }
    
    func dfs(_ c: Character) -> Bool {
        if g[c] == nil {
            ret.append(c)
            return true
        }
        onPath.insert(c)
        for nb in g[c]! {
            if ret.index(of: nb) != nil { continue }
            if onPath.contains(nb) {
                return false
            }
            
            if !dfs(nb) {
                return false
            }
        }
        onPath.remove(c)
        ret.append(c)
        return true
    }
}
