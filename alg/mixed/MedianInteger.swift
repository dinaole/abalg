//
//  MedianInteger.swift
//  alg
//
//  Created by Yu, Huiting on 6/20/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class MedianIntegerInFile {
    func findMedian( _ arr: [Int] ) -> Double {
        var cnt = 0
        for _ in arr {
            cnt += 1
        }
        let mmax = arr.max()! + 1, min = arr.min()! - 1
        if cnt % 2 == 1 {
            let r = search(arr, cnt/2 + 1, min, mmax)
            return Double(r)
        } else {
            let r1 = search(arr, cnt/2, min, mmax)
            let r2 = search(arr, 2, r1, mmax )
            return (Double(r1) + Double(r2) )/2
        }
        
    }
    
    private func search(_ arr: [Int], _ k: Int, _ left: Int, _ right: Int) -> Int {
        print(left, right, k)
        var cnt = 0

        if left > right {
            print("error1")
            return Int.min
        }
        let longmid: Int64 = Int64(left) + (Int64(right) - Int64(left) ) / 2
        let mid = Int(longmid)
        var res = left
        for n in arr {
            if n < mid && n >= left {
                cnt += 1
                res = max(res, n)
            }
        }
        if cnt == 0 && left == right {
            print("error2")
            return Int.min
        }
        if cnt == k {
            return res
        } else if cnt < k {
            return search(arr, k - cnt, mid, right)
        } else {
            return search(arr, k, left, mid)
        }
    }
}
