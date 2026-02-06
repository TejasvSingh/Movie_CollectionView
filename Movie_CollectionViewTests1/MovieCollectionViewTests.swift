//
//  MovieCollectionViewTests.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/5/26.
//

import XCTest
@testable import Movie_CollectionView
final class Movie_CollectionViewTests: XCTestCase {
    var objHomeViewModel: HomeViewModel?

    override func setUpWithError() throws {
        objHomeViewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        //objHomeViewModel = nil
    }
    func testnumberOfMovies(){
        XCTAssertEqual(objHomeViewModel?.numberOfMovies(),0)
    }
    func testMovie(){
        XCTAssertNil(objHomeViewModel?.movie(at: 0))
    }
}
