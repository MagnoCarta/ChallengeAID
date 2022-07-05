//
//  Card.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 02/07/22.
//

import SwiftUI


struct Card: View {

    let name: String
    let imageURL: String
    
    var body: some View {
        return setUpView()
    }
    
    func setUpView() -> some View {
        Rectangle()
            .cornerRadius(15)
            .foregroundColor(.gray)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 0)
            .overlay(alignment: .center, content: {
                    VStack {
                        AsyncImage(url: URL(string: imageURL)) {image in
                        image
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                    } placeholder: {
                        ProgressView()
                    }
                        Text(name)
                            .foregroundColor(.white)
                    }
            })
    }
    
    
}
