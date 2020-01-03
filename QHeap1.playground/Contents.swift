enum Instruction: Int {
    case add = 1
    case remove = 2
    case print = 3
}

struct MinHeap {
    private var values: [Int]
    private var lastIndex: Int {
        return values.count - 1
    }
    
    init(values: [Int]) {
        self.values = values
    }
    
    mutating func add(_ value: Int) {
        values.append(value)
        sortUp(fromIndex: lastIndex)
    }
    
    mutating func remove(_ value: Int) {
        guard let index = values.firstIndex(of: value) else {
            return
        }
        
        if index != lastIndex {
            values[index] = values[lastIndex]
            sortDown(fromIndex: index)
            sortUp(fromIndex: index)
        }
        values.removeLast()
    }
    
    func printMinimum() {
        print(values[0])
    }
    
    // traversal
    private func leftChildIndex(ofIndex index: Int) -> Int{
        return (2 * index) + 1
    }
    
    private func rightChildIndex(ofIndex index: Int) -> Int {
        return (2 * index) + 2
    }
    
    private func parentIndex(ofIndex index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // ordering
    mutating private func sortUp(fromIndex index: Int) {
        var childIndex = index
        let child = values[index]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        // while the current "child" node is smaller than it's parent, sort it up the heap
        while childIndex > 0, child < values[parentIndex] {
            values[childIndex] = values[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        values[childIndex] = child
    }
    
    mutating func sortDown(fromIndex index: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = self.rightChildIndex(ofIndex: index)
        
        // find the smallest child of the supplied index
        var first = index
        if leftChildIndex < lastIndex, values[leftChildIndex] < values[first] {
            first = leftChildIndex
        }
        if rightChildIndex < lastIndex, values[rightChildIndex] < values[first] {
            first = rightChildIndex
        }
        
        guard first != index else {
            return
        }
        
        // swap the smallest child, with the parent and continue
        values.swapAt(index, first)
        sortDown(fromIndex: first)
    }
}

func solve() {
    guard let numberOfLinesString = readLine(strippingNewline: true), let numberOfLines = Int(numberOfLinesString) else {
        return
    }

    var heap = MinHeap(values: [])
    
    for _ in 0..<numberOfLines {
        guard let input = readLine(strippingNewline: true) else {
            continue
        }
        
        let elements = input.split(separator: " ").map({ return Int($0)! })
        
        guard elements.count > 0, let instruction = Instruction(rawValue: elements[0]) else {
            return
        }
        
        switch instruction {
        case .add:
            heap.add(elements[1])
            break
        case .remove:
            heap.remove(elements[1])
            break
        case .print:
            heap.printMinimum()
            break
        }
    }
}

solve()

// Example
var heap = MinHeap(values: [])

heap.add(4)
heap.add(9)
heap.printMinimum()
heap.remove(4)
heap.printMinimum()
