import XCTest
@testable import Day17

final class Day17Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day17 = Day17()
        
        // Act
        let output = try day17.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day17 = Day17()
        
        // Act
        let output = try day17.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day17 = Day17()
        
        // Act
        let output = try day17.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day17 = Day17()
        
        // Act
        let output = try day17.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
