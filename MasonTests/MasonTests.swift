//
//  MasonTests.swift
//  MasonTests
//
//  Created by monsoir on 1/28/21.
//

import XCTest
@testable import Mason

class MasonTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    struct TestModel: Codable {
        let propertyA: String
        let propertyB: Int
        let nested: NestedTestModel
    }

    struct NestedTestModel: Codable {
        let property1: String
        let property2: Int
    }

    func testStringify() {
        let nested = NestedTestModel(property1: "nested", property2: 10)
        let model = TestModel(propertyA: "a", propertyB: 20, nested: nested)

        let result = Mason.stringify(model)
        XCTAssertNotNil(result)
    }

    func testParsingJSONStringToModel() {
        let jsonInput = """
                {
                    "propertyA": "a",
                    "propertyB": 20,
                    "nested": {
                        "property1": "nested",
                        "property2": 10
                    }
                }
                """

        let result = Mason.parse(jsonInput, type: TestModel.self)
        XCTAssertNotNil(result)
    }

    func testJsonify() {
        let nested = NestedTestModel(property1: "nested", property2: 10)
        let model = TestModel(propertyA: "a", propertyB: 20, nested: nested)

        let result = Mason.jsonify(model)
        XCTAssertNotNil(result)
    }

    func testParsingJSONDataToModel() {
        let jsonData: [String: Any] = [
            "propertyA": "a",
            "propertyB": 20,
            "nested": [
                "property1": "nested",
                "property2": 10,
            ],
        ]

        let result = Mason.parse(jsonData, type: TestModel.self)
        XCTAssertNotNil(result)
    }

    func testParsingJSONRawDataToModel() {
        let jsonData: [String: Any] = [
            "propertyA": "a",
            "propertyB": 20,
            "nested": [
                "property1": "nested",
                "property2": 10,
            ],
        ]

        let rawData = try! JSONSerialization.data(withJSONObject: jsonData, options: [])
        let result = Mason.parse(rawData, type: TestModel.self)
        XCTAssertNotNil(result)
    }

}
