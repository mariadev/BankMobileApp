//
//  HomeViewControllerTest.swift
//  n26BlurRecreationTests
//
//  Created by Maria on 06/04/2021.
//

import XCTest
@testable import BankMobileApp

class DataModel: XCTestCase {

    let retrieveData =  RetrieveData()
    var model: [DataOperationsByMonth] = []

    func testRetrieveData() throws {
        XCTAssertNotNil(retrieveData)
        model = retrieveData.getModel()
        XCTAssertGreaterThan( model.count, 0)
    }

}
