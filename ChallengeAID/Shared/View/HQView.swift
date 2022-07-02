//
//  HQView.swift
//  ChallengeAID (iOS)
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//


import Foundation
import SwiftUI


struct HQView: View {
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 150
    @StateObject private var viewModel = HQViewModel()
    
    var body: some View {
        viewModel.fetchHqs()
        return NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.comics,id:\.self) { comic in
                        NavigationLink {
                            //NavigationLazyView(presenter.moveToEndpointListView(endpoint: endpoint))
                        } label: {
                            buildCard()
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                    }
                }
                .padding()
            }
            .background(Color.purple)
            .navigationTitle("Endpoints")
        }
    }
    
    func buildCard() -> Card {
        return Card()
    }
    
}

//struct HQView_Previews: PreviewProvider {
//    static var previews: some View {
//        HQView()
//    }
//}
