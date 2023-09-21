//
//  APIManager.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation

struct APIManager {
    private let shared: URLSession
    init(shared: URLSession = URLSession.shared) {
        self.shared = shared
    }
}

extension APIManager: APIProtocol, JsonDecoder {
    func get<T>(apiURL: URL, type: T.Type) async throws -> T where T : Decodable {
        let (data, _) = try await URLSession.shared.data(from: apiURL)

       return try decode(type:type, data: data)
    }
}
