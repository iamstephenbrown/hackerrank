// maximum summed value where the first array is increasing every step

class Node {
    let index: Int
    var value: Int
    
    var right: Node?
    
    init(index: Int, value: Int) {
        self.index = index
        self.value = value
    }
    
    func addNode(_ node: Node) {
        if node.index > index {
            // go right
            if let rightNode = right {
                rightNode.addNode(node)
            } else {
                right = node
            }
        } else if node.index == index {
            if node.value > value, right == nil {
                value = node.value
            }
        }
    }
}

// build a tree for each node

func solve(a: [Int], w: [Int]) -> Int {
//    var nodes = [Node]()
    var best = 0
    for i in 0..<a.count {
        let rootNode = Node(index: a[i], value: w[i])
        
        for j in i..<a.count {
            // fill in our nodes
            rootNode.addNode(Node(index: a[j], value: w[j]))
        }
        
        var sum = rootNode.value
        var currentNode = rootNode
        while let rightNode = currentNode.right {
            sum += rightNode.value
            currentNode = rightNode
        }
                
        if sum > best {
            best = sum
        }
        
//        nodes.append(rootNode)
    }
        
    return best
}

//let a = [1, 2, 3, 4]
//let w = [10, 20, 30, 40]
//
//let result = solve(a: a, w: w)

let a = [1,  2,   3, 4,  1,  2,  3,  4]
let w = [10, 20, 30, 40, 15, 15, 15, 50]

let result = solve(a: a, w: w)
result == 110
