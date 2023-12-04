import XCTest
@testable import Day18

final class Day18Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day18 = Day18()
        
        // Act
        let output = try day18.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day18 = Day18()
        
        // Act
        let output = try day18.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day18 = Day18()
        
        // Act
        let output = try day18.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day18 = Day18()
        
        // Act
        let output = try day18.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
