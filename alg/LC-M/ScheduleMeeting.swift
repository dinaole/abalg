//
//  ScheduleMeeting.swift
//  alg
//
//  Created by Yu, Huiting on 6/16/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import Foundation



  public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
      self.start = start
      self.end = end
    }
  }

class ScheduleMeeting {
    
    func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
        var times = [(Int, Bool)]()
        var scheduleFlat: [Interval] = schedule.flatMap { return $0 }
        for s in scheduleFlat {
            times.append((s.start, true))
            times.append((s.end, false))
        }
        times.sort { (t1, t2) -> Bool in
            return t1.0 < t2.0
        }
        var ret = [Interval](), bal = 0, pre: Int?
        for t in times {
            if bal == 0, let pre = pre, pre < t.0  {
                ret.append(Interval(pre, t.0))
            }
            if t.1 {
                bal += 1
            } else {
                bal -= 1
            }
            pre = t.0
        }
        return ret
    }
}

