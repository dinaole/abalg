//
//  IPtoCidr.swift
//  alg
//
//  Created by Yu, Huiting on 6/15/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

class IPToCIDR {
    func ipToCIDR(_ ip: String, _ n: Int) -> [String] {
        var remain = n, ret = [String]()
        var num = ipToInt(ip)
        while remain > 0 {
            var k = 0, powk = 1, mask = 1
            while num & mask == 0 && powk * 2 <= remain {
                k += 1
                powk *= 2
                mask = (( mask << 1 ) | 1)
            }
            ret.append(numToIP(num) + "/" + String(32-k))
            num += powk
            remain -= powk
        }
        return ret
        
    }
    
    func ipToInt(_ ip: String) -> Int {
        let arr = ip.components(separatedBy: ".")
        var multi = 1, sum = 0
        for i in (0..<4).reversed() {
            sum += Int(arr[i])! * multi
            multi *= 256
        }
        return sum
    }
    
    func numToIP(_ num: Int) -> String {
        var n = num, arr = [Int]()
        for _ in 0..<4 {
            arr.append(n % 256)
            n = n / 256
        }
        let ret = arr.reversed().map {
            String($0)
        }.joined(separator: ".")
        return ret
    }
}
