//
//  String+Extension.swift
//  alg
//
//  Created by Yu, Huiting on 6/13/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation


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
}
