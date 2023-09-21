//
//  FakeAPIManager.swift
//  NYCSchoolCodeChallengeTests
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation
@testable import NYCSchoolCodeChallenge

class FakeAPIManager: APIProtocol {
    var mockJsonDecoder: MockDecoder?
    var mockURLSession: MockURLSession?

    func get<T>(apiURL: URL, type: T.Type) async throws -> T where T: Decodable {
        guard let mockURLSession = mockURLSession else {
            fatalError("Mock URLSession not set.")
        }

        let (data, _) = try await mockURLSession.data(from: apiURL)
        
        if let mockJsonDecoder = mockJsonDecoder {
            return try mockJsonDecoder.decode(type: type, data: data)
        } else {
            fatalError("Mock JsonDecoder not set.")
        }
    }
}
