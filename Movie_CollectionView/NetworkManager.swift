//
//  NetworkManager.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/4/26.
//

import Foundation
protocol NetworkManagerProtocol {
    func getDataFromServer(url: String) async -> [Movie]
}

class NetworkManager: NetworkManagerProtocol {
    func getDataFromServer(url: String) async -> [Movie] {
        
   
        guard let serverURL = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }
        
       
        do {
     
            let (data, response) = try await URLSession.shared.data(from: serverURL)
            
            
            if let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode != 200 {
                print("Log: No data received from server")
                return []
            }
            
           
            let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            return movieResponse.results
            
        } catch {
            print("Log: Error fetching data from server \(error)")
            return []
        }
    }
}
