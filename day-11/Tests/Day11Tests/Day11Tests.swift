import XCTest
@testable import Day11

final class Day11Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day11 = Day11()
        
        // Act
        let output = try day11.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day11 = Day11()
        
        // Act
        let output = try day11.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day11 = Day11()
        
        // Act
        let output = try day11.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day11 = Day11()
        
        // Act
        let output = try day11.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
