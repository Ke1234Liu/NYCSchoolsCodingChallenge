//
//  FakeNetworkManager.swift
//  NYCSchoolCodeChallengeTests
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation
@testable import NYCSchoolCodeChallenge

class FakeNetworkManager: JsonDecoder, APIProtocol {
    func get<T>(apiURL: URL, type: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        guard let path = bundle.url(forResource: apiURL.absoluteString, withExtension: "json") else { throw APIError.dataProcessingFailed(details: "Parsing error") }
        
        do {
            let data = try Data(contentsOf: path)
            return try decode(type:type, data: data)
        } catch {
            throw APIError.invalidResponse
        }
    }
}
