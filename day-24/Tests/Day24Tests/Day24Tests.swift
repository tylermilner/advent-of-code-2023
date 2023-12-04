import XCTest
@testable import Day24

final class Day24Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day24 = Day24()
        
        // Act
        let output = try day24.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day24 = Day24()
        
        // Act
        let output = try day24.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day24 = Day24()
        
        // Act
        let output = try day24.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day24 = Day24()
        
        // Act
        let output = try day24.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
