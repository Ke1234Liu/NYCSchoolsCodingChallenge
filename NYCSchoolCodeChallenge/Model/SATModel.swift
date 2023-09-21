//
//  SATModel.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation

struct SATInfo: Decodable {
    var dbn: String
    var name: String
    var numOfSATTakers: String
    var readingScore: String
    var mathScore: String
    var writingScore: String

    private enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
        case numOfSATTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}

