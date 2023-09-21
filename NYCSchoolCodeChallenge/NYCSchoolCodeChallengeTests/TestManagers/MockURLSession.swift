//
//  MockURLSession.swift
//  NYCSchoolCodeChallengeTests
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation
@testable import NYCSchoolCodeChallenge

protocol MockURLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

// Create a mock URLSession
class MockURLSession: MockURLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        // Return dummy data and response for testing purposes
        let data = try! JSONSerialization.data(withJSONObject: ["key": "value"], options: [])
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (data, response)
    }
}
