import AoCUtilities
import Foundation

struct Map {
    let destinationRangeStart: Int
    let sourceRangeStart: Int
    let rangeLength: Int
    
    var destinationRange: Range<Int> {
        let destinationRangeEnd = destinationRangeStart + rangeLength
        return destinationRangeStart..<destinationRangeEnd
    }
    
    var sourceRange: Range<Int> {
        let sourceRangeEnd = sourceRangeStart + rangeLength
        return sourceRangeStart..<sourceRangeEnd
    }
    
    init(inputLine: String) {
        let mapComponents = inputLine.components(separatedBy: " ")
        guard mapComponents.count == 3 else { fatalError("Unexpected number of map components") }
        self.destinationRangeStart = Int(mapComponents[0])!
        self.sourceRangeStart = Int(mapComponents[1])!
        self.rangeLength = Int(mapComponents[2])!
    }
    
    func mappedValue(for initialValue: Int) -> Int? {        
        guard sourceRange.contains(initialValue) else { return nil }
        
        let offset = initialValue - sourceRangeStart
        
        return destinationRangeStart + offset
    }
}

struct Day5 {
    
    func puzzleOneOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Parse seeds
        let firstLine = lines[0]
        guard firstLine.starts(with: "seeds:") else { fatalError("Unable to parse seeds") }
        let seeds = firstLine.components(separatedBy: " ").dropFirst().compactMap(Int.init)
        
        // Get the lowest value
        let lowestValue = findLowestLocationForSeeds(seeds, in: lines)
        
        // Return output
        if let lowestValue = lowestValue {
            return "\(lowestValue)"
        } else {
            return ""
        }
    }
    
    func puzzleTwoOutput(for input: Input) throws -> String {
        let lines = try input.fileLines
        
        // Parse seeds
        let firstLine = lines[0]
        guard firstLine.starts(with: "seeds:") else { fatalError("Unable to parse seeds") }
        let seedValues = firstLine.components(separatedBy: ":")[1].components(separatedBy: " ").compactMap(Int.init)
        guard seedValues.count.isMultiple(of: 2) else { fatalError("Unbalanced number of seed values") }
        
        var seeds: [Int] = []
        var seedStart: Int?
        
        for seedValue in seedValues {
            if let start = seedStart {
                let seedRange = start..<(start + seedValue)
                seeds.append(contentsOf: seedRange)
                seedStart = nil
            } else {
                seedStart = seedValue
            }
        }
        
        // Get the lowest value
        let lowestValue = findLowestLocationForSeeds(seeds, in: lines)
        
        // Return output
        if let lowestValue = lowestValue {
            return "\(lowestValue)"
        } else {
            return ""
        }
    }
    
    private func findLowestLocationForSeeds(_ seeds: [Int], in lines: [String]) -> Int? {
        // Parse input into seeds and maps
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
                // no-op (seeds are now passed in)
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
        
        return lowestValue
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
    
#if DEBUG
print("WARNING! Puzzle 2 is not performant when running in DEBUG mode. Run in release mode with `swift run -c release` to get puzzle 2 output.")
#else
    // Puzzle 2
    let answerExample2 = try day5.puzzleTwoOutput(for: .example2)
    print("Example 2: \(answerExample2)")
    
    let answerPuzzle2 = try day5.puzzleTwoOutput(for: .input)
    print("Puzzle 2: \(answerPuzzle2)")
#endif
} catch {
    fatalError(error.localizedDescription)
}
