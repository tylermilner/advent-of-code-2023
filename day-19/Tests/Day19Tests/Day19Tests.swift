import XCTest
@testable import Day19

final class Day19Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day19 = Day19()
        
        // Act
        let output = try day19.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day19 = Day19()
        
        // Act
        let output = try day19.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day19 = Day19()
        
        // Act
        let output = try day19.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day19 = Day19()
        
        // Act
        let output = try day19.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
