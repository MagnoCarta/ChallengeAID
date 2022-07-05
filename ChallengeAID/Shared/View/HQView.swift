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
    @State var sheetVisible: Bool = false
    @StateObject private var viewModel = HQViewModel()
    
    var body: some View {
        viewModel.fetchHqs()
        return NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.comics,id:\.self) { comic in
                        buildCard(name: comic.name!,imageURL: comic.thumbnail?.smallPortraitURL ?? "")
                            .onTapGesture {
                                sheetVisible = true
                                viewModel.selectedComic = comic
                            }
                            .frame(width: 150, height: 150, alignment: .center)
                    }
                }
                .sheet(isPresented: $sheetVisible, content: {
                    HQDetailView(comic: viewModel.selectedComic!)
                })
                .padding()
            }
            .background(Color.purple)
            .navigationTitle("Endpoints")
        }
    }
    
    func buildCard(name: String,imageURL: String) -> Card {
        return Card(name: name,imageURL: imageURL)
    }
    
}
