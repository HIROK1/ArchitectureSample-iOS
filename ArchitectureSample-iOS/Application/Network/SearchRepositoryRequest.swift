//
//  SearchRepositoryRequest.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/09/11.
//  Copyright © 2020 Hiroki. All rights reserved.
//

struct GitHubRequest: Request {
    
    var query: String
    
    var baseURL: String {
        return "https://api.github.com"
    }
    
    var path: String {
        return "/search/repositories"
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var headerFields: [String : String] {
        return ["Accept": "application/vnd.github.v3+json"]
    }
    
    var requestBody: [String: Any?] {
        return ["q": query]
    }
}

