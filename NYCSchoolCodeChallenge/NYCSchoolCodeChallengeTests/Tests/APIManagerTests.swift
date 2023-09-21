//
//  APIManagerTests.swift
//  NYCSchoolCodeChallengeTests
//
//  Created by Ke Liu on 9/21/23.
//

import XCTest
@testable import NYCSchoolCodeChallenge

final class APIManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetRequest() async {
        
        
        // Create a NetworkManager with the mock JsonDecoder and mock URLSession
        let networkManager = FakeAPIManager()
        let mockJsonDecoder = MockDecoder()
        let mockURLSession = MockURLSession()
        networkManager.mockJsonDecoder = mockJsonDecoder
        networkManager.mockURLSession = mockURLSession
        
        // Perform the network request and decode the result
        let apiURL = URL(string: APIEndpoints.school.url)!
        let result:NYCSchool = try! await networkManager.get(apiURL: apiURL, type: NYCSchool.self)
        
        XCTAssertEqual(result.name, "Clinton School Writers & Artists, M.S. 260")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
