import XCTest
@testable import Day22

final class Day22Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day22 = Day22()
        
        // Act
        let output = try day22.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day22 = Day22()
        
        // Act
        let output = try day22.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testExample2() throws {
        // Arrange
        let day22 = Day22()
        
        // Act
        let output = try day22.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day22 = Day22()
        
        // Act
        let output = try day22.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
