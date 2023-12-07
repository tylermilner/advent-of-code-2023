import AoCUtilities
import Foundation

struct Race {
    let time: Int
    let recordDistance: Int
    
    var winningChargeTimes: [Int] {
        var winningChargeTimes: [Int] = []
        
        for chargeTime in 0...time {
            let distance = distance(for: chargeTime)
            
            if distance > recordDistance {
                winningChargeTimes.append(chargeTime)
            }
        }
        
        return winningChargeTimes
    }
    
    private func distance(for chargeTime: Int) -> Int {
        let speed = chargeTime
        let remainingTime = time - chargeTime
        return speed * remainingTime
    }
}

struct Day6 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var times: [Int] = []
        var distances: [Int] = []
        
        for line in lines {
            if line.hasPrefix("Time:") {
                let timeComponents = line.components(separatedBy: .whitespaces).dropFirst().filter { !$0.isEmpty }
                for time in timeComponents {
                    guard let timeValue = Int(time) else { fatalError("Unable to parse time") }
                    times.append(timeValue)
                }
            } else if line.hasPrefix("Distance:") {
                let distanceComponents = line.components(separatedBy: .whitespaces).dropFirst().filter { !$0.isEmpty }
                for distance in distanceComponents {
                    guard let distanceValue = Int(distance) else { fatalError("Unable to parse distance") }
                    distances.append(distanceValue)
                }
            } else {
                fatalError("Unrecognized input")
            }
        }
        
        guard times.count == distances.count else { fatalError("Unbalanced time/distance values") }
        
        let races = times.enumerated().map { (index, time) in
            let distance = distances[index]
            return Race(time: time, recordDistance: distance)
        }
        
        let marginOfError = races.reduce(1) { partialResult, race in
            partialResult * race.winningChargeTimes.count
        }
        
        return "\(marginOfError)"
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        var time: Int?
        var distance: Int?
        
        for line in lines {
            if line.hasPrefix("Time:") {
                let timeComponents = line.components(separatedBy: .whitespaces).dropFirst().filter { !$0.isEmpty }
                
                let timeString = timeComponents.reduce("") { partialResult, time in
                    partialResult + time
                }
                guard let timeValue = Int(timeString) else { fatalError("Unable to parse time") }
                
                time = timeValue
            } else if line.hasPrefix("Distance:") {
                let distanceComponents = line.components(separatedBy: .whitespaces).dropFirst().filter { !$0.isEmpty }
                
                let distanceString = distanceComponents.reduce("") { partialResult, distance in
                    partialResult + distance
                }
                guard let distanceValue = Int(distanceString) else { fatalError("Unable to parse distance") }
                
                distance = distanceValue
            } else {
                fatalError("Unrecognized input")
            }
        }
        
        guard let time = time, let distance = distance else { fatalError("Unable to parse time and distance") }
        
        let race = Race(time: time, recordDistance: distance)
        let winningChargeTimes = race.winningChargeTimes
        let numberOfWaysToWin = winningChargeTimes.count
        
        return "\(numberOfWaysToWin)"
    }
}

do {
    let day6 = Day6()
    
    // Puzzle 1
    let answerExample1 = try day6.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day6.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day6.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day6.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
