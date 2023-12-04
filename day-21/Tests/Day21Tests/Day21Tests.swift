import XCTest
@testable import Day21

final class Day21Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day21 = Day21()
        
        // Act
        let output = try day21.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day21 = Day21()
        
        // Act
        let output = try day21.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day21 = Day21()
        
        // Act
        let output = try day21.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day21 = Day21()
        
        // Act
        let output = try day21.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
