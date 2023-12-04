import XCTest
@testable import Day6

final class Day6Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day6 = Day6()
        
        // Act
        let output = try day6.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day6 = Day6()
        
        // Act
        let output = try day6.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day6 = Day6()
        
        // Act
        let output = try day6.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day6 = Day6()
        
        // Act
        let output = try day6.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
