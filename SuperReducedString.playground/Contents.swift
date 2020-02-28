import Foundation

func superReducedString(s: String) -> String {
    // get unique characters
    let uniqueCharacters = Array(Set(s))
    
    // check that we have pairs
    guard s.count != uniqueCharacters.count else {
        return s
    }
    
    var stringArray = Array(s).map({ return String($0) })
    
    var shouldContinue = true
    var i = 1
    
    while shouldContinue {
        guard stringArray.count > 1 else {
            break
        }
        guard i != stringArray.count else {
            break
        }
        
        if stringArray[i] == stringArray[i - 1] {
            stringArray.remove(at: i)
            stringArray.remove(at: i - 1)
            if i > 1 {
                i = i - 1
            }
        } else {
            i += 1
        }
    }
    
    let reducedString = stringArray.joined()
    guard reducedString.isEmpty == false else {
        return "Empty String"
    }
    
    return reducedString
}

// select a pair of adjacent character and delete them until you have a reduced string (empty is possible)


print(superReducedString(s: "aaabccddd"))
print(superReducedString(s: "baab"))
print(superReducedString(s: "aa"))
