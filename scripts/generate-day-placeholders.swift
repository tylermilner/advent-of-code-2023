import Foundation

let numberOfDays = 25
let repoPath = "/path/to/your/repo"

for day in 3...numberOfDays {
    let dayFolder = "\(repoPath)/day-\(day)"
    
    // Create directory for the day
    do {
        try FileManager.default.createDirectory(atPath: dayFolder, withIntermediateDirectories: true, attributes: nil)
    } catch {
        print("Error creating directory for day-\(day): \(error.localizedDescription)")
        continue
    }
    
    // Copy files from Day2 as a template
    let templateFiles = [
        "Package.swift",
        "README.md",
        "Sources/Day2/main.swift",
        "Sources/Day2/Extensions/Input+Extensions.swift",
        "Sources/Day2/Resources/inputs/example1.txt",
        "Sources/Day2/Resources/inputs/example2.txt",
        "Sources/Day2/Resources/inputs/input.txt",
        "Tests/Day2Tests/Day2Tests.swift"
    ]
    
    for file in templateFiles {
        let sourcePath = "\(repoPath)/day-2/\(file)"
        let destinationPath = "\(dayFolder)/\(file)".replacingOccurrences(of: "Day2", with: "Day\(day)")
        
        // Ensure intermediate directories are created before attempting to copy
        let destinationDirectory = URL(fileURLWithPath: destinationPath).deletingLastPathComponent().path
        do {
            try FileManager.default.createDirectory(atPath: destinationDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error creating intermediate directories for day-\(day): \(error.localizedDescription)")
            continue
        }
        
        // Copy the file
        do {
            try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
        } catch {
            print("Error copying \(file) to day-\(day): \(error.localizedDescription)")
            continue
        }
    }
    
    // Update the package name in Package.swift
    let packageFilePath = "\(dayFolder)/Package.swift"
    do {
        var packageContent = try String(contentsOfFile: packageFilePath)
        packageContent = packageContent.replacingOccurrences(of: "Day2", with: "Day\(day)")
        try packageContent.write(toFile: packageFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error updating package name in Package.swift for day-\(day): \(error.localizedDescription)")
        continue
    }
    
    // Update the name in README.md
    let readmeFilePath = "\(dayFolder)/README.md"
    do {
        var readmeContent = try String(contentsOfFile: readmeFilePath)
        readmeContent = readmeContent.replacingOccurrences(of: "day-2", with: "day-\(day)")
        try readmeContent.write(toFile: readmeFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error updating name in README.md for day-\(day): \(error.localizedDescription)")
        continue
    }

    // Update the main.swift file with the correct day number and variable names
    let mainSwiftFilePath = "\(dayFolder)/Sources/Day\(day)/main.swift"
    do {
        var mainSwiftContent = try String(contentsOfFile: mainSwiftFilePath)
        mainSwiftContent = mainSwiftContent.replacingOccurrences(of: "Day2", with: "Day\(day)")
        mainSwiftContent = mainSwiftContent.replacingOccurrences(of: "day2", with: "day\(day)")
        try mainSwiftContent.write(toFile: mainSwiftFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error updating main.swift for day-\(day): \(error.localizedDescription)")
        continue
    }

    // Update the tests file with the correct day number and variable names
    let testsFilePath = "\(dayFolder)/Tests/Day\(day)Tests/Day\(day)Tests.swift"
    do {
        var testsContent = try String(contentsOfFile: testsFilePath)
        testsContent = testsContent.replacingOccurrences(of: "Day2", with: "Day\(day)")
        testsContent = testsContent.replacingOccurrences(of: "day2", with: "day\(day)")
        try testsContent.write(toFile: testsFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error updating tests for day-\(day): \(error.localizedDescription)")
        continue
    }
    
    print("Created placeholder project for day-\(day) at \(dayFolder)")
}
