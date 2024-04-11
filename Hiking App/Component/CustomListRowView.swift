//
//  CustomListRowView.swift
//  Hiking App
//
//  Created by Timotius Leonardo Lianoto on 11/04/24.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if let rowContent {
                Text(rowContent)
                    .foregroundStyle(Color.primary)
                    .fontWeight(.heavy)
            } else if let rowLinkLabel, 
                        let rowLinkDestination,
                      let destinationFinalLink = URL(string: rowLinkDestination) {
                Link(rowLinkLabel, destination: destinationFinalLink)
                    .foregroundStyle(Color.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
        rowLinkLabel: "Credo Academy",
        rowLinkDestination: "https://credo.academy")
    }
}
