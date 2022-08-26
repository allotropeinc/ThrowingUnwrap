import Foundation

/// A hypergeneric error, meant to be extended to support whatever values you need.
struct UnwrapError: Error {
	var failedType: Any.Type
}

public extension Optional {
	/// Unwraps an optional, throwing an error if the value is nil.
	func throwingUnwrap() throws -> Wrapped {
		guard let wrapped = self else {
			throw UnwrapError(failedType: Wrapped.self)
		}

		return wrapped
	}
}

postfix operator ~!
/// Unwraps an optional, throwing an error if the value is nil.
public postfix func ~!<T: Any>(input: Optional<T>) throws -> T {
	try input.throwingUnwrap()
}
