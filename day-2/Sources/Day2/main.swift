import AoCUtilities
import Foundation

struct Game {
    let number: Int
    let handfuls: [Cubes]
}

enum CubeType: String {
    case red, green, blue
}

struct Cubes {
    var red: Int = 0
    var green: Int = 0
    var blue: Int = 0
    
    static let bag = Cubes(red: 12, green: 13, blue: 14)
}

extension String {
    func trimmedPrefix(_ prefix: Character) -> String {
        return first == prefix ? String(suffix(from: index(after: startIndex))) : self
    }
}

struct Day2 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Parse the lines into games
        var games: [Game] = []
        for line in lines {
            // Split input into 2 components - game number and the handfuls of cubes
            let inputComponents = line.components(separatedBy: ":")
            guard inputComponents.count == 2 else { fatalError("Invalid line - no colon detected") }
            
            // Get the game number
            let gameComponents = inputComponents[0].components(separatedBy: " ")
            guard gameComponents.count == 2 else { fatalError("Invalid game components: '\(gameComponents)'")}
            guard let gameNumber = Int(gameComponents[1]) else { fatalError("Unable to determine game number") }
            
            // Parse the rounds of the game
            var rounds: [Cubes] = []
            let roundComponents = inputComponents[1].components(separatedBy: ";")
            for round in roundComponents {
                // Trim the leading space if necessary
                // Only available in macOS 13.0 or newer :(
//                let trimmedRound = round.trimmingPrefix(" ")
                let trimmedRound = round.trimmedPrefix(" ")
                
                // Figure out the number of cubes for the round
                var cubes = Cubes()
                let cubeComponents = trimmedRound.components(separatedBy: ",")
                for cubeComponent in cubeComponents {
                    let trimmedCubeComponent = cubeComponent.trimmedPrefix(" ")
                    
                    let cubeInfo = trimmedCubeComponent.components(separatedBy: " ")
                    guard cubeInfo.count == 2 else { fatalError("Unable to determine cube info") }
                    
                    guard let numberOfCubes = Int(cubeInfo[0]) else { fatalError("Unable to determine number of cubes") }
                    guard let cubeType = CubeType(rawValue: cubeInfo[1]) else { fatalError("Unable to determine cube type") }
                    
                    switch cubeType {
                    case .red:
                        cubes.red = numberOfCubes
                    case .green:
                        cubes.green = numberOfCubes
                    case .blue:
                        cubes.blue = numberOfCubes
                    }
                }
                
                rounds.append(cubes)
            }
            
            let game = Game(number: gameNumber, handfuls: rounds)
            games.append(game)
        }
        
        // Filter out the impossible games
        let possibleGames = games.filter {
            let bag = Cubes.bag
            
            // Make sure each round of the game didn't contain more cubes than are available in the bag
            for cubes in $0.handfuls {
                if cubes.red > bag.red || cubes.green > bag.green || cubes.blue > bag.blue {
                    return false
                }
            }
            
            return true
        }
        
        // Compute the sum of the IDs of the possible games
        let sum = possibleGames.map(\.number).reduce(0, +)
        
        return "\(sum)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
}

do {
    let day2 = Day2()
    
    // Puzzle 1
    let answerExample1 = try day2.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day2.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day2.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day2.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
