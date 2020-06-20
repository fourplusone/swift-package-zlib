# Swift Package: zlib

A Swift packaged version of zlib. On Darwin based systems this package just reexports the system-wide zlib

![Linux](https://github.com/fourplusone/swift-package-zlib/workflows/Linux/badge.svg) ![macOS](https://github.com/fourplusone/swift-package-zlib/workflows/macOS/badge.svg)

# Usage

Add swift-package-zlib as a dependency in your `Package.swift` file

```swift
    dependencies: [
    	// ...
        .package(url:"https://github.com/fourplusone/swift-package-zlib", .branch("master")),
        
    ],
    targets: [
        .target(
            dependencies: [.product(name: "Z",package:"swift-package-zlib")]),    
    ]
    
```