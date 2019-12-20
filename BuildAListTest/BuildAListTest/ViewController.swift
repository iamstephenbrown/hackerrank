//
//  ViewController.swift
//  BuildAListTest
//
//  Created by Stephen Brown on 8/19/19.
//  Copyright © 2019 Stephen Brown. All rights reserved.
//

import UIKit

class Node {
    var value: Int
    var next: Node? = nil
    
    init(value: Int) {
        self.value = value
    }
}

class NodeFactory {
    func build(_x: Int) -> Node {
        let node = Node(value: x)
        
        return node
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        mergeList()
    }
    
    func mergeList() {
        
    }
    
    func buildList() {
        let startDate = Date().timeIntervalSince1970 * 1000
        
        let string = "abcdefghi"
        
        let result = Solver.solve(s: string)
        
        let endDate = Date().timeIntervalSince1970 * 1000
        print(result)
        print("Seconds: \(endDate - startDate)")
    }
}

func calculate(from: [String], to: [String], result: inout [String]) {
    if to.isEmpty == false {
        result.append(to.joined(separator: ""))
    }
    
    guard from.isEmpty == false else {
        return
    }
    
    for i in 0..<from.count {
        let nextIndex = i + 1
        let next = Array(from[nextIndex..<from.count])
        calculate(from: next, to: to + [from[i]], result: &result)
    }
}

class Solver {
    class func solve(s: String) -> [String] {
        let strArray = s.map( { return String($0) })
        
        var result = [String]()
        calculate(from: strArray, to: [], result: &result)
        
        return result
    }
}

