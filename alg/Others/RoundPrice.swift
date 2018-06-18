//
//  RoundPrice.swift
//  alg
//
//  Created by Yu, Huiting on 6/17/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class RoundPrice {
    func roundPrices(_ prices: [Double]) -> [Int] {
        let floorsum: Int = prices.reduce(0) { (res, d) -> Int in
            return res + Int(floor(d))
        }
        let sum: Double = prices.reduce(0) { $0 + $1 }
        let roundedSum: Int = Int(round(sum))
        
        let diff = roundedSum - floorsum
        let sorted = prices.sorted { (d1, d2) -> Bool in
            if d1 - ceil(d1) == 0 {
                return false
            }
            return ceil(d1) - d1 < ceil(d2) - d2
        }
        let ret = sorted.enumerated().map { (ind, p) -> Int in
            if ind < diff {
                return Int(ceil(p))
            }
            return Int(floor(p))
        }
        return ret
    }
}
