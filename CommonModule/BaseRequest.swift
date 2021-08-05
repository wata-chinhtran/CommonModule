//
//  BaseRequest.swift
//  DISample
//
//  Created by NguyenHoang on 6/17/21.
//

import Foundation
import Moya

public protocol BaseRequest : TargetType {
    var body:[String: Any] {get}
}
extension BaseRequest {
    
    public var baseURL: URL {
        return URL(string: NetworkManager.instance.baseUrl)!
    }
    
    public var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    public var headers: [String: String]? {
        return ["Content-Type": "application/json",
                "AccessToken":NetworkManager.instance.token]
    }
    public var path: String {
        return "/"
    }
    
    
    
    public var body: [String : Any] {
        get {
            return [:]
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    public var task: Task {
        return .requestPlain
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
