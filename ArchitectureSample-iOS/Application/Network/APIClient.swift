//
//  APIClient.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/05.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol APIClientRequest {
    func send(_ request: Request)
}

enum Method: String {
    case get
    case post
    case put
    case delete
    case patch
}

struct Request {
    let baseURL: String
    let path: String
    let method: Method
}

struct APIClient: APIClientRequest {
    func send(_ request: Request) {
        guard let url: URL = URL(string: request.baseURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
        }.resume()
    }
}
