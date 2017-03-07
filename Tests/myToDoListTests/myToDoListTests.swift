import XCTest
@testable import myToDoList

class myToDoListTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(myToDoList().text, "Hello, World!")
    }


    static var allTests : [(String, (myToDoListTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
