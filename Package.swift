// swift-tools-version:5.2

import PackageDescription

var sources = ["adler32.c", "compress.c", "crc32.c", "deflate.c", "gzclose.c", "gzlib.c", "gzread.c", "gzwrite.c", "inflate.c", "infback.c", "inftrees.c", "inffast.c", "trees.c", "uncompr.c", "zutil.c"]


let VENDOR_ZLIB : Bool

#if (os(macOS) || os(iOS) || os(watchOS) || os(tvOS))
VENDOR_ZLIB = false
#else
VENDOR_ZLIB = true
#endif

let package = Package(
    name: "swift-package-zlib",
    products: [
        .library(
            name: "Z",
            targets: ["Z"]),
    ],
    targets: [
        .target(name: "Z",
                dependencies: VENDOR_ZLIB ? ["vendoredZlib"] : [],
                swiftSettings: VENDOR_ZLIB ? [.define("USE_VENDORED_ZLIB")] : nil),
        .testTarget(name: "zlibTests", dependencies:["Z"])
        ] + (VENDOR_ZLIB ? [
            .target(name:"vendoredZlib",
                    path: "Sources/zlib",
                    sources:sources.map { "repository/" + $0 },
                    publicHeadersPath: "include",
                    cSettings:[.define("STDC"), .define("Z_HAVE_UNISTD_H"), .define("HAVE_STDARG_H"), .define("HAVE_HIDDEN")])] : [])
)
