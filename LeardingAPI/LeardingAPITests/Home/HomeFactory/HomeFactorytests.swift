//
//  HomeFactorytests.swift
//  LeardingAPITests
//
//  Created by Kleiton Mendes on 11/07/24.
//

import XCTest
@testable import LeardingAPI

final class HomeFactorytests: XCTestCase {

    func testFactory() {
        let factory = HomeFactory.make()
        XCTAssertNotNil(factory)
    }
}
