//
//  NYCSchoolCodeChallengeApp.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import SwiftUI

@main
struct NYCSchoolCodeChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            NYCSchoolView(viewModel: NYCSchoolViewModel(manager: APIManager()))
        }
    }
}
