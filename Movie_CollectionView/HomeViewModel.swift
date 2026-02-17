//
//  HomeViewModel.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//
protocol HomeViewModelProtocol {
    func numberOfMovies() -> Int
    func movie(at index: Int) -> Movie?
    func getDataFromServer() async
    func searchMovies(by title: String) -> [Movie]
}

class HomeViewModel: HomeViewModelProtocol {
    private var movies: [Movie] = []
    private var service: NetworkManagerProtocol?
    
    init(service: NetworkManagerProtocol? = nil) {
        self.service = service
    }
    func getDataFromServer() async {
        movies =  await service?.getDataFromServer(url: Server.PostUrl.rawValue) ?? []
        print("checking this message")
    }
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie? {
        guard index >= 0 && index < movies.count else { return nil }
        return movies[index]
    }
    func searchMovies(by title: String) -> [Movie] {
            guard !title.isEmpty else { return movies }

            return movies.filter {
                $0.title!
                    .lowercased()
                    .contains(title.lowercased())
            }
        }
}
