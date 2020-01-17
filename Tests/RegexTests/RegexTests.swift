import XCTest
@testable import Regex

final class RegexTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Regex().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
