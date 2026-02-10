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

struct Movie : Decodable{
    var original_title: String?
    var overview: String?
    var release_date: String?
    var poster_path: String?
}
