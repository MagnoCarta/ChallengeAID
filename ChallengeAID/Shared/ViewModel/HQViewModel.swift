//
//  HQViewModel.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

import Foundation


extension HQView {
    
    @MainActor class HQViewModel: ObservableObject {
        
        func fetchHqs() {
            MarvelServiceAPI.shared.loadComics(page: page)
        }
        
        func alertError() {
            print("cabou err")
        }
        
        @Published var comics: [Comic] = []
        @Published var page: Int = 0
        
        
        
    }
    
    
}
