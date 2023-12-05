import XCTest
@testable import Day4

final class Day4Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day4 = Day4()
        
        // Act
        let output = try day4.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "13")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day4 = Day4()
        
        // Act
        let output = try day4.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "21485")
    }
    
    func testExample2() throws {
        // Arrange
        let day4 = Day4()
        
        // Act
        let output = try day4.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day4 = Day4()
        
        // Act
        let output = try day4.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
