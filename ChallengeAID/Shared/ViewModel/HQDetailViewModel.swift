//
//  HQDetailViewModel.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 05/07/22.
//

import Foundation

extension HQDetailView {
    
    @MainActor class HQDetailViewModel: ObservableObject {
        
        @Published var comic: Comic
        
        init(comic: Comic) {
            self.comic = comic
        }
        
        
        func getSymbolName() -> String {
            if checkIfFavorite() {
                return "star.fill"
            } else {
                return "star"
            }
            
        }
        
        private func checkIfFavorite() -> Bool {
            let favoriteComicIds = (UserDefaults.standard.array(forKey: "Favorites") ?? []) as! [Int]
            if favoriteComicIds.contains(where: {
                $0 == comic.id
            }) {
                return true
            }
            return false
        }
        
        private func addFavorite() {
            var favoriteComicIds = (UserDefaults.standard.array(forKey: "Favorites") ?? []) as! [Int]
            self.comic.favorite = true
            favoriteComicIds.append(comic.id!)
            UserDefaults.standard.set(favoriteComicIds, forKey: "Favorites")
        }
        
        private func removeFavorite() {
            var favoriteComicIds = (UserDefaults.standard.array(forKey: "Favorites") ?? []) as! [Int]
            self.comic.favorite = false
            favoriteComicIds.removeAll(where: {
                $0 == comic.id
            })
            UserDefaults.standard.set(favoriteComicIds, forKey: "Favorites")
            
        }
        
        func toggleFavorite() {
            
            if checkIfFavorite() {
                removeFavorite()
            } else {
                addFavorite()
            }
            
        }
        
    }
}
