//
//  APIClient.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/05.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

protocol APIClientRequest {
    func send(_ request: Request, completion: @escaping ((Data?, URLResponse?, Error?) -> Void))
}

protocol Request {
    var baseURL: URLComponents? { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var method: HttpMethod { get }
    var headerFields: [String: String] { get }
    var requestBody: [String: Any?] { get }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

struct APIClient: APIClientRequest {
    
    func send(_ request: Request, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        
        var urlComps = request.baseURL
        urlComps?.path = request.path
        urlComps?.queryItems = request.queryItems
        guard let url = urlComps?.url else { return }

        var _request = URLRequest(url: url)
        _request.httpMethod = request.method.rawValue
        _request.allHTTPHeaderFields = request.headerFields
        _request.timeoutInterval = 30
        
        Logger.apiRequestLogger(_request)
        
        URLSession.shared.dataTask(with: _request) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
}
