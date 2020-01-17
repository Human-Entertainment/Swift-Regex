import XCTest
@testable import Regex

final class RegexTests: XCTestCase {
    func testStringLiteral() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let hello: Regex = "Hello, World!"
        XCTAssertEqual(hello, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
