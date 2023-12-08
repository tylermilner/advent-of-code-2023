import XCTest
@testable import Day7

final class Day7Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day7 = Day7()
        
        // Act
        let output = try day7.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "6440")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day7 = Day7()
        
        // Act
        let output = try day7.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "247961593")
    }
    
    func testExample2() throws {
        // Arrange
        let day7 = Day7()
        
        // Act
        let output = try day7.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "5905")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day7 = Day7()
        
        // Act
        let output = try day7.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
