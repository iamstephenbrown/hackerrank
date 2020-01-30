import Foundation

extension Array {
    var pairs: [[Element]] {
        guard !isEmpty else { return [[]] }
        var pairs = [[Element]]()
        for i in 0 ..< self.count {
            for j in i ..< self.count {
                guard i != j else {
                    continue
                }
                pairs.append([self[i], self[j]])
            }
        }
        
        return pairs
    }
}

func isAlternating(s: String) -> Bool {
    let set = Array(Set(s))
    let firstChar = set[0]
    let secondChar = set[1]
        
    let firstString = "\(firstChar)\(firstChar)"
    guard s.contains(firstString) == false else {
        return false
    }
    let secondString = "\(secondChar)\(secondChar)"
    guard s.contains(secondString) == false else {
        return false
    }
    
    return true
}

func alternate(s: String) -> Int {
    
    let uniqueCharacters = Set(s)
    var count = 0
    
    if s.count == 2, uniqueCharacters.count == 2 {
        return 2
    }
    
    guard s.count != uniqueCharacters.count else {
        // there are no alternating characters
        return count
    }
    
    // retrieve pairs of unique characters
    let pairs = Array(uniqueCharacters).pairs
    
    for pair in pairs {
        let reducedString = reduce(s: s, leavingPair: pair)
        if isAlternating(s: reducedString), count < reducedString.count {
            count = reducedString.count
        }
    }
        
    return count
}

func reduce(s: String, leavingPair pair: [String.Element]) -> String {
    let reduced: [String.Element] = s.compactMap({ char in
        guard char == pair[0] || char == pair[1] else {
            return nil
        }
        
        return char
    })
    
    return String(reduced)
}

print(alternate(s: "ab") == 2)
print(alternate(s: "beabeefeab") == 5)
print(alternate(s: "asvkugfiugsalddlasguifgukvsa") == 0)
print(alternate(s: "asdcbsdcagfsdbgdfanfghbsfdab") == 8)
