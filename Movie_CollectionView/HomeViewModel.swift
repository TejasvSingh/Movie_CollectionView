//
//  HomeViewModel.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//
protocol HomeViewModelProtocol {
    func numberOfMovies() -> Int
    func movie(at index: Int) -> Movie?
}
class HomeViewModel: HomeViewModelProtocol {
    private var movies: [Movie] = []
    private var service: NetworkManagerProtocol?
    // MARK: Helper Methods
    
    init(service: NetworkManagerProtocol? = nil) {
        self.service = service
        movies = service?.getDataFromServer(url: "https://swapi.dev/api/movies/") ?? []
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie? {
        guard index < movies.count else{
            return nil
        }
        return movies[index]
    }
}
