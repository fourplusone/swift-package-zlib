#if !canImport(ObjectiveC)
import XCTest

import zlibTests

var tests = [XCTestCaseEntry]()
tests += zlibTests.allTests()
XCTMain(tests)
#endif 
