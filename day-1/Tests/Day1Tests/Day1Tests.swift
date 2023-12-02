import XCTest
@testable import Day1

final class Day1Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day1 = Day1()
        
        // Act
        let output = try day1.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "142")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day1 = Day1()
        
        // Act
        let output = try day1.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "55130")
    }
    
    func testExample2() throws {
        // Arrange
        let day1 = Day1()
        
        // Act
        let output = try day1.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "281")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day1 = Day1()
        
        // Act
        let output = try day1.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "54985")
    }
}
