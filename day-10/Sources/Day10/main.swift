import AoCUtilities
import Foundation

class Node {
    let char: Character
    let row: Int
    let column: Int
    var next: Node?
    var previous: Node?
    var nextDistance: Int?
    var previousDistance: Int?
    
    var distance: Int {
        min(nextDistance ?? 0, previousDistance ?? 0)
    }
    
    init(char: Character, row: Int, column: Int) {
        self.char = char
        self.row = row
        self.column = column
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.char == rhs.char &&
                lhs.row == rhs.row &&
                lhs.column == rhs.column
    }
}

struct Day10 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Convert row to a character array so that we can access it using subscripts
        let rows = lines.map { [Character]($0) }
        
        // Find start
        var start: Node?
        
        for (rowIndex, row) in rows.enumerated() {
            for (columnIndex, column) in row.enumerated() {
                if column == "S" {
                    // Found start
                    start = Node(char: column, row: rowIndex, column: columnIndex)
                    break
                }
            }
        }
        
        guard let start = start else { return "" }
        
        // Connect nodes to create the loop
        var previousNodes: [Node] = []
        previousNodes.append(start)
        
        var next = nextNode(for: start, in: rows, previousNodes: previousNodes)
        start.next = next
        next?.previous = start
        
        while next != start {
            guard let current = next else { break }
            previousNodes.append(current)
            
            next = nextNode(for: current, in: rows, previousNodes: previousNodes)
            next?.previous = current
            current.next = next
        }
        
        // Set the current node as the starting node's previous node to complete the loop both directions
        start.previous = next
        
        // Calculate distances
        previousNodes = []
        previousNodes.append(start)
        
        next = start.next
        
        var maxDistance = 0
        
        while next != start {
            guard let current = next else { break }
            previousNodes.append(current)
            
            let nextDistance = calculateNextDistance(to: current, from: start)
            current.nextDistance = nextDistance
            
            let previousDistance = calculatePreviousDistance(to: current, from: start)
            current.previousDistance = previousDistance
            
            let currentDistance = current.distance
            
            if currentDistance > maxDistance {
                maxDistance = currentDistance
            }
            
            next = current.next
        }
        
        return "\(maxDistance)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
}

private extension Day10 {
    
    func calculateNextDistance(to node: Node, from startingNode: Node) -> Int {
        guard node != startingNode else { return 0 }
        
        var count = 1
        
        var nextNode = startingNode.next
        
        while nextNode != node {
            nextNode = nextNode?.next
            count += 1
        }
        
        return count
    }
    
    func calculatePreviousDistance(to node: Node, from startingNode: Node) -> Int {
        guard node != startingNode else { return 0 }
        
        var count = 1
        
        var previousNode = startingNode.previous
        
        while previousNode != node {
            previousNode = previousNode?.previous
            count += 1
        }
        
        return count
    }
    
