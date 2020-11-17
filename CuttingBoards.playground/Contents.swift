import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

func boardCutting(cost_y: [Int], cost_x: [Int]) -> Int {
    let horizontalSize = cost_y.count + 1
    let verticalSize = cost_x.count + 1
    
    print("Board Size \(horizontalSize) x \(verticalSize)")
    
    var totalCost = 0
    var horizontalSegments = 1
    var verticalSegments = 1
    
    // We want to get the more expensive cuts out of the way first, so that we are multiplying smaller numbers
    var orderedHorizontalCuts = cost_y.sorted(by: { $0 > $1 })
    var orderedVerticalCuts = cost_x.sorted(by: { $0 > $1 })
    
    while !orderedHorizontalCuts.isEmpty || !orderedVerticalCuts.isEmpty {
        print("-----")
        if let verticalCut = orderedVerticalCuts.first, let horizontalCut = orderedHorizontalCuts.first {
            if verticalCut > horizontalCut {
                print("D Cutting Vertically through \(horizontalSegments) segments with cost \(verticalCut)")
                totalCost += (verticalCut * horizontalSegments)
                orderedVerticalCuts.remove(at: 0)
                verticalSegments += 1
            } else {
                print("C Cutting Horizontally through \(verticalSegments) segments with cost \(horizontalCut)")
                totalCost += (horizontalCut * verticalSegments)
                orderedHorizontalCuts.remove(at: 0)
                horizontalSegments += 1
            }
        } else if let verticalCut = orderedVerticalCuts.first {
            print("B Cutting Vertically through \(horizontalSegments) segments with cost \(verticalCut)")
            totalCost += (verticalCut * horizontalSegments)
            orderedVerticalCuts.remove(at: 0)
            verticalSegments += 1
        } else if let horizontalCut = orderedHorizontalCuts.first {
            print("A Cutting Horizontally through \(verticalSegments) segments with cost \(horizontalCut)")
            totalCost += (horizontalCut * verticalSegments)
            orderedHorizontalCuts.remove(at: 0)
            horizontalSegments += 1
        }
        print("Total Cost \(totalCost)")
    }
    
    return totalCost % (10 ^^ 9 + 7)
}

//func


// Alice gives bob a board of 1x1 squares
// Bob must make horizontal and vertical cuts to break it down


// Example
// 2x2 board

// X X
// X X

// costs
// cost_x [vertical]:       2
// cost_y [horizontal]:     1


let x = boardCutting(cost_y: [2], cost_x: [1])

print("   ")
print(" ---- ")
print("   ")

let y = boardCutting(cost_y: [2, 1, 3, 1, 4], cost_x: [4, 1, 2])
