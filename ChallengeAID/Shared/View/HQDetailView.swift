//
//  HQDetailView.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 05/07/22.
//

import SwiftUI


struct HQDetailView: View {
    
    @StateObject var viewModel: HQDetailViewModel
    
    init(comic: Comic) {
        self._viewModel = StateObject(wrappedValue: HQDetailViewModel(comic: comic))
    }
    
    var body: some View {
        return VStack {
            AsyncImage(url: URL(string: viewModel.comic.thumbnail?.computedURL ?? "")) { image in
                image
                    .resizable()
                    .padding(.vertical, 16)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(alignment: .topTrailing, content: {
                        Image(systemName: viewModel.getSymbolName())
                            .font(Font.title)
                            .foregroundColor(Color.yellow)
                            .onTapGesture(perform: {
                                viewModel.toggleFavorite()
                            })
                    })
            } placeholder: {
                ProgressView()
            }
            Text(viewModel.comic.name ?? "No Name")
                .font(.system(size: 24))
                .fontWeight(.bold)
            ScrollView {
                VStack {
                    Text(viewModel.comic.summary ?? "")
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                    Text("Characters")
                        .font(.title)
                    ForEach(viewModel.comic.characterList ?? [],id:\.self) { character in
                        Rectangle()
                            .cornerRadius(15)
                            .padding(10)
                            .foregroundColor(Color.redCellBackground)
                            .background(Color.redCellBackground)
                            .overlay(alignment: .center, content: {
                                Text(character.name ?? "No name")
                                    .foregroundColor(.white)
                            })
                    }
                    Text("Authors")
                        .font(.title)
                    ForEach(viewModel.comic.authors ?? [],id:\.self) { authors in
                        Rectangle()
                            .cornerRadius(15)
                            .padding(10)
                            .foregroundColor(Color.redCellBackground)
                            .background(Color.redCellBackground)
                            .overlay(alignment: .center, content: {
                                Text(authors.name ?? "No name")
                                    .foregroundColor(.white)
                            })
                    }
                }
            }
        }
        .background(Color.orangeBackground)
    }
    
}
