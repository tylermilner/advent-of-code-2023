import AoCUtilities
import Foundation

enum MapInstruction {
    case left, right
    
    init(character: Character) {
        switch character {
        case "L":
            self = .left
        case "R":
            self = .right
        default:
            fatalError("Unsupported direction")
        }
    }
}

class MapNode {
    let label: String
    var leftNode: MapNode?
    var rightNode: MapNode?
    
    init(label: String, leftNode: MapNode? = nil, rightNode: MapNode? = nil) {
        self.label = label
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    
    init(line: String) {
        let components = line.components(separatedBy: "=").map { $0.trimmingCharacters(in: .whitespaces) }
        guard components.count == 2 else { fatalError("Failed to parse node components") }
        
        self.label = components[0]
        
        let nodeComponents = components[1].components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "") }
        guard nodeComponents.count == 2 else { fatalError("Failed to parse node components") }
        
        self.leftNode = MapNode(label: nodeComponents[0])
        self.rightNode = MapNode(label: nodeComponents[1])
    }
    
    func nextNode(for instruction: MapInstruction) -> MapNode? {
        switch instruction {
        case .left:
            return leftNode
        case .right:
            return rightNode
        }
    }
}

struct Map {
    let instructions: [MapInstruction]
    let nodes: [MapNode]
}

struct Day8 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var instructions: [MapInstruction] = []
        var nodes: [MapNode] = []
        
        for line in lines {
            // Parse instructions on first line
            if instructions.isEmpty {
                instructions = line.map(MapInstruction.init)
            } else if !line.isEmpty {
                // Rest of the lines are nodes
                let node = MapNode(line: line)
                nodes.append(node)
            }
        }
        
        // Hook up the nodes
        for node in nodes {
            guard let leftNodeLabel = node.leftNode?.label else { continue }
            let mainLeftNode = nodes.first { $0.label == leftNodeLabel }
            node.leftNode = mainLeftNode
            
            guard let rightNodeLabel = node.rightNode?.label else { continue }
            let mainRightNode = nodes.first { $0.label == rightNodeLabel }
            node.rightNode = mainRightNode
        }
        
//        print(nodes.map { "\($0.label): L: \($0.leftNode!.label) R: \($0.rightNode!.label)"})
        
        // Bail early if we parsed an empty file
        guard !instructions.isEmpty && !nodes.isEmpty else { return "" }
        
        // Traverse the map, starting at AAA
        let startingNode = nodes.first { $0.label == "AAA" }
        var nextInstructionIndex = 0
        var nextInstruction = instructions[nextInstructionIndex]
        var nextNode = startingNode?.nextNode(for: nextInstruction)
        var stepCount = 0
        
        while nextNode != nil {
            stepCount += 1
            
            if nextNode?.label == "ZZZ" {
                nextNode = nil
            } else {
                nextInstructionIndex = nextInstructionIndex == instructions.count - 1 ? 0 : nextInstructionIndex + 1
                nextInstruction = instructions[nextInstructionIndex]
                nextNode = nextNode?.nextNode(for: nextInstruction)
            }
        }
        
        return "\(stepCount)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
}

do {
    let day8 = Day8()
    
    // Puzzle 1
    let answerExample1_1 = try day8.puzzleOneOutput(for: .example1_1)
    print("Example 1_1: \(answerExample1_1)")
    
    let answerExample1_2 = try day8.puzzleOneOutput(for: .example1_2)
    print("Example 1_2: \(answerExample1_2)")
    
    let answerPuzzle1 = try day8.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day8.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day8.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
