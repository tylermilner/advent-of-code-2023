import AoCUtilities
import Foundation

extension Input {
    static let example1 = Input(fileName: "example1", bundle: .module)
    static let example2 = Input(fileName: "example2", bundle: .module)
    static let input = Input(fileName: "input", bundle: .module)
}

struct Day1 {
    enum WordDigit: String, CaseIterable {
        case one, two, three, four, five, six, seven, eight, nine
        
        var intValue: Int {
            // Find location of self in array and add one to get the int value
            let allCases = Self.allCases
            let index = allCases.firstIndex(of: self)!
            let distance = allCases.distance(from: allCases.startIndex, to: index)
            return distance + 1
        }
    }
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var values: [Int] = []
        
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
        let lines = try input.fileLines
        
        // Collect values for each line
        var values: [Int] = []
        
        // Words to look for
        let wordDigits = WordDigit.allCases
        
        // Parse each line
        for line in lines {
            // Find the indicies of the first/last number/word in the line
            let firstNumberIndex = line.firstIndex { $0.isNumber }
            let firstNumber = firstNumberIndex.map { line[$0] }.flatMap { Int("\($0)") }
            var firstWordIndex: String.Index?
            var firstWord: WordDigit?
            let lastNumberIndex = line.lastIndex { $0.isNumber }
            let lastNumber = lastNumberIndex.map { line[$0] }.flatMap { Int("\($0)") }
            var lastWordIndex: String.Index?
            var lastWord: WordDigit?
            
            for word in wordDigits {
                // Only available in macOS 13.0 or newer :(
//                let firstWordIndex = line.firstRange(of: word)
//                let wordRanges = line.ranges(of: word)
                
                // Find the first location of the word
                if let range = line.range(of: word.rawValue) {
                    if let index = firstWordIndex {
                        // Check if the found index comes before the current candidate
                        if range.lowerBound < index {
                            firstWordIndex = range.lowerBound
                            firstWord = word
                        }
                    } else {
                        // No word index exists yet, so set this one as the index
                        firstWordIndex = range.lowerBound
                        firstWord = word
                    }
                }
                
                // Find the last location of the word
                if let range = line.range(of: word.rawValue, options: .backwards) {
                    if let index = lastWordIndex {
                        // Check if the found index comes after the current candidate
                        if range.lowerBound > index {
                            lastWordIndex = range.lowerBound
                            lastWord = word
                        }
                    } else {
                        // No word index exists yet, so set this one as the index
                        lastWordIndex = range.lowerBound
                        lastWord = word
                    }
                }
            }
            
            // Figure out which number/word indicies are first/last
            var firstDigit: Int?
            var lastDigit: Int?
            
            if let firstNumberIndex = firstNumberIndex, let firstWordIndex = firstWordIndex {
                if firstNumberIndex < firstWordIndex {
                    firstDigit = firstNumber
                } else {
                    firstDigit = firstWord?.intValue
                }
            } else if firstNumberIndex != nil, firstWordIndex == nil {
                firstDigit = firstNumber
            } else if firstWordIndex != nil, firstNumberIndex == nil {
                firstDigit = firstWord?.intValue
            } else {
                fatalError("Unable to find first index")
            }
            
            if let lastNumberIndex = lastNumberIndex, let lastWordIndex = lastWordIndex {
                if lastNumberIndex > lastWordIndex {
                    lastDigit = lastNumber
                } else {
                    lastDigit = lastWord?.intValue
                }
            } else if lastNumberIndex != nil, lastWordIndex == nil {
                lastDigit = lastNumber
            } else if lastWordIndex != nil, lastNumberIndex == nil {
                lastDigit = lastWord?.intValue
            } else {
                fatalError("Unable to find last index")
            }
            
            // Build the value
            guard let firstDigit = firstDigit, let lastDigit = lastDigit else {
                fatalError("Unable to determine first and last digits")
            }
            
            guard let number = Int("\(firstDigit)\(lastDigit)") else {
                fatalError("Unable to generate a number from the detected digits")
            }
            values.append(number)
        }
        
        // Add up the values
        let finalValue = values.reduce(0, +)
        return String(finalValue)
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
