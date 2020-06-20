import XCTest
@testable import swift_package_zlib

final class swift_package_zlibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_package_zlib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
