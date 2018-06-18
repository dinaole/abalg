//Input: 2d vector =
//[
//[1,2],
//[3],
//[4,5,6]
//]
//Output: [1,2,3,4,5,6]
//Explanation: By calling next repeatedly until hasNext returns false,
//the order of elements returned by next should be: [1,2,3,4,5,6].
//class Vector2D {
//    public:
//    Vector2D(vector<vector<int>>& vec2d) {
//
//    }
//
//    int next() {
//
//    }
//
//    bool hasNext() {
//
//    }
//};
//
///**
// * Your Vector2D object will be instantiated and called as such:
// * Vector2D i(vec2d);
// * while (i.hasNext()) cout << i.next();
// */

import Foundation

class Vector2D {
    private var vec2d: [[Int]]
    
    private var r = 0, c = 0
    init(vec2d: [[Int]]) {
        self.vec2d = vec2d
    }
    
    func next() -> Int {
        let v = vec2d[r][c]
        c += 1
        return v
    }
    
    func hasNext() -> Bool {
        while r < vec2d.count && c >= vec2d[r].count {
            r += 1
            c = 0
        }
        guard r < vec2d.count, c < vec2d[r].count else {
            return false
        }
        return true
    }
    
    func remove() -> Bool {
        c -= 1
        while c < 0 && r > 0 {
            r -= 1
            c = vec2d[r].count - 1
        }
        
        guard r < vec2d.count && c < vec2d[r].count && c >= 0 && r >= 0 else {
            print("\(r), \(c), invalid removal")
            return false
        }
        vec2d[r].remove(at: c)
        return true
    }
}
