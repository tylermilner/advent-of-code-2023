import AoCUtilities
import Foundation

struct ValueHistory {
    let values: [Int]
    
    func extrapolateNextValue() -> Int {
        return extrapolateNextValue(from: values)
    }
    
    func extrapolatePreviousValue() -> Int {
        return extrapolatePreviousValue(from: values)
    }
    
    private func extrapolateNextValue(from values: [Int]) -> Int {
        let lastValue = values[values.count - 1]
        
        if values.allSatisfy({ $0 == 0 }) {
            return 0
        } else {
            let nextSequence = nextSequence(for: values)
            return lastValue + extrapolateNextValue(from: nextSequence)
        }
    }
    
    private func nextSequence(for values: [Int]) -> [Int] {
        var nextValues: [Int] = []
        
        for currentIndex in 0..<values.count {
            let nextIndex = currentIndex + 1
            
            if nextIndex < values.count {
                let difference = values[nextIndex] - values[currentIndex]
                nextValues.append(difference)
            }
        }
        
        return nextValues
    }
    
    private func extrapolatePreviousValue(from values: [Int]) -> Int {
        let firstValue = values[0]
        
        if values.allSatisfy({ $0 == 0 }) {
            return 0
        } else {
            let nextSequence = nextSequence(for: values)
            return firstValue - extrapolatePreviousValue(from: nextSequence)
        }
    }
}

struct Day9 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var valueHistories: [ValueHistory] = []
        
        for line in lines {
            let values = line.components(separatedBy: .whitespaces).compactMap(Int.init)
            let valueHistory = ValueHistory(values: values)
            valueHistories.append(valueHistory)
        }
        
        var sum = 0
        
        for valueHistory in valueHistories {
            let nextValue = valueHistory.extrapolateNextValue()
            sum += nextValue
        }
        
        return "\(sum)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var valueHistories: [ValueHistory] = []
        
        for line in lines {
            let values = line.components(separatedBy: .whitespaces).compactMap(Int.init)
            let valueHistory = ValueHistory(values: values)
            valueHistories.append(valueHistory)
        }
        
        var sum = 0
        
        for valueHistory in valueHistories {
            let previousValue = valueHistory.extrapolatePreviousValue()
            sum += previousValue
        }
        
        return "\(sum)"
    }
}

do {
    let day9 = Day9()
    
    // Puzzle 1
    let answerExample1 = try day9.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day9.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day9.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day9.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
