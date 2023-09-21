//
//  SchoolViewModelTests.swift
//  NYCSchoolCodeChallengeTests
//
//  Created by Ke Liu on 9/21/23.
//

import XCTest
@testable import NYCSchoolCodeChallenge

@MainActor
final class SchoolViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchSchoolInfo_PositiveResults() async throws {
        let schoolViewModel =  NYCSchoolViewModel(manager: FakeNetworkManager())
        await schoolViewModel.fetchSchoolInfo("ValidSchoolInfoResponse")
        let nycSchoolResponse =  schoolViewModel.nycSchoolResponse
        
        XCTAssertNotNil(nycSchoolResponse)
        XCTAssertEqual(nycSchoolResponse.count, 2)
        XCTAssertEqual(nycSchoolResponse.first?.id, "02M260")
            
    }
    
    func testFetchSchoolInfo_NegativeResults() async throws {
        let schoolViewModel =  NYCSchoolViewModel(manager: FakeNetworkManager())
        await schoolViewModel.fetchSchoolInfo("InvalidResponse")

        XCTAssertNotNil(schoolViewModel.error)
        XCTAssertEqual(schoolViewModel.nycSchoolResponse.count,0)
    }
    
    func testFetchSATInfo_PositiveResults() async throws {
        let schoolViewModel =  NYCSchoolViewModel(manager: FakeNetworkManager())
        await schoolViewModel.fetchSAT("ValidSatInfoResponse")

        
        XCTAssertNotNil(schoolViewModel)
        XCTAssertNil(schoolViewModel.error)
        XCTAssertEqual(schoolViewModel.satInfoResponse.first?.name, "ARCHIMEDES ACADEMY FOR MATH, SCIENCE AND TECHNOLOGY APPLICATIONS")
        XCTAssertEqual(schoolViewModel.satInfoResponse.first?.dbn, "08X367")
        XCTAssertEqual(schoolViewModel.satInfoResponse.first?.numOfSATTakers, "s")

    }
    
    func testFetchSATInfo_NegativeResults() async throws {
        let schoolViewModel =  NYCSchoolViewModel(manager: FakeNetworkManager())
        await schoolViewModel.fetchSAT("InvalidResponse")
        XCTAssertEqual(schoolViewModel.satInfoResponse.count,0)
        XCTAssertNotNil(schoolViewModel.error)
    }
    func testFetchSchoolInfo_ForBadURL() async throws {
        let schoolViewModel =  NYCSchoolViewModel(manager: FakeNetworkManager())
        await schoolViewModel.fetchSAT("")
        XCTAssertEqual(schoolViewModel.satInfoResponse.count,0)
        XCTAssertNotNil(schoolViewModel.error)
        XCTAssertEqual(schoolViewModel.error,APIError.invalidRequest)

    }
    func testFetchSATInfo_ForBadURL() async throws {
        let schoolViewModel =  NYCSchoolViewModel(manager: FakeNetworkManager())
        await schoolViewModel.fetchSchoolInfo("")
        XCTAssertEqual(schoolViewModel.satInfoResponse.count,0)
        XCTAssertNotNil(schoolViewModel.error)
        XCTAssertEqual(schoolViewModel.error,APIError.invalidRequest)
        XCTAssertEqual((schoolViewModel.error as APIError?)?.errorDescription,"Invalid API request")

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
