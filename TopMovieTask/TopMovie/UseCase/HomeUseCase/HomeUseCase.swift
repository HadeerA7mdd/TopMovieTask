//
//  HomeUseCase.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation
import Alamofire

class HomeUseCase{
    
    func getHomeMovies(page: Int,
                   callBack: @escaping (Result<MovieResponse, Error>) -> Void) {
        
        let parameters = ["page": page,
                          
        ] as [String : Any]
        print(parameters)
        
        Request.request(url: URLs.Instance.getHomeMovie(pagee: page),
                        save: true,
                        method: .get,
                        parameters: parameters,
                        encoding: URLEncoding.default,
                        headers: URLs.Instance.getHeader(withContent: false),
                        callBack: callBack)
    }
    
    
    func addTofav(movieID : Int,
                  callBack: @escaping (Result<AddFav, Error>) -> Void){
        let parameters = ["media_id": movieID,
                          "media_type" : "movie" ,
                          "favorite" : true
        ] as [String : Any]
        print(parameters)
        
        Request.request(url: URLs.Instance.addFav(),
                        save: true,
                        method: .post,
                        parameters: parameters,
                        encoding: URLEncoding.default,
                        headers: URLs.Instance.getHeader(withContent: false),
                        callBack: callBack)
    }
 
}
