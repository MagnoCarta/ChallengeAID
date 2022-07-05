//
//  HQDetailViewModel.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 05/07/22.
//

import Foundation

extension HQDetailView {
    
    @MainActor class HQDetailViewModel: ObservableObject {
        
        @Published var comic: Comic = Comic()
        
        func setComic(comic: Comic) {
            if comic.id == self.comic.id {
                self.comic = comic
            }
        }

    }
}
