//
//  NYCSchoolModel.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation

struct NYCSchool: Decodable {
    var dbn: String
    var name: String
    var neighborhood: String
    var location: String
    var phone: String
    var email: String?

    private enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
        case neighborhood
        case location
        case phone = "phone_number"
        case email = "school_email"
    }
}

extension NYCSchool: Identifiable {

    var id: String {
        return dbn
    }

}
