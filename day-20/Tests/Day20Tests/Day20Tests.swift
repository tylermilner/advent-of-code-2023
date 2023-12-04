import XCTest
@testable import Day20

final class Day20Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day20 = Day20()
        
        // Act
        let output = try day20.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day20 = Day20()
        
        // Act
        let output = try day20.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day20 = Day20()
        
        // Act
        let output = try day20.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day20 = Day20()
        
        // Act
        let output = try day20.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
