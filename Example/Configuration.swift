//
//  Configuration.swift
//  Example
//
//  Created by Tran Tuan Vu on 09/10/2021.
//

import Foundation
enum Configuration: String {

    // MARK: - Configurations

    case staging
    case production
    case release

    // MARK: - Current Configuration

    static let current: Configuration = {
           guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
               fatalError("No Configuration Found")
           }

           guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
               fatalError("Invalid Configuration")
           }

           return configuration
       }()
    
    // MARK: - Base URL

       static var baseURL: URL {
           switch current {
           case .staging:
               return URL(string: "https://staging.com")!
           case .production, .release:
               return URL(string: "https://production.com")!
           }
       }
    
    enum APIKey{
        static let apiKey: String = {
                  switch Configuration.current {
                  case .staging:
                      return "123"
                  case .production:
                      return "456"
                  case .release:
                      return "789"
                  }
              }()

    }
}
