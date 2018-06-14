//
//  Array+Extension.swift
//  alg
//
//  Created by Yu, Huiting on 6/13/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation

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
