//
//  MockData.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/10/26.
//


import Foundation
@testable import Movie_CollectionView

class MockNetworkService: NetworkManagerProtocol {
    
    let mockMovies: [Movie] = [
        Movie(original_title: "Batman Begins", overview: nil, release_date: "2005-06-15", poster_path: nil),
        Movie(original_title: "The Dark Knight", overview: nil, release_date: "2008-07-18", poster_path: nil),
        Movie(original_title: "Inception", overview: nil, release_date: "2010-07-16", poster_path: nil)
    ]
    
    func getDataFromServer(url: String) async -> [Movie] {
        return mockMovies
    }
}
