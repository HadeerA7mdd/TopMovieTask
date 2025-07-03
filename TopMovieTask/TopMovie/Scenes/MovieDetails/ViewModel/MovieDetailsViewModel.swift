//
//  MovieDetailsViewModel.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation

protocol MovieDetailsProtocol{
    var bindSucessResultToViewController: (() -> ())? { get set }
    var bindErrorResultToViewController: ((_ msg: String) -> ())? { get set }
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)? { get set }
    func getMovieDeatils(movieID : Int)
    func getMovieData() -> MovieDetail?
   
}

 
class MovieDetailsViewModel: MovieDetailsProtocol{

    
    var movieUseCase: MovieDetailsUseCase = MovieDetailsUseCase()
    var bindSucessResultToViewController: (() -> ())?
    var bindErrorResultToViewController: ((_ msg: String) -> ())?
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)?
    var movieData: MovieDetail?
     
  
    var isLoading: Bool = false {
        didSet {
            showLoadingIndicator?(isLoading)
        }
    }
 
    
    func handleData(data: MovieDetail?){
        self.movieData = data
        DispatchQueue.main.async{ [weak self] in
            self?.bindSucessResultToViewController?()
        }
    }
 
    func getMovieData() -> MovieDetail? {
        return movieData
    }
}

// MARK: - Get API
extension MovieDetailsViewModel{
    func getMovieDeatils(movieID : Int) {
        movieUseCase.getMovieDetails(movieId : movieID){ [weak self] result in
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
    

}
