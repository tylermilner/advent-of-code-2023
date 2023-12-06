import AoCUtilities
import Foundation

struct Map {
    let destinationRangeStart: Int
    let sourceRangeStart: Int
    let rangeLength: Int
    
    var destinationRange: [Int] {
        range(startingAt: destinationRangeStart, length: rangeLength)
    }
    
    var sourceRange: [Int] {
        range(startingAt: sourceRangeStart, length: rangeLength)
    }
    
    init(inputLine: String) {
        let mapComponents = inputLine.components(separatedBy: " ")
        guard mapComponents.count == 3 else { fatalError("Unexpected number of map components") }
        self.destinationRangeStart = Int(mapComponents[0])!
        self.sourceRangeStart = Int(mapComponents[1])!
        self.rangeLength = Int(mapComponents[2])!
    }
    
    func mappedValue(for initialValue: Int) -> Int? {
        guard let index = sourceRange.firstIndex(of: initialValue) else { return nil }
        return destinationRange[index]
    }
    
    private func range(startingAt start: Int, length: Int) -> [Int] {
        var range: [Int] = []
        
        for number in start..<(start + length) {
            range.append(number)
        }
        
        return range
    }
}

struct Day5 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Parse input into seeds and maps
        var seeds: [Int] = []
        var seedToSoilMaps: [Map] = []
        var soilToFertilizerMaps: [Map] = []
        var fertilizerToWaterMaps: [Map] = []
        var waterToLightMaps: [Map] = []
        var lightToTemperatureMaps: [Map] = []
        var temperatureToHumidityMaps: [Map] = []
        var humidityToLocationMaps: [Map] = []
        
        var parsingSeedToSoil = false
        var parsingSoilToFertilizer = false
        var parsingFertilizerToWater = false
        var parsingWaterToLight = false
        var parsingLightToTemperature = false
        var parsingTemperatureToHumidity = false
        var parsingHumidityToLocation = false
        
        for line in lines {
            if line.hasPrefix("seeds:") {
                seeds = line.components(separatedBy: " ").dropFirst().compactMap(Int.init)
            } else if line.hasPrefix("seed-to-soil") {
                parsingSeedToSoil = true
            } else if line.hasPrefix("soil-to-fertilizer") {
                parsingSeedToSoil = false
                parsingSoilToFertilizer = true
            } else if line.hasPrefix("fertilizer-to-water") {
                parsingSoilToFertilizer = false
                parsingFertilizerToWater = true
            } else if line.hasPrefix("water-to-light") {
                parsingFertilizerToWater = false
                parsingWaterToLight = true
            } else if line.hasPrefix("light-to-temperature") {
                parsingWaterToLight = false
                parsingLightToTemperature = true
            } else if line.hasPrefix("temperature-to-humidity") {
                parsingLightToTemperature = false
                parsingTemperatureToHumidity = true
            } else if line.hasPrefix("humidity-to-location") {
                parsingTemperatureToHumidity = false
                parsingHumidityToLocation = true
            } else if parsingSeedToSoil {
                let map = Map(inputLine: line)
                seedToSoilMaps.append(map)
            } else if parsingSoilToFertilizer {
                let map = Map(inputLine: line)
                soilToFertilizerMaps.append(map)
            } else if parsingFertilizerToWater {
                let map = Map(inputLine: line)
                fertilizerToWaterMaps.append(map)
            } else if parsingWaterToLight {
                let map = Map(inputLine: line)
                waterToLightMaps.append(map)
            } else if parsingLightToTemperature {
                let map = Map(inputLine: line)
                lightToTemperatureMaps.append(map)
            } else if parsingTemperatureToHumidity {
                let map = Map(inputLine: line)
                temperatureToHumidityMaps.append(map)
            } else if parsingHumidityToLocation {
                let map = Map(inputLine: line)
                humidityToLocationMaps.append(map)
            }
        }
        
        // Calculate location numbers
        var locationValues: [Int] = []
        
        for seed in seeds {
            let soil = mappedValue(for: seed, in: seedToSoilMaps)
            let fertilizer = mappedValue(for: soil, in: soilToFertilizerMaps)
            let water = mappedValue(for: fertilizer, in: fertilizerToWaterMaps)
            let light = mappedValue(for: water, in: waterToLightMaps)
            let temperature = mappedValue(for: light, in: lightToTemperatureMaps)
            let humidity = mappedValue(for: temperature, in: temperatureToHumidityMaps)
            let location = mappedValue(for: humidity, in: humidityToLocationMaps)
            
//            print("Seed \(seed), soil \(soil), fertilizer \(fertilizer), water \(water), light \(light), temperature \(temperature), humidity \(humidity), location \(location)")
            locationValues.append(location)
        }
        
        // Get the lowest location number
        var lowestValue: Int?
        
        for locationValue in locationValues {
            if lowestValue == nil {
                lowestValue = locationValue
            } else if let currentLowest = lowestValue, locationValue < currentLowest {
                lowestValue = locationValue
            }
        }
        
        if let lowestValue = lowestValue {
            return "\(lowestValue)"
        } else {
            return ""
        }
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // TODO: Add puzzle logic
        
        return ""
    }
    
    private func mappedValue(for initialValue: Int, in maps: [Map]) -> Int {
        var mappedValue: Int?
        
        for map in maps {
            if let value = map.mappedValue(for: initialValue) {
                mappedValue = value
            }
        }
        
        // Fallback to the initial value if not mapped
        return mappedValue ?? initialValue
    }
}

do {
    let day5 = Day5()
    
    // Puzzle 1
    let answerExample1 = try day5.puzzleOneOutput(for: .example1)
    print("Example 1: \(answerExample1)")
    
    let answerPuzzle1 = try day5.puzzleOneOutput(for: .input)
    print("Puzzle 1: \(answerPuzzle1)")
    
    // Puzzle 2
    let answerExample2 = try day5.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day5.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
} catch {
    fatalError(error.localizedDescription)
}
