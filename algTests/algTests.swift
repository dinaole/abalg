//
//  algTests.swift
//  algTests
//
//  Created by Yu, Huiting on 6/13/18.
//  Copyright © 2018 Yu, Huiting. All rights reserved.
//

import XCTest
@testable import alg

class algTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTrie() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print("test1")
        let t = Trie()
        XCTAssert(true == t.create("/a/", value: "a"))
        
        var tmpV = ""
        t.watch("/a/", { value in tmpV = value })
        
        
        t.set("/a/", value: "ab")
        XCTAssert(tmpV == "ab")
        XCTAssert("ab" == t.get("/a/"))
    }
    
    func testTextJustify() {
        
        let arr1 = TextJustify().fullJustify(["What","must","be","acknowledgment","shall","be"], 16)
        let expected1: [String] = [
            "What   must   be",
            "acknowledgment  ",
            "shall be        "
        ]
        XCTAssert(arr1 == expected1)
        
        let expected2 = [
            "Science  is  what we",
            "understand      well",
            "enough to explain to",
            "a  computer.  Art is",
            "everything  else  we",
            "do                  "
        ]
        let arr2 = TextJustify().fullJustify(["Science","is","what","we","understand","well","enough","to","explain",
                                              "to","a","computer.","Art","is","everything","else","we","do"], 20)
        XCTAssert(arr2 == expected2)
        
        let arr3 = TextJustify().fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16)
        let expected3 = [
            "This    is    an",
            "example  of text",
            "justification.  "
        ]
        XCTAssert(arr3 == expected3)
    }
    
    func testAlienDict() {
        let input: [[String]] = [
            [
                "wrt",
                "wrf",
                "er",
                "ett",
                "rftt"
            ],
            [
                "z",
                "x"
            ],
            [
                "z",
                "x",
                "z"
            ],
          //  ["za","zb","ca","cb"] multiple "abzc" or 'zcab
]
        let output = [
        "wertf", "zx", ""]
        for i in 0..<input.count {
            XCTAssertEqual(output[i], AlienDictionary().alienOrder(input[i]))
        }
    }
    
    func testWordSearch2() {
        let input:[([[Character]], [String])] = [
            ([
                ["o","a","a","n"],
                ["e","t","a","e"],
                ["i","h","k","r"],
                ["i","f","l","v"]
            ],
             ["oath","pea","eat","rain"])
        ]
        let output: [[String]] = [
        ["eat","oath"] // alphabetically sorted.
        ]
        for i in 0..<input.count {
            //XCTAssertEqual(output[i], WordSearch2().findWords(input[i].0, input[i].1))
            XCTAssertEqual(output[i], WordSearch2Opt().findWords(input[i].0, input[i].1))
        }
    }
    
    func testPalindromePairs() {
        let input = [
        ["bat", "tab", "cat"],
        ["abcd", "dcba", "lls", "s", "sssll"],
        ["a", ""]
        ]
        let output = [
        [[0, 1], [1, 0]],
        [[0, 1], [1, 0], [3, 2], [2, 4]],
        [[0, 1], [1, 0]]
        ]
        input.forEach { (inp) in
            print(PalindromePairs().palindromePairs(inp))
        }
        
    }
    
    func testVector2D() {
        let input: [[[Int]]] = [
            [
            [1,2],
            [3],
            [4,5,6]
            ]
        ]
        let output: [[Int]] = [
            [1,2,3,4,5,6]
        ]
        let vec = Vector2D(vec2d: input[0])
        //XCTAssertEqual(false, vec.remove())
        XCTAssertEqual(true, vec.hasNext())
        XCTAssertEqual(1, vec.next())
        XCTAssertEqual(true, vec.hasNext())
        XCTAssertEqual(2, vec.next())
        XCTAssertEqual(true, vec.remove())
        XCTAssertEqual(true, vec.hasNext())
        XCTAssertEqual(3, vec.next())
        XCTAssertEqual(true, vec.remove())
        XCTAssertEqual(true, vec.hasNext())
        XCTAssertEqual(4, vec.next())
    }
    
    func testQueueWithFixedArray() {
        let q = QueueWithFixedArray()
        XCTAssertEqual(nil, q.pull())
        XCTAssertEqual(true, q.push(1))
        XCTAssertEqual(1, q.pull())
        XCTAssertEqual(true, q.push(1))
        XCTAssertEqual(true, q.push(2))
        XCTAssertEqual(true, q.push(3))
        XCTAssertEqual(1, q.pull())
        XCTAssertEqual(true, q.push(4))
        XCTAssertEqual(true, q.push(5))
        
        XCTAssertEqual(true, q.push(6))
        XCTAssertEqual(true, q.push(7))
        //nil(1), nil(1), 2,3 / 4,5, 6, 7
        XCTAssertEqual(6, q.size())
        XCTAssertEqual(2, q.pull())
        XCTAssertEqual(3, q.pull())
        
        //  4,5, 6, 7
        XCTAssertEqual(4, q.size())
        XCTAssertEqual(4, q.pull())
        XCTAssertEqual(5, q.pull())
        XCTAssertEqual(6, q.pull())
        
        
    }
    
    func testDisplayPage() {
        let input: [[String]] = [
            [
            "1,28,310.6,SF",
            "4,5,204.1,SF",
            "20,7,203.2,Oakland",
            "6,8,202.2,SF",
            "6,10,199.1,SF",
            "1,16,190.4,SF",
            "6,29,185.2,SF",
            "7,20,180.1,SF",
            "6,21,162.1,SF",
            "2,18,161.2,SF",
            "2,30,149.1,SF",
            "3,76,146.2,SF",
            "2,14,141.1,San Jose"
        ],
            [              "1,28,300.1,SanFrancisco",
                           "4,5,209.1,SanFrancisco",
                           "20,7,208.1,SanFrancisco",
                           "23,8,207.1,SanFrancisco",
                           "16,10,206.1,Oakland",
                           "1,16,205.1,SanFrancisco",
                           "6,29,204.1,SanFrancisco",
                           "7,20,203.1,SanFrancisco",
                           "8,21,202.1,SanFrancisco",
                           "2,18,201.1,SanFrancisco",
                           "2,30,200.1,SanFrancisco",
                           "15,27,109.1,Oakland",
                           "10,13,108.1,Oakland",
                           "11,26,107.1,Oakland",
                           "12,9,106.1,Oakland",
                           "13,1,105.1,Oakland",
                           "22,17,104.1,Oakland",
                           "1,2,103.1,Oakland",
                           "28,24,102.1,Oakland",
                           "18,14,11.1,SanJose",
                           "6,25,10.1,Oakland",
                           "19,15,9.1,SanJose",
                           "3,19,8.1,SanJose",
                           "3,11,7.1,Oakland",
                           "27,12,6.1,Oakland",
                           "1,3,5.1,Oakland",
                           "25,4,4.1,SanJose",
                           "5,6,3.1,SanJose",
                           "29,22,2.1,SanJose",
                           "30,23,1.1,SanJose"
            ]
        ]
        var dp = DisplayPage()
        var out = dp.getPages(input[0], 5)
        
        XCTAssertEqual("1,28,310.6,SF", out[0])
        XCTAssertEqual("7,20,180.1,SF", out[4])
        XCTAssertEqual(" ", out[5])
        XCTAssertEqual("6,10,199.1,SF", out[6])
        XCTAssertEqual("6,10,199.1,SF", out[6])
        XCTAssertEqual("2,18,161.2,SF", out[8])
        XCTAssertEqual("3,76,146.2,SF", out[9])
        XCTAssertEqual(" ", out[11])
        XCTAssertEqual("2,14,141.1,San Jose", out[14])
        
        
        
        dp = DisplayPage()
        out = dp.getPages(input[1], 12)
        print(out)
        
        XCTAssertEqual(32, out.count);
        XCTAssertEqual("1,28,300.1,SanFrancisco", out[0]);
        XCTAssertEqual("11,26,107.1,Oakland", out[11]);
        XCTAssertEqual(" ", out[12]);
        XCTAssertEqual("1,16,205.1,SanFrancisco", out[13]);
        XCTAssertEqual("2,30,200.1,SanFrancisco", out[14]);
        XCTAssertEqual("25,4,4.1,SanJose", out[24]);
        XCTAssertEqual(" ", out[25]);
        XCTAssertEqual("1,2,103.1,Oakland", out[26]);
        XCTAssertEqual("3,11,7.1,Oakland", out[27]);
        XCTAssertEqual("30,23,1.1,SanJose", out[30]);
        XCTAssertEqual("1,3,5.1,Oakland", out[31]);
    }
    
    func testBuddyList() {
        let myList = ["a", "b", "c", "d"]
        let friendlists = [
            ["g"],
            ["a", "b", "c", "g"],
            ["a", "c", "e", "f"],
            ["a", "b", "c", "d", "e"],
            ["h", "d"]
        ]
        let bl = BuddyList()
        let list = bl.getBuddyList(myList, friendlists)
        XCTAssertEqual(3, list.count)
        print(list)
        let cl = bl.getRecommendedCities(myList, list, 10)
        print(cl)
        XCTAssertEqual(["e","g","f"], cl)
    }
    
    func testScheduleMeeting() {
        let sol = ScheduleMeeting()
        let e1 = [Interval(1,2), Interval(5,8), Interval(11,18)]
        let e2 = [Interval(2,3), Interval(4,9), Interval(13, 15)]
        let expected = [Interval(3,4), Interval(9, 11)]
        let input = [e1, e2]
        let output = sol.employeeFreeTime(input)
         XCTAssertEqual(output.count ,2)
        XCTAssertEqual(output[0].start, 3)
        XCTAssertEqual(output[0].end, 4)
        XCTAssertEqual(output[1].start, 9)
        XCTAssertEqual(output[1].end, 11)
       
    }
    
    func testFlight() {
        var result = CheapestFlight().findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1)
        XCTAssertEqual(200, result)
        
        result = CheapestFlight().findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0)
        XCTAssertEqual(500, result)
    }
    
    func testIPToCIDR() {
        let input: [(String, Int)] = [("255.0.0.7",10),
                     ("255.0.0.62",8)
        ]
        let expected = [ ["255.0.0.7/32","255.0.0.8/29","255.0.0.16/32"],
                        ["255.0.0.62/31", "255.0.0.64/30", "255.0.0.68/31"]
            ]
        let sol = IPToCIDR()
        for (ind, i) in input.enumerated() {
            XCTAssertEqual(expected[ind], sol.ipToCIDR(i.0, i.1))
        }
    }
    
    func testRoundPrice() {
        let input = [
            [1.2, 3.7, 2.3, 4.8],
            [1.2, 2.5, 3.6, 4.0],
            [2.9, 2.3, 1.4, 3, 6],
            [-0.4, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3]
        ]
        let expected = [
            [5,4,2,1],
            [4,2,1,4],
            [3,2,2,3,6],
            [0, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1]
        ]
        let sol = RoundPrice()
        input.forEach { (input) in
            print(sol.roundPrices(input))
        }

    }
    
    func testPourWater() {
        let input = [
            ([2,1,1,2,1,2,2], 4, 3),
            ([2,1,1,2,1,2,2], 6, 3),
            ([3,2,2], 3, 0),
            ([3,2,2,8,0], 2, 0),
            ([3,2,2,8,0], 4, 0)
        ]
        let expected = [
            [2,2,2,3,2,2,2],
            [2,3,3,3,2,2,2],
            [4,3,3],
            [3,3,3,8,0],
            [4,4,3,8,0]
            
        ]
        let sol = PourWater()
        input.enumerated().forEach { (i, arg1) in
            
            let (input, V, K) = arg1
            print(input, V, K)
            XCTAssertEqual(expected[i], sol.pourWater(input, V, K))
        }
    }
    
    func testWizards() {
        let input: [([[Int]], Int, Int)] = [
            ([[1,5,9], [2,3,9], [4], [], [], [9], [], [], [], []], 0, 9),
            ([[1,2], [2], []], 0, 2),
            ([[1], [0], []], 0, 2)
        ]
        let expected: [[Int]] = [
            [0,5,9],
            [0,1,2],
            [],
        ]
        
        let sol = Wizard()
        XCTAssertEqual(expected[0], sol.wizardByDFS(input[0].0, input[0].1, input[0].2))
    }
    func testFloodFill() {
   
        let input = [
        "WWWLLLW",
        "WWLLLWW",
        "WLLLLWW"
        ]
        let expected = [
           "OOOLLLW",
           "OOLLLWW",
           "OLLLLWW"
        ]
        XCTAssertEqual(expected, FloodFill().floodFillDFS(input, 1, 1))
        XCTAssertEqual(expected, FloodFill().floodFillBFS(input, 1, 1))
    }
    
    func testCSVParser() {
        let input: [String] = [ "John,Smith,john.smith@gmail.com,Los Angeles,1", "\"Alexandra \"\"Alex\"\"\",Menendez,alex.menendez@gmail.com,Miami,1" ]
        
    }
    
}
