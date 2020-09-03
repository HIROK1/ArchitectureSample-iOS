//
//  Logger.swift
//  ArchitectureSample-iOS
//
//  Created by Hiroki on 2020/08/20.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

struct Logger {
    
    private init() {}
    
    static func apiRequestLogger(_ URLRequest: URLRequest) {
        
        let jsonObject = ""
        
        var log: String = ""
        
        log += "\n🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
        log += "\n*******************************************************************************"
        log += "\n\(URLRequest.url!)へのリクエスト"
        log += "\n*******************************************************************************"
        log += "\n【URLRequest AllHTTPHeaderFields】"
        log += "\n\(URLRequest.allHTTPHeaderFields!)"
        log += "\n【URLRequest URL】"
        log += "\n\(URLRequest.url!)"
        log += "\n【URLRequest Method】"
        log += "\n\(URLRequest.httpMethod!)"
        log += "\n【URLRequest Body】"
        log += "\n\(jsonObject)"
        log += "\n🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
        
        print(log)
    }
    
    static func apiResponseLogger(_ URLResponse: HTTPURLResponse, _ object: String) {
        
        var log: String = ""
        
        log += "\n🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
        log += "\n*******************************************************************************"
        log += "\n\(URLResponse.url!)のレスポンス"
        log += "\n*******************************************************************************"
        log += "\n【URLResponse AllHTTPHeaderFields】"
        log += "\n\(URLResponse)"
        log += "\n【URLResponse URL】"
        log += "\n\(URLResponse.url!)"
        log += "\n【URLResponse StatusCode】"
        log += "\n\(URLResponse.statusCode)"
        log += "\n【URLRequest Body】"
        log += "\n\(object)"
        log += "\n🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
        
        print(log)
    }
}
