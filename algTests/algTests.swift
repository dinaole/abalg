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
    
}
