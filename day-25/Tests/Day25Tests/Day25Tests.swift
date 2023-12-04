import XCTest
@testable import Day25

final class Day25Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day25 = Day25()
        
        // Act
        let output = try day25.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day25 = Day25()
        
        // Act
        let output = try day25.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day25 = Day25()
        
        // Act
        let output = try day25.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day25 = Day25()
        
        // Act
        let output = try day25.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
