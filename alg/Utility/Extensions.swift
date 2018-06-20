//
//  Array+Extension.swift
//  alg
//
//  Created by Yu, Huiting on 6/13/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation
//set
extension Set {
    
}
func ==<Element: Equatable> (lhs: Set<Element>, rhs: Set<Element>) -> Bool {
    if lhs.count != rhs.count { return false }
    for i in lhs {
        if !rhs.contains(i) {
            return false
        }
    }
    return true
}
//string
extension String {
    public subscript (i: Int) -> Character {
        let ind: String.Index = self.index(self.startIndex, offsetBy: i)
        return self[ind]
    }
    
    public func index(_ offset: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: offset)
    }
    
    public subscript (range: Range<Int>) -> Substring {
        let lower = range.lowerBound, upper = range.upperBound
        return self[self.index(lower)..<self.index(upper)]
    }
    
    public func reversedStr() -> String {
        return String(self.reversed())
    }
}

//array
extension Array {

}

func +=<Element> (lhs: inout [Element], rhs: [Element]) {
    lhs.append(contentsOf: rhs)
}

func ==<Element: Equatable> (lhs: [Element], rhs: [Element]) -> Bool {
    if lhs.count != rhs.count { return false }
    for i in 0..<lhs.count {
        if lhs[i] != rhs[i] {
            return false
        }
    }
    return true
}
