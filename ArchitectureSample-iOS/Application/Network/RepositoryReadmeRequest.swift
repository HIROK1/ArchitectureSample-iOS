//
//  RepositoryReadmeRequest.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/16.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct RepositoryReadmeRequest: Request {
    
    let owner: String
    let repo: String
    
    var baseURL: URLComponents? {
        return URLComponents(string: "https://api.github.com")
    }
    
    var path: String {
        return "/repos/\(owner)/\(repo)/readme"
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var headerFields: [String : String] {
        return ["Accept": "application/vnd.github.v3+json"]
    }
    
    var requestBody: [String : Any?] {
        return [:]
    }
}
