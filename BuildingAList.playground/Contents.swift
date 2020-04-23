// Building a List
// https://www.hackerrank.com/challenges/building-a-list/problem

// Solution:
// 1 - Turn the string into an array of characters

class Tree {
    var elements: [String] = []
    // we need a tree in here no?
    var missings = 0
    func add(_ string: String) {
        guard elements.contains(string) == false else {
            missings += 1
            print("Adding \(string) \(missings)")
            return
        }
        elements.append(string)
    }
}

func calculate(from: [String], to: [String], tree: inout Tree) {
    if to.isEmpty == false {
        tree.add(to.sorted().joined(separator: ""))
    }

    guard from.isEmpty == false else {
        return
    }

    for item in from {
        calculate(
            from: from.filter({ $0 != item }),
            to: to + [item],
            tree: &tree
        )
    }
}

func solve(s: String) -> [String] {
    let strArray = s.map({ return String($0) })

    var tree = Tree()
    calculate(from: strArray, to: [], tree: &tree)

    return tree.elements
}

import Foundation
let startDate = Date().timeIntervalSince1970

let string = "abcdefghi"

let result = solve(s: string)

let endDate = Date().timeIntervalSince1970
print(result)
print("Seconds: \(endDate - startDate)")
