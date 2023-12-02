import AoCUtilities
import Foundation

extension Input {
    static let example1 = Input(fileName: "example1", bundle: .module)
    static let example2 = Input(fileName: "example2", bundle: .module)
    static let input = Input(fileName: "input", bundle: .module)
}

struct Day1 {
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var values = [Int]()
        
        for line in lines {
            guard let firstNumber = (line.first { $0.isNumber }) else {
                fatalError("First number not found in line: '\(line)'")
            }
            guard let lastNumber = (line.last { $0.isNumber }) else {
                fatalError("Last number not found in line: '\(line)'")
            }
            
            let numberString = "\(firstNumber)\(lastNumber)"
            guard let number = Int(numberString) else {
                fatalError("Unable to create number from '\(numberString)'")
            }
            
            values.append(number)
        }
        
        let finalValue = values.reduce(0, +)
        
        return String(finalValue)
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        return ""
    }
}

do {
    let day1 = Day1()
    
    // Puzzle 1
    let answerExample1 = try day1.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day1.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day1.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day1.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
