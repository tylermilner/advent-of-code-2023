import XCTest
@testable import Day14

final class Day14Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day14 = Day14()
        
        // Act
        let output = try day14.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day14 = Day14()
        
        // Act
        let output = try day14.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day14 = Day14()
        
        // Act
        let output = try day14.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day14 = Day14()
        
        // Act
        let output = try day14.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
