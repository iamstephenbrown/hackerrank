import Foundation
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
//
//func minimumMoves(grid: [String], startX: Int, startY: Int, goalX: Int, goalY: Int) -> Int {
//    var multiDimensionalGrid: [[String]] = []
//    for line in grid {
//        var lineArray = [String]()
//        for index in line.indices {
//            let char = String(line[index])
//            lineArray.append(char)
//        }
//        multiDimensionalGrid.append(lineArray)
//    }
//
//    // Let us move!
//    let start = Point(x: startX, y: startY)
//    let goal = Point(x: goalX, y: goalY)
//
//    var minSteps = Int.max
//    var leftGrid = multiDimensionalGrid
//    if let leftSteps = moveAlongGrid(&leftGrid, to: Point(x: start.x - 1, y: start.y), goal: goal, positions: [start]) {
//        let numSteps = numberOfTurns(in: leftSteps)
//        if numSteps < minSteps {
//            minSteps = numSteps
//        }
//    }
//    var rightGrid = multiDimensionalGrid
//    if let rightSteps = moveAlongGrid(&rightGrid, to: Point(x: start.x + 1, y: start.y), goal: goal, positions: [start]) {
//        let numSteps = numberOfTurns(in: rightSteps)
//        if numSteps < minSteps {
//            minSteps = numSteps
//        }
//    }
//    var upGrid = multiDimensionalGrid
//    if let upSteps = moveAlongGrid(&upGrid, to: Point(x: start.x, y: start.y - 1), goal: goal, positions: [start]) {
//        let numSteps = numberOfTurns(in: upSteps)
//        if numSteps < minSteps {
//            minSteps = numSteps
//        }
//    }
//    var downGrid = multiDimensionalGrid
//    if let downSteps = moveAlongGrid(&downGrid, to: Point(x: start.x, y: start.y + 1), goal: goal, positions: [start]) {
//        let numSteps = numberOfTurns(in: downSteps)
//        if numSteps < minSteps {
//            minSteps = numSteps
//        }
//    }
//
//    return minSteps
//}
//
//func moveAlongGrid(_ grid: inout [[String]], to: Point, goal: Point, positions: [Point] = []) -> [Point]? {
//    guard
//        to.x >= 0,
//        to.y >= 0,
//        to.x < grid.count,
//        to.y < grid.count,
//        positions.contains(where: { $0.x == to.x && $0.y == to.y }) == false,
//        let value = grid[safe: to.x]?[safe: to.y],
//        value == ".",
//        positions.count < (grid.count * grid.count)
//    else {
//        // invalid move!
//        return nil
//    }
//    print("\(to.x), \(to.y)")
//
//    if to.x == goal.x && to.y == goal.y {
//        let x = positions + [to]
//        return x
//    }
//
//    grid[to.x][to.y] = "V"
//
//    let newPositions = positions + [to]
//    var minTurns = Int.max
//    var minSteps = [Point]()
//
//    if let up = moveAlongGrid(&grid, to: Point(x: to.x, y: to.y - 1), goal: goal, positions: newPositions) {
////        return up
//        let numTurns = numberOfTurns(in: up)
//        if numTurns < minTurns {
//            minTurns = numTurns
//            minSteps = up
//        }
//    }
//    if let left = moveAlongGrid(&grid, to: Point(x: to.x - 1, y: to.y), goal: goal, positions: newPositions) {
////        return left
//                let numTurns = numberOfTurns(in: left)
//        if numTurns < minTurns {
//            minTurns = numTurns
//            minSteps = left
//        }
//    }
//    if let right = moveAlongGrid(&grid, to: Point(x: to.x + 1, y: to.y), goal: goal, positions: newPositions) {
////        return right
//        let numTurns = numberOfTurns(in: right)
//        if numTurns < minTurns {
//            minTurns = numTurns
//            minSteps = right
//        }
//    }
//    if let down = moveAlongGrid(&grid, to: Point(x: to.x, y: to.y + 1), goal: goal, positions: newPositions) {
////        return down
//        let numTurns = numberOfTurns(in: down)
//        if numTurns < minTurns {
//            minTurns = numTurns
//            minSteps = down
//        }
//    }
//
//    return nil
//}
//
//// 0,0
//// 0,1
//// 0,2
//// 1,2
//// 2,2
//// 2,1
//// 2,0
//
//private func numberOfTurns(in positions: [Point]) -> Int {
//    var numTurns = 1
//    var previousPosition: Point? = nil
//    var previousDirection: Point? = nil
//
//    guard positions.count > 0 else {
//        return Int.max
//    }
//
//    print("Start")
//    var turns = "(0,0)"
//    var steps = ""
//    for position in positions {
//        if let previous = previousPosition {
//
//            let direction = Point(x: position.x - previous.x, y: position.y - previous.y)
//
//            if let previousDir = previousDirection {
//                // same direction?
//                if previousDir.x != direction.x && previousDir.y != direction.y {
//                    numTurns += 1
//                    turns += " (\(previous.x),\(previous.y))"
//                }
//            }
//
//            previousDirection = direction
//        }
//        steps += "(\(position.x),\(position.y)) "
//        previousPosition = position
//    }
//    print("Num: \(numTurns) from Steps: \(positions.count) with \(turns)")
//    print("STEPS: \(steps)")
//    return numTurns
//}

func gridFromArray(_ grid: [String]) -> [[String]] {
    var multiDimensionalGrid: [[String]] = []
    for line in grid {
        var lineArray = [String]()
        for index in line.indices {
            let char = String(line[index])
            lineArray.append(char)
        }
        multiDimensionalGrid.append(lineArray)
    }
    return multiDimensionalGrid
}

struct Point {
    let x: Int, y: Int
}

struct Queue<T> {
    var list = [T]()
    var isEmpty: Bool {
         return list.isEmpty
    }
    mutating func enqueue(_ element: T) {
          list.append(element)
    }
    mutating func dequeue() -> T? {
         if !list.isEmpty {
           return list.removeFirst()
         } else {
           return nil
         }
    }
    func peek() -> T? {
         if !list.isEmpty {
              return list[0]
         } else {
           return nil
         }
    }
}

var queue = Queue<Point>()

func minimumMoves(grid: [String], startX: Int, startY: Int, goalX: Int, goalY: Int) -> Int {
    var matrix = gridFromArray(grid)
    
    var q = queue.dequeue()
    
    
    return 0
}




let grid = [
    ".X.",
    ".X.",
    "..."
]



// 3
minimumMoves(grid: grid, startX: 0, startY: 0, goalX: 0, goalY: 2)

print("-------------")

let gridTwo = [
    ".X..",
    ".X..",
    "..X.",
    "....",
]

// 4
minimumMoves(grid: gridTwo, startX: 0, startY: 0, goalX: 0, goalY: 2)

print("-------------")

let gridThree = [
    ".X....",
    ".X....",
    "..X...",
    "......",
    "......",
    "......",
]

minimumMoves(grid: gridThree, startX: 0, startY: 0, goalX: 0, goalY: 2)
