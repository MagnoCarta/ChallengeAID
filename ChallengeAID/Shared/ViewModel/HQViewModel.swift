//
//  HQViewModel.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

import Foundation


extension HQView {
    
    @MainActor class HQViewModel: ObservableObject {
        
        @Published var comics: [Comic] = []
        @Published var isSheeting: Bool = false
        @Published var page: Int = 0
        var selectedComic: Comic?
        
        func fetchHqs() {
            if comics.isEmpty {
                MarvelServiceAPI.shared.loadComics(page: page,completion: { [weak self] comics in
                    DispatchQueue.main.async {
                        self!.comics.append(contentsOf: comics)
                    }
                })
            }
        }
        
        func toggleSheet() {
            isSheeting = !isSheeting
        }
        
        func alertError() {
            print("cabou err")
        }
        
       
        
    }
    
    
}
