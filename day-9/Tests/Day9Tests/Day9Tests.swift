import XCTest
@testable import Day9

final class Day9Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day9 = Day9()
        
        // Act
        let output = try day9.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day9 = Day9()
        
        // Act
        let output = try day9.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day9 = Day9()
        
        // Act
        let output = try day9.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day9 = Day9()
        
        // Act
        let output = try day9.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
