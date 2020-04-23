import Foundation
func countSubstrings(s: String, queries: [[Int]]) -> [Int] {
    let queries = queries.map({ return (left: $0[0], right: $0[1]) })
    var result: [Int] = []
    for query in queries {
        let leftIndex = s.index(s.startIndex, offsetBy: query.left)
        let rightIndex = s.index(s.startIndex, offsetBy: query.right)
        let substring = String(s[leftIndex ... rightIndex])
        result.append(uniqueSubstringsTwo(in: substring))
    }

    return result
}

func uniqueSubstringsTwo(in s: String) -> Int {
    guard s.count != 1 else {
        return 1
    }
    let array = s.map({ return String($0) })
    var counter: [String: Int] = Dictionary(uniqueKeysWithValues: Set(array).lazy.map { ($0, 0) })

    for char in array {
        counter[char] = counter[char]! + 1
    }

    print(counter)

    return 0
}

func uniqueSubstrings(in s: String) -> Int {
    guard s.count != 1 else {
        return 1
    }
    print("")
    print("--------")
    print("Full String \(s)")
    let chars = s.map({ return String($0) })
    var combos: Set<String> = []
    for i in 0 ..< chars.count {
        for j in i ..< chars.count {
            let substr = String(chars[i ... j].joined())
            print(substr)
            combos.insert(substr)
        }
    }

    return combos.count
}

print(countSubstrings(s: "aabaa", queries: [[1, 1], [1, 4], [1, 1], [1, 4], [0, 2]]))
