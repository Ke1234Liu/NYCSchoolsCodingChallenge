//
//  NetworkLayer.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation

enum APIEndpoints {
    case school
    case sat(dbn:String)
    
    var url: String {
        switch self {
        case .school:
            return "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        case .sat(let dbn):
            return "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)"
        }
    }
}

