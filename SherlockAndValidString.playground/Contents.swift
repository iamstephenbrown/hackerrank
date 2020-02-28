import Foundation

func isValid(s: String) -> String {
    let chars = s.map({ return String($0) })
    let uniqueChars = Set(chars)
    var occurences: [String: Int] = Dictionary(uniqueKeysWithValues: uniqueChars.lazy.map { ($0, 0) })
    
    for char in chars {
        occurences[char] = occurences[char]! + 1
    }
    
    // are they all the same?
    let uniqueCounts = Set(occurences.map({ return $0.value }))
    var countCounts: [Int: Int] = Dictionary(uniqueKeysWithValues: uniqueCounts.lazy.map { ($0, 0) })
    for (_, count) in occurences {
        countCounts[count] = countCounts[count]! + 1
    }
    
    if countCounts.count == 1 {
        return "YES"
    } else if countCounts.count == 2 {
        
        // can we remove A SINGLE CHARACTER and match up?
        let tuples = countCounts.map({ return (occurences: $0, frequency: $1) })
        let first = tuples[0]
        let second = tuples[1]
        if first.frequency == 1 || second.frequency == 1 {
            if (first.occurences == 1 && first.frequency == 1) || (second.occurences == 1 && second.frequency == 1) {
                return "YES"
            } else if abs(first.occurences - second.occurences) == 1 {
                return "YES"
            }
        }
        
        return "NO"
    } else {
        return "NO"
    }
}

// all chars in string appear same number of times
// also valid if removing one char makes it valid

print(isValid(s: "aaaaabc"))
