import AoCUtilities
import Foundation

enum Card: Int, CaseIterable {
    case ace = 14
    case king = 13
    case queen = 12
    case jack = 11
    case ten = 10
    case nine = 9
    case eight = 8
    case seven = 7
    case six = 6
    case five = 5
    case four = 4
    case three = 3
    case two = 2
    
    init?(character: Character) {
        switch character {
        case "A":
            self = .ace
        case "K":
            self = .king
        case "Q":
            self = .queen
        case "J":
            self = .jack
        case "T":
            self = .ten
        case "9":
            self = .nine
        case "8":
            self = .eight
        case "7":
            self = .seven
        case "6":
            self = .six
        case "5":
            self = .five
        case "4":
            self = .four
        case "3":
            self = .three
        case "2":
            self = .two
        default:
            return nil
        }
    }
}

enum HandType: Int {
    case fiveOfAKind = 7
    case fourOfAKind = 6
    case fullHouse = 5
    case threeOfAKind = 4
    case twoPair = 3
    case onePair = 2
    case highCard = 1
    
    init(cards: [Card]) {
        var cardCounts: [Card: Int] = [:]
        
        for card in cards {
            let currentCount = cardCounts[card] ?? 0
            cardCounts[card] = currentCount + 1
        }
        
        let maxCount = cardCounts.values.max()
        
        if maxCount == 5 {
            self = .fiveOfAKind
        } else if maxCount == 4 {
            self = .fourOfAKind
        } else if maxCount == 3 {
            if cardCounts.values.contains(2) {
                self = .fullHouse
            } else {
                self = .threeOfAKind
            }
        } else if cardCounts.values.filter({ $0 == 2 }).count == 2 {
            self = .twoPair
        } else if cardCounts.values.contains(2) {
            self = .onePair
        } else {
            self = .highCard
        }
    }
}

struct Hand: Comparable {
    let cards: [Card]
    let bid: Int
    
    var handType: HandType {
        HandType(cards: cards)
    }
    
    init?(handString: String, bidString: String) {
        let cards = handString.compactMap(Card.init)
        guard cards.count == handString.count else { return nil }
        
        guard let bid = Int(bidString) else { return nil }
        
        self.cards = cards
        self.bid = bid
    }
    
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.handType == rhs.handType {
            for index in 0..<lhs.cards.count {
                let lhsCard = lhs.cards[index]
                let rhsCard = rhs.cards[index]
                
                if lhsCard == rhsCard {
                    continue
                } else {
                    return lhsCard.rawValue < rhsCard.rawValue
                }
            }
            
            fatalError("Failed to compare hands")
        } else {
            return lhs.handType.rawValue < rhs.handType.rawValue
        }
    }
}

struct Day7 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var hands: [Hand] = []
        
        for line in lines {
            let handComponents = line.components(separatedBy: .whitespaces)
            guard handComponents.count == 2 else { fatalError("Failed to parse hand components") }
            
            let handString = handComponents[0]
            let bidString = handComponents[1]
            
            guard let hand = Hand(handString: handString, bidString: bidString) else { fatalError("Failed to parse hand") }
            hands.append(hand)
        }
        
        let sortedHands = hands.sorted()
        
        var winnings = 0
        
        for (index, hand) in sortedHands.enumerated() {
            let rank = index + 1
            let winAmount = rank * hand.bid
            winnings += winAmount
        }
        
        return "\(winnings)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
}

do {
    let day7 = Day7()
    
    // Puzzle 1
    let answerExample1 = try day7.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day7.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day7.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day7.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
