//
//  HomeViewModel.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation
protocol HomeViewModelProtocol{
    var bindSucessResultToViewController: (() -> ())? { get set }
    var bindErrorResultToViewController: ((_ msg: String) -> ())? { get set }
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)? { get set }
    
    func getMovie()
    func addMovieFavourite(movieId: Int, index: Int)
    func getMovieDataCount() -> Int
    func getMovieByIndex(index: Int) -> Movie?
    
    func paginationAction(index: Int)
    func handleEditMovieFav(index: Int)
    func emptyDataAndGetData()
}

 
class HomeViewModel: HomeViewModelProtocol{
    var movieUseCase: HomeUseCase = HomeUseCase()
    var bindSucessResultToViewController: (() -> ())?
    var bindErrorResultToViewController: ((_ msg: String) -> ())?
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)?
    
    var movieData: MovieResponse?
     
    var currentPage = 1
    var totalPages = 1

    
    var isLoading: Bool = false {
        didSet {
            showLoadingIndicator?(isLoading)
        }
    }
    
    func getMovieDataCount() -> Int{
        movieData?.results?.count ?? 0
    }
    
    func getMovieByIndex(index: Int) -> Movie?{
        return movieData?.results?[index]
    }
    
    
    func paginationAction(index: Int){
        if index == (movieData?.results?.count ?? 0) - 1 {
            if currentPage < totalPages {
                isLoading = true
                currentPage = currentPage + 1
                getMovie()
            }
        }else{}
    }
    
    func handleData(data: MovieResponse?){
        totalPages = data?.totalPages ?? 1
        
        if currentPage == 1{
            self.movieData = data
        }else{
            let count = data?.results?.count ?? 0
            for e in 0..<count {
                if let newData = data?.results?[e]{
                    self.movieData?.results?.append(newData)
                }
            }
        }
        DispatchQueue.main.async{ [weak self] in
            self?.bindSucessResultToViewController?()
        }
    }
    
    // MARK: - Edit Movie Fav
    func handleEditMovieFav(index: Int){
        let movieId = movieData?.results?[index].id ?? 0
        let isFav = movieData?.results?[index].isFav ?? false
        if isFav == false{
            addMovieFavourite(movieId: movieId, index: index)
        }
    }
    
    func handleSucessEditBrandFav(index: Int, isFav: Bool){
        movieData?.results?[index].isFav = isFav
        DispatchQueue.main.async{ [weak self] in
            self?.bindSucessResultToViewController?()
        }
    }
    
    func emptyDataAndGetData(){
        movieData = nil
        DispatchQueue.main.async{ [weak self] in
            self?.bindSucessResultToViewController?()
        }
        
        currentPage = 1
        totalPages = 1
        getMovie()
    }
}

// MARK: - Get API
extension HomeViewModel{
    func getMovie() {
        
        movieUseCase.getHomeMovies(page: currentPage ){ [weak self] result in
            switch result {
            case .success(let data):
               self?.handleData(data: data)
            case .failure(let error):
                if let error = error as? EtihadError {
                    self?.bindErrorResultToViewController?(error.message.rawValue)
                }else{
                    self?.bindErrorResultToViewController?((error as? ErrorModel)?.msg ?? "")
                }
            }
        }
    }
    
    // MARK: - brand Fav
    func addMovieFavourite(movieId: Int, index: Int) {
        movieUseCase.addTofav(movieID: movieId) { [weak self] result in
            switch result {
            case .success(let data):
                if data.success == true {
                    self?.handleSucessEditBrandFav(index: index, isFav: true)
                }else{
                    self?.bindErrorResultToViewController?(data.status_message ?? "")
                }
            case .failure(let error):
                if let error = error as? EtihadError {
                    self?.bindErrorResultToViewController?(error.message.rawValue)
                }else{
                    self?.bindErrorResultToViewController?((error as? ErrorModel)?.msg ?? "")
                }
            }
        }
    }
    
}
