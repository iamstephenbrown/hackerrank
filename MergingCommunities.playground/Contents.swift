class Community {
    
    var id: [Int]
    var size: [Int]
    
    init(numberOfPeople: Int) {
        id = []
        size = []
        for i in 0..<numberOfPeople {
            id.append(i)
            size.append(1)
        }
    }
    
    func handle(_ inputCommand: [String]) {
        if inputCommand.count == 2, let community = Int(inputCommand[1]) {
            printSize(ofCommunity: community - 1)
        } else if inputCommand.count == 3, let personA = Int(inputCommand[1]), let personB = Int(inputCommand[2]) {
            merge(personA - 1, withPerson: personB - 1)
        } else {
            // bad times
        }
    }
    
    private func printSize(ofCommunity community: Int) {
        print(size[find(community)])
    }
    
    private func merge(_ personA: Int, withPerson personB: Int) {
        let i = find(personA)
        let j = find(personB)
        if i == j {
            // communitues already merged
            return
        }
        
        if size[i] < size[j] {
            // point the smaller comminity to the larger community
            id[i] = j
            // increase the size
            size[j] += size[i]
            
            // flatten
            
        } else {
            id[j] = i
            size[i] += size[j]
        }
    }
    
    private func find(_ community: Int) -> Int {
        var p = community
        while p != id[p] {
            id[p] = id[id[p]]
            p = id[p]
        }
        
        return p
    }
    
    func splash() {
        print(id)
        print(size)
    }
}

func solve() {
    guard
        let firstLineInput = readLine(strippingNewline: true)?.split(separator: " "),
        firstLineInput.count == 2,
        let numberOfPeople = Int(firstLineInput[0]),
        let numberOfQueries = Int(firstLineInput[1])
    else {
        return
    }
    
    let community = Community(numberOfPeople: numberOfPeople)
    
    for _ in 0..<numberOfQueries {
        guard let input = readLine(strippingNewline: true)?.split(separator: " ").map({ return String($0) }) else {
            continue
        }
        
        community.handle(input)
    }
}


let community = Community(numberOfPeople: 6)
community.splash()
community.handle(["Q", "1"])
community.handle(["M", "1", "2"])
community.splash()
community.handle(["Q", "2"])
community.handle(["M", "2", "3"])
community.splash()
community.handle(["Q", "3"])
community.handle(["Q", "2"])
community.handle(["M", "2", "6"])
community.splash()
