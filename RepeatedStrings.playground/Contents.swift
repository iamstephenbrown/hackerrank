// https://www.hackerrank.com/challenges/repeated-string/problem

// Dumb Solution
func repeatedStringDumb(s: String, n: Int) -> Int {
    let string = buildString(repeating: s, numberOfCharacters: n)
    
    // get number of a
    return string.compactMap({ return $0 == "a" ? "a" : nil }).count
}

func buildString(repeating: String, numberOfCharacters: Int) -> String {
    let numberOfTimesToRepeat = (numberOfCharacters / repeating.count) + 1
    let numberOfExtraCharacters = (repeating.count * numberOfTimesToRepeat) - numberOfCharacters
    let fullString = String(repeating: repeating, count: numberOfTimesToRepeat)
    
    guard numberOfExtraCharacters > 0 else {
        return fullString
    }
    
    return String(fullString.dropLast(numberOfExtraCharacters))
}

print(repeatedStringDumb(s: "aba", n: 10)) // 7

// Smart Solution
func repeatedString(s: String, n: Int) -> Int {
    // get the number of times the string will occur when repeated
    guard n >= s.count else {
        return occurences(in: s, numToDrop: s.count - n)
    }
    
    let numTimesToRepeat = (n / s.count)
    let numInSingle = s.compactMap({ return $0 == "a" ? 1 : nil }).count
    
    let remainder = n % numTimesToRepeat
    let result = numInSingle * numTimesToRepeat
    
    guard remainder != 0 else {
        return result
    }
    
    // we have a remainder here.
    let numInExtra = occurences(in: s, numToDrop: s.count - remainder)
    return result + numInExtra
}

func occurences(in s: String, numToDrop: Int) -> Int {
    return String(s.dropLast(numToDrop)).compactMap({ return $0 == "a" ? 1 : nil }).count
}

print(repeatedString(s: "aba", n: 10)) // 7
