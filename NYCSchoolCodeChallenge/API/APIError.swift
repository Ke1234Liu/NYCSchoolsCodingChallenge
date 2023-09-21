//
//  APIError.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case networkError(String)
    case serverError(Int)
    case dataProcessingFailed(details: String)
    case invalidRequest

}

extension APIError: Equatable {
    
    var errorDescription: String? {
        let apiError: String
        switch self {
        case .invalidResponse:
            apiError = "Invalid Response from Server"
        case .networkError(let message):
            apiError = "API Error: \(message)"
        case .serverError(let statusCode):
            apiError = "Server Status code errors: \(statusCode)"
        case .dataProcessingFailed(let details):
            apiError = "Parsing  Error: \(details)"
        case .invalidRequest:
            apiError = "Invalid API request"

        }
        return apiError
    }
}
