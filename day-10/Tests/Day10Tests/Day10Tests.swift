import XCTest
@testable import Day10

final class Day10Tests: XCTestCase {
    func testExample1_1() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleOneOutput(for: .example1_1)
        
        // Assert
        XCTAssertEqual(output, "4")
    }
    
    func testExample1_2() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleOneOutput(for: .example1_2)
        
        // Assert
        XCTAssertEqual(output, "8")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "6697")
    }
    
    func testExample2() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day10 = Day10()
        
        // Act
        let output = try day10.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
