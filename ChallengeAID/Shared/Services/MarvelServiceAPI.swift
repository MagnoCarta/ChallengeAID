//
//  MarvelServiceAPI.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

//&limit=1&offset=2&
import Foundation


class MarvelServiceAPI {
    
    
    
    static let shared = MarvelServiceAPI()
    static let limit = 20
    
    private init() {}
    
    func loadComics(page: Int,completion: @escaping ([Comic]) -> Void) {
        guard let url = getUrlComic(page: page) else { return }
        let request = getRequestForURL(url: url)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data,response,error) in
            guard let data = data else { fatalError("data FAIL") }
            
            do {
                let jsonDecoder = JSONDecoder()
                
                let json = try! jsonDecoder.decode(MarvelAPIResponse.self, from: data)
                guard let results = json.results else { return }
                completion(results)
            } catch {
                
            }
            
        })
        
        task.resume()
        //               let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        //               }
        //
    }
    
    
    func getUrlComic(page: Int) -> URL? {
        var url =  "https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=23bd3cd8610f8d605ba64ab438fd1243&hash=e208c79ddcd3b82be74b47c31bffd36e"
        
        url += "&limit=\(MarvelServiceAPI.limit)&offset=\(page*MarvelServiceAPI.limit)"
        let formattedURL = URL(string: url)
        return formattedURL
    }
    
    func getRequestForURL(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}

