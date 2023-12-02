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
}
