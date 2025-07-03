//
//  ErrorModel.swift
//
//  Created by Hadeer.
//

import Foundation

struct EtihadError: Error {
    var statusCode  : Int
    var message     : ErrorMessage
    
    init(statusCode: Int, message: ErrorMessage) {
        self.statusCode = statusCode
        self.message    = message
    }
}

enum ErrorMessage: String {
    case decodingError // = "The Response From The Server Was In Invalid Format"
    case serverError // = "There Was An Error In Server, Please Try Agin Later!"
    case InternetError // = "The Internet connection appears to be offline."
    case invalidUrl
    var localizedDescription: String {
        switch self {
        case .decodingError:
            return NSLocalizedString("The Response From The Server Was In Invalid Format", comment: "")
        case .serverError:
            return NSLocalizedString("There Was An Error In Server, Please Try Agin Later!", comment: "")
        case .InternetError:
            return NSLocalizedString("The Internet connection appears to be offline.", comment: "")
        case .invalidUrl :
            return NSLocalizedString("Url is invalis", comment: "")
        }
    }
    
    var rawValue: String {
        return self.localizedDescription
    }
}

// MARK: - ErrorModel
struct ErrorModel: Codable, Error {
    var msg: String?
    var statusCode: Int?
    var success: Bool?
}


