//
//  WaterLand.swift
//  alg
//
//  Created by Yu, Huiting on 6/15/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation
class PourWater {
    func pourWater(_ h: [Int], _ V: Int, _ K: Int) -> [Int] {
        var heights = h
        var volume = V
        while volume > 0 {
            
            var ind = K, find = K
            while ind > 0 && heights[ind-1] <= heights[ind] {
                if heights[ind-1] < heights[ind] {
                    find = ind-1
                }
                ind -= 1
            }
            if find < K {
                heights[find] = heights[find] + 1
                volume -= 1
                continue
            }
            while ind < heights.count-1 && heights[ind+1] <= heights[ind] {
                if heights[ind+1] < heights[ind] {
                    find = ind + 1
                }
                ind += 1
            }
            
            heights[find] += 1
            
            volume -= 1
        }
        return heights
    }

}
