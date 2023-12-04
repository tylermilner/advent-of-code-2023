import XCTest
@testable import Day16

final class Day16Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day16 = Day16()
        
        // Act
        let output = try day16.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day16 = Day16()
        
        // Act
        let output = try day16.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day16 = Day16()
        
        // Act
        let output = try day16.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day16 = Day16()
        
        // Act
        let output = try day16.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
