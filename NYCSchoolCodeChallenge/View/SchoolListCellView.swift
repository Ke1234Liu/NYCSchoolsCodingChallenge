//
//  SchoolListCellView.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import SwiftUI

struct SchoolListCellView: View {
    let item:NYCSchool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("\(item.name)").font(.title2)
            Text("Location: \(item.location)")
            Text("Ph No: \(item.phone)")
            Text("Email: \(item.email ?? "")")
        }
    }
}

struct SchoolListCellView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListCellView(item: NYCSchool(dbn: "", name: "", neighborhood: "", location: "", phone: "", email: ""))
    }
}
