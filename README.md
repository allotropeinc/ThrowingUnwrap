# ThrowingUnwrap

A simple package to add a throwing unwrap operator (`~!`) to Optionals in Swift.

You can use it like so:

```swift
func test() throws -> String {
  let stringThing: String? = "Hello world!" // Optional string, but not nil...
  let attempt = try stringThing~! // ...therefore, unwrap succeeds...
  return attempt /// ...and we can return the value.
}
```

Let's look at an example when the value is `nil`:

```swift
func test() throws -> String {
  let stringThing: String? = nil // It's nil this time...
  let attempt = try stringThing~! // ...therefore, unwrap fails...
  return attempt /// ...and this never gets called.
}
```

The type thrown is defined in the library, and is called `UnwrapError`, and has exactly one parameter, `failedType`, which is typed as `Any.Type`.
