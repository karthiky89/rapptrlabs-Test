import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(rapptrlabs_TestTests.allTests),
    ]
}
#endif
