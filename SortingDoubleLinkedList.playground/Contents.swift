import Foundation

func printNode(node: DoublyLinkedListNode?) {
    var dataReader: DoublyLinkedListNode? = node
    while let node = dataReader {
        print(node.data)
        dataReader = node.next
    }
}


class DoublyLinkedListNode {
     var data: Int
     var next: DoublyLinkedListNode?
     var prev: DoublyLinkedListNode?
    
    init(nodeData: Int) {
        self.data = nodeData
    }
}


func sortedInsert(llist head: DoublyLinkedListNode?, data: Int) -> DoublyLinkedListNode? {
    // empty?
    guard let headNode = head else {
        let node = DoublyLinkedListNode(nodeData: data)
        return node
    }

    // data is the smallest
    if data < headNode.data {
        let node = DoublyLinkedListNode(nodeData: data)
        node.next = head
        headNode.prev = node
        return node
    }
    
    var prev: DoublyLinkedListNode? = nil
    var currentNode: DoublyLinkedListNode? = head
    while let current = currentNode?.next {
        currentNode = current
        prev = current.prev
        if current.data >= data {
            // insert between prev and current
            let node = DoublyLinkedListNode(nodeData: data)
            current.prev = node
            node.next = current
            node.prev = prev
            prev?.next = node
            return head
        } else if current.next == nil {
            let node = DoublyLinkedListNode(nodeData: data)
            node.prev = current
            current.next = node
            return head
        }
    }
    
    let node = DoublyLinkedListNode(nodeData: data)
    node.prev = currentNode
    currentNode?.next = node
    return head
}

var head: DoublyLinkedListNode? = nil

for i in [4,1,3,4,10,5] {
    head = sortedInsert(llist: head, data: i)
    printNode(node: head)
    print("\n")
}

printNode(node: head)
