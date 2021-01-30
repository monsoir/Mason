# Mason

A simple JSON handle wrapper in Swift, making it available to handle JSON like JavaScript.

For example:

`JSON.stringify` in JavaScript, in Mason it works as

```swift
let result = Mason.stringify(model)
```

`JSON.parse` in JavaScript, in Mason it works as

```swift
let result = Mason.parse(jsonData, type: TestModel.self)
```

and more...

## Use it with Cocoapods

Add the following line to `Podfile`

```rb
pod 'Mason', :git => 'https://github.com/Monsoir/Mason.git', :tag => "1.0.0"
```

