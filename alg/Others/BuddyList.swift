//
//  BuddyList.swift
//  alg
//
//  Created by Yu, Huiting on 6/15/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation


class BuddyList {
    func getBuddyList(_ myList: [String], _ friendsList: [[String]]) -> [Buddy] {
        
        var ret = [Buddy]()
        let myset = Set<String>(myList)
        for fl in friendsList {
            let intersection = myset.intersection(fl)
            if intersection.count * 2 < myList.count {
                continue
            }
            let buddy = Buddy(list: fl, similarity: intersection.count)
            ret.append(buddy)
        }
        ret.sort { (b1, b2) -> Bool in
            return b1.similarity > b2.similarity
        }
        return ret
    }
    
    func getRecommendedCities(_ myList: [String], _ buddies: [Buddy], _ k: Int) -> [String] {
        var ret = [String]()
        let myset = Set<String>(myList)
        for i in 0..<buddies.count {
            let bset = Set<String>(buddies[i].list)
            let candidates = bset.subtracting(myset)
            for city in candidates {
                if ret.count == k { break }
                if ret.index(of: city) == nil {
                    ret.append(city)
                }
            }
            if ret.count == k { break }
        }
        return ret
    }
}

struct Buddy {
    var list: [String]
    var similarity: Int
}
