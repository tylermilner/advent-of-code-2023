import XCTest
@testable import Day12

final class Day12Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day12 = Day12()
        
        // Act
        let output = try day12.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day12 = Day12()
        
        // Act
        let output = try day12.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day12 = Day12()
        
        // Act
        let output = try day12.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day12 = Day12()
        
        // Act
        let output = try day12.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
