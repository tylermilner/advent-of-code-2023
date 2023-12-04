import XCTest
@testable import Day23

final class Day23Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day23 = Day23()
        
        // Act
        let output = try day23.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day23 = Day23()
        
        // Act
        let output = try day23.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day23 = Day23()
        
        // Act
        let output = try day23.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day23 = Day23()
        
        // Act
        let output = try day23.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
