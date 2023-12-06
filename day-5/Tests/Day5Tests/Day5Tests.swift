import XCTest
@testable import Day5

final class Day5Tests: XCTestCase {
    func testExample1() throws {
        // Arrange
        let day5 = Day5()
        
        // Act
        let output = try day5.puzzleOneOutput(for: .example1)
        
        // Assert
        XCTAssertEqual(output, "35")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day5 = Day5()
        
        // Act
        let output = try day5.puzzleOneOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "510109797")
    }
    
    func testExample2() throws {
        // Arrange
        let day5 = Day5()
        
        // Act
        let output = try day5.puzzleTwoOutput(for: .example2)
        
        // Assert
        XCTAssertEqual(output, "")
    }
    
    func testPuzzle2() throws {
        // Arrange
        let day5 = Day5()
        
        // Act
        let output = try day5.puzzleTwoOutput(for: .input)
        
        // Assert
        XCTAssertEqual(output, "")
    }
}
