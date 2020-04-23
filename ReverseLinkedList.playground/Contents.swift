import Foundation

class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    init(data: Int) {
        self.data = data
    }
}

func reverse(head: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var current = head
    var previous: SinglyLinkedListNode?
    var reversed: SinglyLinkedListNode?
    while current != nil {
        if let data = current?.data {
            let newReversed = SinglyLinkedListNode(data: data)
            newReversed.next = reversed
            reversed = newReversed
        }
        previous = current
        current = current?.next
    }

    return reversed
}

let a = SinglyLinkedListNode(data: 0)
let b = SinglyLinkedListNode(data: 1)
let c = SinglyLinkedListNode(data: 2)
let d = SinglyLinkedListNode(data: 3)

a.next = b
b.next = c
c.next = d

var x = reverse(head: a)
while x != nil {
    print(x?.data)
    x = x?.next
}
