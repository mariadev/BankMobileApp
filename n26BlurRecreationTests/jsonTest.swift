//
//  n26BlurRecreationTests.swift
//  n26BlurRecreationTests
//
//  Created by Maria on 06/04/2021.
//

import XCTest
@testable import n26BlurRecreation

class JsonTest: XCTestCase {

    let decoder = JSONDecoder()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func setUp() {
    }

    func testDecodeDataUser() {
        guard let path = Bundle(for: type(of: self)).path(forResource: "userData", ofType: "json") else {
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let dataUser = try decoder.decode(DataUser.self, from: data)
            XCTAssertNotNil(dataUser)
            let user = dataUser.user
            let operationsByMonth = dataUser.operationsByMonth
            let operations = operationsByMonth[0].operations
            XCTAssertNotNil(user)
            XCTAssertNotNil(operationsByMonth)
            XCTAssertNotNil(operations)
            XCTAssertNotNil(operations[0].companyName)
            XCTAssertNotNil(operations[0].date)
            XCTAssertNotNil(operations[0].price)
            XCTAssertNotNil(operations[0].image)
        } catch {
            XCTFail("Fail")
        }
    }

}
