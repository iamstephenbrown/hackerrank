
/// Sliding Window Pattern - Solve the max number of characters in a non-repeating substring of the supplied String
func solve(_ string: String) -> Int {
    guard string.isEmpty == false else {
        return 0
    }
    
    // our current window string e.g.  ABC[CDEF]GCSD
    var window = ""
    // self explanatory, the longest substring so far
    var longest = Int.min
    // hash to keep a track of the last occurence of a character so we can re-index our window
    var lastVisitedPositions: [Character: String.Index] = [:]
    
    // loop through indices in the string
    for index in string.indices {
        // get the character at the index
        let char = string[index]
        
        // if our string does not contain this character, append it to the string
        if window.contains(char) == false {
            window.append(char)
        } else {
            // a character has been repeated - set the longest and move the window along
            longest = max(longest, window.count)
            
            // get the index of the last time we visited this character
            if let visitedIndex = lastVisitedPositions[char] {
                // move the window creating a range of [old index + 1 ... currentIndex]
                let nextStartIndex = string.index(after: visitedIndex)
                let range = nextStartIndex...index
                let x = string[range]
                window = String(string[range])
            } else {
                // this shouldn't happen ...
                window = ""
            }
        }
        // update the last visited index for this character
        lastVisitedPositions[char] = index
    }
    
    // we are at the end - set longest
    longest = max(longest, window.count)
    return longest
}


//solve("ABCADAEF")
//solve("CODINGISAWESOME")
//solve("Stephen Brown")
