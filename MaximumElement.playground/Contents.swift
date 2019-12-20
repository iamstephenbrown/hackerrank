struct Stack {
    private var elements: [Int] = []
    
    mutating func push(_ element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int? {
        return elements.popLast()
    }
    
    func peek() -> Int? {
        return elements.max()
    }
}

enum Instruction: Int {
    case push = 1
    case pop = 2
    case print = 3
}

func solve() {
    guard let numberOfLinesString = readLine(strippingNewline: true), let numberOfLines = Int(numberOfLinesString) else {
        return
    }
    
    var stack = Stack()
    
    for _ in 0..<numberOfLines {
        guard let input = readLine(strippingNewline: true) else {
            continue
        }
        
        let elements = input.split(separator: " ").map({ return Int($0)! })
        
        guard elements.count > 0, let instruction = Instruction(rawValue: elements[0]) else {
            return
        }
        
        switch instruction {
            case .push:
                stack.push(elements[1])
                continue;
            case .pop:
                stack.pop()
                continue;
            case .print:
                guard let value = stack.peek() else {
                    continue
                }
                print(value)
                continue
        }
    }
}

solve()
