//
//  SATView.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import SwiftUI

struct SATView: View {
    
    let item:NYCSchool
    @ObservedObject var viewModel:NYCSchoolViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            if !viewModel.satInfoResponse.isEmpty{
                Text("School Details").font(.largeTitle)

                Text("School Name: \(viewModel.satInfoResponse.first?.name ?? "")").font(.title)
                Text("Total Sat Takers: \(viewModel.satInfoResponse.first?.numOfSATTakers ?? "")").font(.title)
                Text("Critical Reading Avg Score: \(viewModel.satInfoResponse.first?.readingScore ?? "")").font(.title)
                Text("Math Avg Score: \(viewModel.satInfoResponse.first?.mathScore ?? "")").font(.title)
                Text("Writing Avg Score: \(viewModel.satInfoResponse.first?.writingScore ?? "")").font(.title)

            }else{
                Text("School Details are not availble from API").font(.title)

            }
        }.padding()
            .navigationTitle("School Sat Details")
        .task {
            await viewModel.fetchSAT(APIEndpoints.sat(dbn: item.dbn).url)
        }
    }
}

struct SATView_Previews: PreviewProvider {
    static var previews: some View {
        SATView(item: NYCSchool(dbn: "", name: "", neighborhood: "", location: "", phone: "", email: ""), viewModel: NYCSchoolViewModel(manager: APIManager()))
    }
}
