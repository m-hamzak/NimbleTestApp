//
//  Request.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 04/07/2022.
//

import UIKit
import Alamofire

class Request {

    var httpMethod: HTTPMethod!
    var url: URL!
    
    var header: HTTPHeaders = [:]
    var body: Any!
    var response: Any!
    
    fileprivate init() {
    }
    
    public init(httpMethod: HTTPMethod, url: URL) {
        self.httpMethod = httpMethod
        self.url = url
    }
}

