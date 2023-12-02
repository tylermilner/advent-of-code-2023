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
            
            return ""
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

let day1 = Day1()
let answerExample = day1.output(for: .example)
print("Example: \(answerExample)")

//let answerPuzzle1 = day1.output(for: .puzzle1)
//print("Puzzle 1: \(answerExample)")

//let answerPuzzle2 = day1.output(for: .puzzle2)
//print("Puzzle 2: \(answerExample)")
