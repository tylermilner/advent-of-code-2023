import AoCUtilities
import Foundation

struct Card {
    let number: Int
    let winningNumbers: [Int]
    let numbers: [Int]
    
    var points: Int {
        var points = 0
        
        for number in numbers {
            if winningNumbers.contains(number) {
                points += 1
            }
        }
        
        return Int(pow(Double(2), Double(points - 1)))
    }
}

struct Day4 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Parse cards from the input
        var cards: [Card] = []
        
        for line in lines {
            let cardComponents = line.components(separatedBy: ":")
            guard cardComponents.count == 2 else { fatalError("Unable to determine card components") }
            
            let cardNumberComponents = cardComponents[0].components(separatedBy: " ")
            guard let cardNumber = Int(cardNumberComponents.last!) else { fatalError("Unable to parse card number") }
            
            let numberComponents = cardComponents[1].components(separatedBy: "|")
            guard numberComponents.count == 2 else { fatalError("Unable to determine number components") }
            
            let winningNumbers = numberComponents[0].components(separatedBy: " ").compactMap(Int.init)
            let cardNumbers = numberComponents[1].components(separatedBy: " ").compactMap(Int.init)
            
            let card = Card(number: cardNumber, winningNumbers: winningNumbers, numbers: cardNumbers)
            cards.append(card)
        }
        
        // Calculate points
        let sum = cards.map(\.points).reduce(0, +)
        
        return "\(sum)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
}

do {
    let day4 = Day4()
    
    // Puzzle 1
    let answerExample1 = try day4.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day4.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day4.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day4.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
