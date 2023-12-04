import XCTest
@testable import Day13

final class Day13Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day13 = Day13()
        
        // Act
        let output = try day13.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day13 = Day13()
        
        // Act
        let output = try day13.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day13 = Day13()
        
        // Act
        let output = try day13.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day13 = Day13()
        
        // Act
        let output = try day13.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
