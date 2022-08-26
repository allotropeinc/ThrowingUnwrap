import XCTest
@testable import ThrowingUnwrap

final class ThrowingUnwrapTests: XCTestCase {
    func testNonNil() throws {
		let stringThing: String? = "Hello, world!"

		let attempt = try stringThing~!

		XCTAssertEqual(stringThing, attempt)
    }

	func unwrapNilValue() throws -> String {
		let stringThing: String? = nil

		let attempt = try stringThing~!

		return attempt
	}

	func testNil() {
		XCTAssertThrowsError(try unwrapNilValue()) { error in
			print(error)
			let error = error as? UnwrapError
			XCTAssertNotNil(error)
		}
	}
}
