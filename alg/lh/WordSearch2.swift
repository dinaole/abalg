//
//  wordSearch.swift
//  alg
//
//  Created by Yu, Huiting on 6/14/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation


class WordSearch2Opt {
    var result = [String]()
    class Node {
        var dict: [Character: Node] = [:]
        var word: String? = nil
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = buildTree(words)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                dfs(board, root, i, j)
            }
        }
        return Array<String>(Set<String>(result))
    }
    func dfs(_ b: [[Character]], _ node: Node, _ i: Int, _ j: Int) {
        var board = b
        if node.word != nil {
            result.append(node.word!)
        }
        if i < 0 || j < 0 || i >= board.count || j >= board[0].count {
            return
        }

        if node.dict[board[i][j]] == nil {
            return
        }
        let cur = node.dict[board[i][j]]!
        board[i][j] = "0"
        for (vi, vj) in [(0,1), (0,-1), (1,0), (-1,0)] {
            dfs(board, cur, vi+i, vj+j)
        }
        
    }
    func buildTree(_ words: [String]) -> Node {
        let root = Node()
        for w in words {
            var cur = root
            for c in w {
                if nil == cur.dict[c] {
                    cur.dict[c] = Node()
                }
                cur = cur.dict[c]!
            }
            cur.word = w
        }
        return root
    }
}

class WordSearch2 {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var ret = [String]()
        for w in words {
            for i in 0..<board.count {
                for j in 0..<board[0].count {
                    if dfs(board, i,j,w) {
                        ret.append(w)
                    }
                }
            }
        }
        ret.sort()
        return Array<String>(Set<String>(ret))
    }
    func dfs(_ b: [[Character]], _ i: Int, _ j: Int, _ w: String) -> Bool {
        var board = b
        if w.count == 0 {
            return true
        }
        if i < 0 || j < 0 || i >= board.count || j >= board[0].count {
            return false
        }
        if board[i][j] != w.first { return false }
        board[i][j] = "0"
        for (vi, vj) in [(0,1), (0,-1), (-1,0), (1,0)] {
            if dfs(board, vi+i, vj+j, String(w.suffix(from: w.index(1)))) {
                return true
            }
        }
        return false
        
    }
    

}
