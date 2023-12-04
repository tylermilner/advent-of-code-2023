import XCTest
@testable import Day2

final class Day2Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day2 = Day2()
        
        // Act
        let output = try day2.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day2 = Day2()
        
        // Act
        let output = try day2.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day2 = Day2()
        
        // Act
        let output = try day2.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day2 = Day2()
        
        // Act
        let output = try day2.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
