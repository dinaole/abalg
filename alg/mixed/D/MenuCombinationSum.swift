//
//  MenuCombinationSum.swift
//  alg
//
//  Created by Yu, Huiting on 6/19/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation
class MenuCombinationSumDuplicate {
    func getCombosCanDuplicate(_ sorted_mnu: [Double], _ money: Double) -> [[Int]] { // return the indexes
        let menu = sorted_mnu
        //print(menu)
        var ret = [[Int]](), cur = [Int]()
        dfsDuplicate(0, &cur, &ret, money, menu)
        return ret
    }
    
    private func dfsDuplicate(_ i: Int, _ cur: inout [Int], _ ret: inout [[Int]], _ money: Double, _ menu: [Double]) {
        if abs(money) < 0.0001 {
            ret.append(cur)
            return
        }
        if i >= menu.count {
            return
        }
        if menu[i] > money && menu[i] - money > 0.00001 {
            return
        }
        var cnt = 0
        while money - Double(cnt) * menu[i] > -0.000001 {
            cur.append(contentsOf: Array(repeating: i, count: cnt))
            dfsDuplicate(i+1, &cur, &ret, money - menu[i] * Double(cnt), menu)
            cur.removeSubrange(cur.count-cnt..<cur.count)
            cnt += 1
        }
    }

}
class MenuCombinationSum {
    
    func getCombos(_ mnu: [Double], _ money: Double) -> [[Double]] {
        let menu = mnu.sorted()
        //print(menu)
        var ret = [[Double]](), cur = [Double]()
        dfs(0, &cur, &ret, money, menu)
        return ret
    }
    
    private func dfs(_ i: Int, _ cur: inout [Double], _ ret: inout [[Double]], _ money: Double, _ menu: [Double]) {
        if abs(money) < 0.0001 {
            ret.append(cur)
            return
        }
        if i >= menu.count {
            return
        }
        if menu[i] > money {
            return
        }
        
        cur.append(menu[i])
        dfs(i+1, &cur, &ret, money - menu[i], menu)
        cur.removeLast()
        dfs(i+1, &cur, &ret, money, menu)
    }
    
 
}
