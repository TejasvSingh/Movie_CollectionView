//
//  Model.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//
struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie : Decodable {
    var title: String?
    var description: String?
    var releaseDate: String?
    var posterImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case description = "overview"
        case releaseDate = "release_date"
        case posterImage = "poster_path"
    }
}
 
