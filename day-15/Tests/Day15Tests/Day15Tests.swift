import XCTest
@testable import Day15

final class Day15Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day15 = Day15()
        
        // Act
        let output = try day15.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day15 = Day15()
        
        // Act
        let output = try day15.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day15 = Day15()
        
        // Act
        let output = try day15.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day15 = Day15()
        
        // Act
        let output = try day15.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