    func nextNode(for node: Node, in rows: [[Character]], previousNodes: [Node]) -> Node? {
        if node.char == "S" {
            // Check north
            if let northNode = northNode(for: node, in: rows) {
                switch northNode.char {
                case "|", "7", "F":
                    return northNode
                default:
                    break
                }
            }
            
            // Check east
            if let eastNode = eastNode(for: node, in: rows) {
                switch eastNode.char {
                case "-", "7", "J":
                    return eastNode
                default:
                    break
                }
            }
            
            // Check south
            if let southNode = southNode(for: node, in: rows) {
                switch southNode.char {
                case "|", "L", "J":
                    return southNode
                default:
                    break
                }
            }
            
            // Check west
            if let westNode = westNode(for: node, in: rows) {
                switch westNode.char {
                case "-", "L", "F":
                    return westNode
                default:
                    break
                }
            }
            
            return nil
        } else if node.char == "|" {
            // Check north
            if let northNode = northNode(for: node, in: rows), northNode.char == "S" || !previousNodes.contains(where: { $0 == northNode }) {
                switch northNode.char {
                case "S", "|", "F", "7":
                    return northNode
                default:
                    break
                }
            }
            
            // Check south
            if let southNode = southNode(for: node, in: rows), southNode.char == "S" || !previousNodes.contains(where: { $0 == southNode }) {
                switch southNode.char {
                case "S", "|", "L", "J":
                    return southNode
                default:
                    break
                }
            }
            
            return nil
        } else if node.char == "-" {
            // Check east
            if let eastNode = eastNode(for: node, in: rows), eastNode.char == "S" || !previousNodes.contains(where: { $0 == eastNode }) {
                switch eastNode.char {
                case "S", "-", "7", "J":
                    return eastNode
                default:
                    break
                }
            }
            
            // Check west
            if let westNode = westNode(for: node, in: rows), westNode.char == "S" || !previousNodes.contains(where: { $0 == westNode }) {
                switch westNode.char {
                case "S", "-", "L", "F":
                    return westNode
                default:
                    break
                }
            }
            
            return nil
        } else if node.char == "L" {
            // Check north
            if let northNode = northNode(for: node, in: rows), northNode.char == "S" || !previousNodes.contains(where: { $0 == northNode }) {
                switch northNode.char {
                case "S", "|", "7", "F":
                    return northNode
                default:
                    break
                }
            }
            
            // Check east
            if let eastNode = eastNode(for: node, in: rows), eastNode.char == "S" || !previousNodes.contains(where: { $0 == eastNode }) {
                switch eastNode.char {
                case "S", "-", "7", "J":
                    return eastNode
                default:
                    break
                }
            }
            
            return nil
        } else if node.char == "J" {
            // Check north
            if let northNode = northNode(for: node, in: rows), northNode.char == "S" || !previousNodes.contains(where: { $0 == northNode }) {
                switch northNode.char {
                case "S", "|", "7", "F":
                    return northNode
                default:
                    break
                }
            }
            
            // Check west
            if let westNode = westNode(for: node, in: rows), westNode.char == "S" || !previousNodes.contains(where: { $0 == westNode }) {
                switch westNode.char {
                case "S", "-", "L", "F":
                    return westNode
                default:
                    break
                }
            }
            
            return nil
        } else if node.char == "7" {
            // Check south
            if let southNode = southNode(for: node, in: rows), southNode.char == "S" || !previousNodes.contains(where: { $0 == southNode }) {
                switch southNode.char {
                case "S", "|", "L", "J":
                    return southNode
                default:
                    break
                }
            }
            
            // Check west
            if let westNode = westNode(for: node, in: rows), westNode.char == "S" || !previousNodes.contains(where: { $0 == westNode }) {
                switch westNode.char {
                case "S", "-", "L", "F":
                    return westNode
                default:
                    break
                }
            }
            
            return nil
        } else if node.char == "F" {
            // Check east
            if let eastNode = eastNode(for: node, in: rows), eastNode.char == "S" || !previousNodes.contains(where: { $0 == eastNode }) {
                switch eastNode.char {
                case "S", "-", "7", "J":
                    return eastNode
                default:
                    break
                }
            }
            
            // Check south
            if let southNode = southNode(for: node, in: rows), southNode.char == "S" || !previousNodes.contains(where: { $0 == southNode }) {
                switch southNode.char {
                case "S", "|", "L", "J":
                    return southNode
                default:
                    break
                }
            }
            
            return nil
        } else {
            return nil
        }
    }
    
    func northNode(for node: Node, in rows: [[Character]]) -> Node? {
        let northRow = node.row - 1
        let northColumn = node.column
        
        guard northRow >= 0 else { return nil }
        
        let northChar = rows[northRow][northColumn]
        return Node(char: northChar, row: northRow, column: northColumn)
    }
    
    func eastNode(for node: Node, in rows: [[Character]]) -> Node? {
        let eastRow = node.row
        let eastColumn = node.column + 1
        
        guard eastColumn < rows[eastRow].count else { return nil }
        
        let eastChar = rows[eastRow][eastColumn]
        return Node(char: eastChar, row: eastRow, column: eastColumn)
    }
    
    func southNode(for node: Node, in rows: [[Character]]) -> Node? {
        let southRow = node.row + 1
        let southColumn = node.column
        
        guard southRow < rows.count else { return nil }
        
        let southChar = rows[southRow][southColumn]
        return Node(char: southChar, row: southRow, column: southColumn)
    }
    
    func westNode(for node: Node, in rows: [[Character]]) -> Node? {
        let westRow = node.row
        let westColumn = node.column - 1
        
        guard westColumn >= 0 else { return nil }
        
        let westChar = rows[westRow][westColumn]
        return Node(char: westChar, row: westRow, column: westColumn)
    }
}

do {
    let day10 = Day10()
    
    // Puzzle 1
    let answerExample1_1 = try day10.puzzleOneOutput(for: .example1_1)
    print("Example 1_1: \(answerExample1_1)")
    
    let answerExample1_2 = try day10.puzzleOneOutput(for: .example1_2)
    print("Example 1_1: \(answerExample1_2)")
    
    let answerPuzzle1 = try day10.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day10.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day10.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
