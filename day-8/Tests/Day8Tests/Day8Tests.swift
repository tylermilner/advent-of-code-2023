import XCTest
@testable import Day8

final class Day8Tests: XCTestCase {
    func testExample1_1() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleOneOutput(for: .example1_1)
        
        // Assert
        XCTAssertEqual(output, "2")
    }
    
    func testExample1_2() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleOneOutput(for: .example1_2)
        
        // Assert
        XCTAssertEqual(output, "6")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "16409")
    }
    
    func testExample2() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day8 = Day8()
        
        // Act
        let output = try day8.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
