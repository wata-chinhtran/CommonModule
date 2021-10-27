//
//  BaseError.swift
//  TableviewSample
//
//  Created by admin on 2021/04/02.
//

import Foundation

import Foundation

public struct APIError: Codable {
    var code: Int?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message
    }
}

public enum BaseAPIError: Error {
    case parseResponseDataFalse(title: String)
    case requestError(title: String, message: String, code: Int?)

    public var description: String {
        switch self {
        case .parseResponseDataFalse:
            return "Response JSON could not be serialized"
        case .requestError(_, let message,_):
            return message
        }
    }

    public var title: String {
        switch self {
        case .parseResponseDataFalse(let title):
            return title
        case .requestError(_, let title, _):
            return title
        }
    }
    
    public var code: Int? {
        switch self {
        case .requestError(_, _, let code):
            return code
        default: return nil
        }
    }
}

public struct LSErrorResponse: Codable {
    let message: String?
    let errors: [String: [String]]?
    let code: Int?
    let type: String?
    let datetime: String?
    let request_id: String?

    var errorMessage: String {
        var contents = errors?.values.map { $0.joined(separator: "\n") } ?? []
        if let msg = message, contents.count <= 0 {
            contents.insert(msg, at: 0)
        }
        return contents.joined(separator: "\n")
    }
}
