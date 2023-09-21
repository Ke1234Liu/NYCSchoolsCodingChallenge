//
//  MockDecoder.swift
//  NYCSchoolCodeChallengeTests
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation
@testable import NYCSchoolCodeChallenge


class MockDecoder {
    func decode<T>(type: T.Type, data: Data) throws -> T where T : Decodable {
        return NYCSchool(dbn: "02M260", name: "Clinton School Writers & Artists, M.S. 260", neighborhood: "M", location: "", phone: "") as! NYCSchool as! T
    }
}
