import AoCUtilities
import Foundation

struct PartNumber {
    var components: [PartNumberComponent]
    var isAdjacentToSymbol = false
    
    var value: Int {
        let stringValue = String(components.map(\.number))
        return Int(stringValue)!
    }
    
    func hasComponentLocated(at row: Int, column: Int) -> Bool {
        for component in components {
            if component.isLocated(at: row, column: column) {
                return true
            }
        }
        
        return false
    }
}

struct PartNumberComponent {
    let number: Character
    let row: Int
    let column: Int
    
    func isLocated(at row: Int, column: Int) -> Bool {
        return self.row == row && self.column == column
    }
}

//struct Symbol {
//    let symbol: Character
//    let rowIndex: Int
//    let columnIndex: Int
//    
//    var possiblePartNumberCoordinates: [(Int, Int)] {
//        let previousRow = rowIndex - 1
//        let nextRow = rowIndex + 1
//        let previousColumn = columnIndex - 1
//        let nextColumn = columnIndex + 1
//        
//        print("Possible part number coordinates starting at row \(previousRow) to row \(nextRow) and column \(previousColumn) to column \(nextColumn)")
//        
//        var coordinates: [(Int, Int)] = []
//        
//        for rowIndex in previousRow...nextRow {
//            for columnIndex in previousColumn...nextColumn {
//                let coordinate = (rowIndex, columnIndex)
//                
//                // Ignore coordinate for self
//                guard coordinate != (self.rowIndex, self.columnIndex) else { continue }
//                
//                coordinates.append((rowIndex, columnIndex))
//            }
//        }
//        
//        return coordinates
//    }
//}

struct Day3 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Convert row to a character array so that we can access it using subscripts
        let rows = lines.map { [Character]($0) }
        
        // Get the list of symbols, which will include their adjacent positions, so that we will know which part numbers need to be included
//        var symbols: [Symbol] = []
//        
//        for rowIndex in 0..<rows.count {
//            let row = rows[rowIndex]
//            
//            for columnIndex in 0..<row.count {
//                let char = row[columnIndex]
//                print("Checking '\(char)'...")
//                
//                if !char.isNumber && char != "." {
//                    let symbol = Symbol(symbol: char, rowIndex: rowIndex, columnIndex: columnIndex)
//                    symbols.append(symbol)
//                    
//                    print("Found symbol: '\(char)' at (\(rowIndex),\(columnIndex))")
//                    print("Possible part number coordinates: \(symbol.possiblePartNumberCoordinates)")
//                }
//            }
//        }
        
        // Get the list of potential part numbers
        var partNumbers: [PartNumber] = []
        
        for rowIndex in 0..<rows.count {
            var rowPartNumbers: [PartNumber] = []
            
            let columns = rows[rowIndex]
            
            var workingNumber: [PartNumberComponent] = []
            
            // Check each character in the row
            for columnIndex in 0..<columns.count {
                let char = columns[columnIndex]
                
                if char.isNumber {
                    let component = PartNumberComponent(number: char, row: rowIndex, column: columnIndex)
                    workingNumber.append(component)
                    
                    // Check if we're at the end of a row and create the PartNumber immediately
                    if columnIndex == columns.count - 1 {
                        let number = PartNumber(components: workingNumber)
                        rowPartNumbers.append(number)
                        
                        workingNumber = []
                    }
                } else {
                    // Check if we were previously processing a number
                    if !workingNumber.isEmpty {
                        let number = PartNumber(components: workingNumber)
                        rowPartNumbers.append(number)
                        
                        workingNumber = []
                    }
                }
            }
            
            partNumbers.append(contentsOf: rowPartNumbers)
        }
        
        // Figure out which part numbers are adjacent to a symbol
        for index in 0..<partNumbers.count {
            let partNumber = partNumbers[index]
            
            for component in partNumber.components {
                let previousRow = component.row - 1
                let nextRow = component.row + 1
                let previousColumn = component.column - 1
                let nextColumn = component.column + 1
                
                for rowIndex in previousRow...nextRow {
                    for columnIndex in previousColumn...nextColumn {
                        guard rowIndex >= 0 && rowIndex < rows.count else { continue }
                        guard columnIndex >= 0 && columnIndex < rows[rowIndex].count else { continue }
                        
                        let char = rows[rowIndex][columnIndex]
                        
                        if !char.isNumber && char != "." {
                            partNumbers[index].isAdjacentToSymbol = true
                        }
                    }
                }
            }
        }
        
        let adjacentPartNumbers = partNumbers.filter { $0.isAdjacentToSymbol }
        
        let sum = adjacentPartNumbers.map(\.value).reduce(0, +)
        return "\(sum)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
}

do {
    let day3 = Day3()
    
    // Puzzle 1
    let answerExample1 = try day3.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day3.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day3.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day3.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
