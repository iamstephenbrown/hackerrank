import Foundation

func maxRegion(grid: [[Int]]) -> Int {
    var maxRegion = 0
    var mutableGrid = grid
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            maxRegion = max(maxRegion, countCells(inGrid: &mutableGrid, i: i, j: j))
        }

    }

    return maxRegion
}

func countCells(inGrid grid: inout [[Int]], i: Int, j: Int) -> Int {
    guard i >= 0, j >= 0, i < grid.count, j < grid[i].count, grid[i][j] == 1 else {
        return 0
    }
    var count = 1
    grid[i][j] = 0
    count += countCells(inGrid: &grid, i: i + 1, j: j)
    count += countCells(inGrid: &grid, i: i - 1, j: j)
    count += countCells(inGrid: &grid, i: i, j: j + 1)
    count += countCells(inGrid: &grid, i: i, j: j - 1)
    count += countCells(inGrid: &grid, i: i + 1, j: j + 1)
    count += countCells(inGrid: &grid, i: i - 1, j: j - 1)
    count += countCells(inGrid: &grid, i: i - 1, j: j + 1)
    count += countCells(inGrid: &grid, i: i + 1, j: j - 1)
    return count
}

let testArray = [
    [1, 1, 0, 0],
    [0, 1, 1, 0],
    [0, 0, 1, 0],
    [1, 0, 0, 0]
]

let simpleTest = [
    [1, 0, 0],
    [1, 0, 0],
    [1, 0, 0]
]

let maxVal = maxRegion(grid: testArray)
print(maxVal)
