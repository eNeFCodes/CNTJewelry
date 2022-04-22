//
//  MockTest.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/20/22.
//

import Foundation

class MockTest {

    class func runTest() {
        runNetworkTest()
    }
}

private extension MockTest {

    class func runNetworkTest() {
        RandomImageAPIService.shared.start()
        RandomImageAPIService.shared.startMultiple()
    }
}
