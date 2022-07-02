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
#if os(iOS)
        return NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(["A"],id:\.self) { endpoint in
                        NavigationLink {
                            //NavigationLazyView(presenter.moveToEndpointListView(endpoint: endpoint))
                        } label: {
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                    }
                }
                .padding()
            }
            .background(Color.purple)
            .navigationTitle("Endpoints")
        }
#elseif os(macOS)
        return NavigationView {
            List(presenter.getNames(),id:\.self) { endpoint in
                        NavigationLink {
                            presenter.moveToEndpointListView(endpoint: endpoint)
                        } label: {
                            buildCard(endpoint: endpoint)
                        }
                        .frame(width: 150, height: 150, alignment: .center)
                    }
                }
            .navigationTitle("Endpoints")
            .navigationViewStyle(.columns)
#endif
    }
    
//    func buildCard(endpoint: Endpoint) -> EndpointCard {
//        let interactor = EndpointCardInteractor()
//        let endpointPresenter = EndpointCardPresenter(interactor: interactor)
//        endpointPresenter.fetchCard(endpoint: endpoint, name: endpoint.rawValue, imageURL: "")
//        return EndpointCard(presenter: endpointPresenter, isTextCentered: true)
//    }
    
}

//struct HQView_Previews: PreviewProvider {
//    static var previews: some View {
//        HQView()
//    }
//}
