//
//  MovieDetailsUseCase.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation
import Alamofire


class MovieDetailsUseCase{
    
    func getMovieDetails(movieId: Int,
                   callBack: @escaping (Result<MovieDetail, Error>) -> Void) {
        
        Request.request(url: URLs.Instance.getDetails(movieID: movieId),
                        save: true,
                        method: .get,
                        parameters: nil,
                        encoding: URLEncoding.default,
                        headers: URLs.Instance.getHeader(withContent: false),
                        callBack: callBack)
    }
    
    

 
}
