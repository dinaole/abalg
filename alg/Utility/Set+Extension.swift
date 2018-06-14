//
//  Set+Extension.swift
//  alg
//
//  Created by Yu, Huiting on 6/14/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation
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
