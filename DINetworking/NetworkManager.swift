//
//  NetworkManager.swift
//  DISample
//
//  Created by NguyenHoang on 6/17/21.
//

import UIKit
import Moya

public class NetworkManager {
    
    static let instance = NetworkManager()
    var token: String = ""
    var baseUrl:String = ""
    var provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()])
   
    public func setToken(token: String){
        self.token = token
    }
    public func setBaseUrl(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    public func request<T: Decodable>(target: MultiTarget, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
