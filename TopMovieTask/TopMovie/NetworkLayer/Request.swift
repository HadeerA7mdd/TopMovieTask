//
//  Request.swift
//
//  Created by Hadeer.
//

import Foundation
import Alamofire
import UIKit

class Request {
    class func request<T: Codable>(
        url: String,
        save: Bool,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        headers: HTTPHeaders?,
        callBack: @escaping (Result<T, Error>) -> Void
    ) {
        
        let jsonDecoder = JSONDecoder()
        guard let fullURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            callBack(.failure(EtihadError(statusCode: 0, message: .invalidUrl)))
            return
        }
        
        // Prepare URLRequest for caching
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        if let headers = headers {
            headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.name) }
        }
        
        // Use cache first if save == true or offline
        if save, let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            do {
                let decoded = try jsonDecoder.decode(T.self, from: cachedResponse.data)
                print("Loaded from cache")
                callBack(.success(decoded))
                return
            } catch {
                print(" Cache decoding error: \(error)")
            }
        }
        
        AF.request(fullURL, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try jsonDecoder.decode(T.self, from: data)
                    if save {
                        // Save response to cache manually
                        if let responseURL = response.response?.url, let httpResponse = response.response {
                            let cached = CachedURLResponse(response: httpResponse, data: data)
                            URLCache.shared.storeCachedResponse(cached, for: urlRequest)
                        }
                    }
                    callBack(.success(decoded))
                } catch {
                    print("Decode error: \(error)")
                    callBack(.failure(EtihadError(statusCode: 200, message: .decodingError)))
                }
                
            case .failure(let error):
                print(" Network error: \(error)")
                // Try loading from cache as a fallback
                if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
                    do {
                        let decoded = try jsonDecoder.decode(T.self, from: cachedResponse.data)
                        print("Loaded from cache fallback")
                        callBack(.success(decoded))
                    } catch {
                        callBack(.failure(EtihadError(statusCode: response.response?.statusCode ?? 800, message: .serverError)))
                    }
                } else {
                    callBack(.failure(EtihadError(statusCode: response.response?.statusCode ?? 800, message: .InternetError)))
                }
            }
        }
    }
}


class fileExt {
    static func getMimeType(for url: URL) -> String {
        let pathExtension = url.pathExtension.lowercased()
        switch pathExtension {
        case "jpg", "jpeg":
            return "image/jpeg"
        case "png":
            return "image/png"
        case "pdf":
            return "application/pdf"
        default:
            return "application/octet-stream"
        }
    }
}
