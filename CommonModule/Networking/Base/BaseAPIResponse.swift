//
//  APIResponse.swift
//  TableviewSample
//
//  Created by Admin on 8/10/21.
//

import Foundation

public struct BaseAPIResponse<T: Codable>: Codable {
    var error: APIError?
    var data: T?
    var success = false
    
    enum CodingKeys: String, CodingKey {
        case error, data, success
    }
}
