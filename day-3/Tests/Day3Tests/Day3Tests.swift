import XCTest
@testable import Day3

final class Day3Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day3 = Day3()
        
        // Act
        let output = try day3.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "4361")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day3 = Day3()
        
        // Act
        let output = try day3.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "533784")
    }
    
    func testExample2() throws {
        // Arrange
        let day3 = Day3()
        
        // Act
        let output = try day3.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day3 = Day3()
        
        // Act
        let output = try day3.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
