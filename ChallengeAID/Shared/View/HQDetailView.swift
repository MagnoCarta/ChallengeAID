//
//  HQDetailView.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 05/07/22.
//

import SwiftUI


struct HQDetailView: View {
    
    @StateObject var viewModel: HQDetailViewModel = HQDetailViewModel()
    var comic: Comic
    
    var body: some View {
        viewModel.setComic(comic: comic)
        return VStack {
            AsyncImage(url: URL(string: comic.thumbnail?.computedURL ?? "")) { image in
                image
                    .resizable()
                    .padding(.vertical, 16)
                    .edgesIgnoringSafeArea(.all)
            } placeholder: {
                ProgressView()
            }
            Text(comic.name ?? "No Name")
                .font(.system(size: 24))
                .fontWeight(.bold)
            ScrollView {
                    Text(comic.summary ?? "")
                        .padding(.horizontal, 24)
            }
        }
        .background(Color.purple)
    }
    
}
