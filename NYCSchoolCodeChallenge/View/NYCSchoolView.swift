//
//  NYCSchoolView.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import SwiftUI

struct NYCSchoolView: View {
    @StateObject var viewModel: NYCSchoolViewModel =  NYCSchoolViewModel(manager: APIManager())
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.error != nil {
                    Text(viewModel.error?.errorDescription ?? "Something went wrong, Please try again!")
                }else{
                    List(viewModel.nycSchoolResponse) { item in
                        NavigationLink {
                            SATView(item: item, viewModel: viewModel)
                        } label: {
                            SchoolListCellView(item: item)
                        }
                    }
                }
            }.navigationTitle("School List")
            .task {
                if viewModel.nycSchoolResponse.isEmpty {
                    await viewModel.fetchSchoolInfo(APIEndpoints.school.url)
                }
            }.refreshable {
                Task{
                    await viewModel.fetchSchoolInfo(APIEndpoints.school.url)
                }
            }
        }
    }
}

struct NYCSchoolView_Previews: PreviewProvider {
    static var previews: some View {
        NYCSchoolView()
    }
}
