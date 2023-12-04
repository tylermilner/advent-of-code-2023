import XCTest
@testable import Day8

final class Day8Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
