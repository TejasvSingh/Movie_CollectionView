//
//  MockNetworkService.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/17/26.
//

class MockNetworkService: NetworkManagerProtocol {
    
    let mockMovies: [Movie] = [
        Movie(title: "Batman Begins", description: nil, releaseDate: "2005-06-15", posterImage: nil),
        Movie(title: "The Dark Knight", description: nil, releaseDate: "2008-07-18", posterImage: nil),
        Movie(title: "Inception", description: nil, releaseDate: "2010-07-16", posterImage: nil)
    ]
    
    func getDataFromServer(url: String) async -> [Movie] {
        return mockMovies
    }
}
