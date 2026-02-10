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
    var viewModelWithService: HomeViewModel?
    override func setUpWithError() throws {
        objHomeViewModel = HomeViewModel()
        viewModelWithService = HomeViewModel(service: MockNetworkService())
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
    func testSearchEmptyMovies() {
        let results = objHomeViewModel?.searchMovies(by: "greenland")
        XCTAssertEqual(results?.count, 0)
    }
    func testSearchEmptyStringReturnsEmpty() {
        let results = objHomeViewModel?.searchMovies(by: "")
        XCTAssertEqual(results?.count, 0)
    }
    func testMovieAtOutOfBoundsIndex() {
            XCTAssertNil(objHomeViewModel?.movie(at: 100))
        }
    func testGetDataFromServerDoesNotCrash() async throws {
        await objHomeViewModel?.getDataFromServer()
        XCTAssertEqual(objHomeViewModel?.numberOfMovies(), 0)
    }
    func testGetDataFromServerPopulatesMovies() async throws {
            await viewModelWithService?.getDataFromServer()
            XCTAssertEqual(viewModelWithService?.numberOfMovies(), 3)
        }
    func testGetDataFromWithServiceServerPopulatesMovies() async throws {
            await viewModelWithService?.getDataFromServer()
            XCTAssertEqual(viewModelWithService?.numberOfMovies(), 3)
        }
  func testSearchMoviesWithService() async throws {
            await viewModelWithService?.getDataFromServer()
            
            let results1 = viewModelWithService?.searchMovies(by: "Inception")
            XCTAssertEqual(results1?.count, 1)
            XCTAssertEqual(results1?[0].original_title, "Inception")
            
            let results2 = viewModelWithService?.searchMovies(by: "dark")
            XCTAssertEqual(results2?.count, 1)
            XCTAssertEqual(results2?[0].original_title, "The Dark Knight")
            
            let results3 = viewModelWithService?.searchMovies(by: "")
            XCTAssertEqual(results3?.count, 3)
            
            let results4 = viewModelWithService?.searchMovies(by: "Spider-Man")
            XCTAssertEqual(results4?.count, 0)
        }
    
}
