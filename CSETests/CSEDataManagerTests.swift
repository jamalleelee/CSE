import XCTest
@testable import CSE

final class CSEDataManagerTests: XCTestCase {
    func testCleanPostDataFiltersEmptyEntries() {
        let input: [[String: String]] = [
            ["key": "valid", "value": "yes"],
            ["key": "", "value": "emptyKey"],
            ["key": "noValue", "value": ""],
            [:],
            ["key": "another", "value": "ok"]
        ]
        let result = CSEDataManager.cleanPostData(input)
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0]["key"], "valid")
        XCTAssertEqual(result[0]["value"], "yes")
        XCTAssertEqual(result[1]["key"], "another")
        XCTAssertEqual(result[1]["value"], "ok")
    }
}
