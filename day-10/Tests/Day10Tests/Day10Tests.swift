import XCTest
@testable import Day10

final class Day10Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
