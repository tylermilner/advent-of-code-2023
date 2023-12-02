import XCTest
@testable import Day1

final class Day1Tests: XCTestCase {
    func testExample() throws {
        // Arrange
        let day1 = Day1()
        
        // Act
        let output = day1.output(for: .example)
        
        // Assert
        XCTAssertEqual(output, "142")
    }
    
    func testPuzzle1() throws {
        // Arrange
        let day1 = Day1()
        
        // Act
        let output = day1.output(for: .puzzle1)
        
        // Assert
        XCTAssertEqual(output, "55130")
    }
}
