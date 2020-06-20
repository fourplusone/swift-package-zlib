import XCTest
@testable import Z

final class zlibTests: XCTestCase {
    func testCompressUncompress() {
        let testData = "Hello World".data(using:.utf8)!
        
        
        let destLen = 2000
        let dest = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: destLen)
        
        let compressed = try! testData.withUnsafeBytes { (source : UnsafeRawBufferPointer) throws -> Data in
            
            let ptr = UnsafeMutablePointer<UInt>.allocate(capacity: 1);
            defer { ptr.deallocate() }
            ptr.pointee = UInt(dest.count)
            let bound = source.bindMemory(to: UInt8.self)
            compress(dest.baseAddress, ptr, bound.baseAddress, uLong(bound.count))
            
            return Data(bytes:dest.baseAddress!, count: Int(ptr.pointee))
        }
        
        let decompressed = try! compressed.withUnsafeBytes { (source : UnsafeRawBufferPointer) throws -> Data in
            
            let ptr = UnsafeMutablePointer<UInt>.allocate(capacity: 1);
            defer { ptr.deallocate() }
            ptr.pointee = UInt(dest.count)
            let bound = source.bindMemory(to: UInt8.self)
            
            uncompress(dest.baseAddress, ptr, bound.baseAddress, uLong(bound.count))
            return Data(bytes:dest.baseAddress!, count: Int(ptr.pointee))
        }
        
        XCTAssertEqual(decompressed, testData)
        
        
    }

    static var allTests = [
        ("testCompressUncompress", testCompressUncompress),
    ]
}
