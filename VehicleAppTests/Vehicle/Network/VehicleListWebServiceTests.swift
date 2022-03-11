//
//  VehicleListWebServiceTests.swift
//  VehicleAppTests
//
//  Created by manju V on 11/03/22.
//

import XCTest
@testable import VehicleApp

class VehicleListWebServiceTests: XCTestCase {

    let helper  = Helper()
    var sut : WebService!


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = WebService(urlString: VehicleConstants.vehicleServiceURLString,urlSession: urlSession)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testVehicleWebService_WhenGivenSucessResponse_ReturnSucess(){

        let jsonData = helper.readLocalFile(forName: "VehicleList")
        MockURLProtocol.stubResponseData = jsonData
        let expectation = self.expectation(description: "Vehicle WebService  Expectation")

            sut.getAllList() {articles in
                XCTAssertEqual(articles?.count, VehicleConstants.vehicleListCount)
                expectation.fulfill()

            }
        self.wait(for: [expectation], timeout: TimeInterval(VehicleConstants.urlSessionTimeout))

        }

    
}
