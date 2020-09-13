//
//  SearchRepositoryRequest.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/11.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct GitHubRequest: Request {
    
    let value: String
    
    var baseURL: URLComponents? {
        return URLComponents(string: "https://api.github.com")
    }
    
    var path: String {
        return "/search/repositories"
    }
    
    var queryItems: [URLQueryItem] {
        return [URLQueryItem(name: "q", value: value)]
    }
       
    var method: HttpMethod {
        return .get
    }
    
    var headerFields: [String : String] {
        return ["Accept": "application/vnd.github.v3+json"]
    }
    
    var requestBody: [String: Any?] {
        return [:]
    }
}

