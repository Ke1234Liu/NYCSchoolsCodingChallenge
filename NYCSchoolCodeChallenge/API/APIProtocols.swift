//
//  APIProtocols.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation
protocol JsonDecoder {
    func decode<T: Decodable>(type: T.Type, data: Data)throws -> T
}

extension JsonDecoder {
    func decode<T>(type: T.Type, data: Data) throws -> T where T : Decodable {
        return try JSONDecoder().decode(type.self, from: data)
    }
}

protocol APIProtocol {
    func get<T: Decodable>(apiURL: URL, type: T.Type) async throws -> T
}
