import AoCUtilities
import Foundation

extension Input {
    static let example = Input(fileName: "example", bundle: .module)
    static let puzzle1 = Input(fileName: "puzzle1", bundle: .module)
    static let puzzle2 = Input(fileName: "puzzle2", bundle: .module)
}

struct Day1 {
    func output(for input: Input) -> String {
        do {
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
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

let day1 = Day1()
let answerExample = day1.output(for: .example)
print("Example: \(answerExample)")

let answerPuzzle1 = day1.output(for: .puzzle1)
print("Puzzle 1: \(answerPuzzle1)")

//let answerPuzzle2 = day1.output(for: .puzzle2)
//print("Puzzle 2: \(answerPuzzle2)")
