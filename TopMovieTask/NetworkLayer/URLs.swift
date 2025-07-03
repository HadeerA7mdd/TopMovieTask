//
//  URLs.swift

//  Created by Hadeer.
//

import Foundation
import Alamofire

class URLs {
    static let Instance = URLs()
    private init() {}
    
        func getHeader(withContent: Bool) -> HTTPHeaders {
            var header: [HTTPHeader] = [
                .authorization(bearerToken:"eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YzNlNzhlNWNlNDcyNTA4YTY1N2I3ZWQ2NGVjNmUzNyIsIm5iZiI6MTc1MTM3NzcxMC43MTgwMDAyLCJzdWIiOiI2ODYzZTcyZWNkMjY2MjExYTMyYmUxNmEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.rrFZKe3w5vYOTaUvVC-yyTxov_neDsKPIg54r4b5UOM")
            ]
            if withContent {
                header.append(HTTPHeader.contentType("application/json"))
                header.append(HTTPHeader.accept("application/json"))
            }
            return HTTPHeaders(header)
        }
    

    
    let url = "https://api.themoviedb.org/3/"
    

    func getHomeMovie(pagee : Int) -> String {
        return url + "movie/popular?language=en-US&page=\(pagee)"
    }
    
    func addFav() -> String {
        return url + "account/22114961/favorite"
    }
    
    func getDetails(movieID : Int) -> String {
        return url + "movie/\(movieID)?language=en-US"
    }

    

}
