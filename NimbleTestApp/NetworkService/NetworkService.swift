//
//  NetworkService.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 05/07/2022.
//

import Foundation

class NetworkService: NSObject {
    
    static let requestManager = RequestManager.shared
    
    private override init() {}
    
    public static func login(_ params:LoginRequest,completion: @escaping (_ result: Result<LoginResponse>)->Void){
        let request = RequestBuilder.shared.getRequestForLogin(params)
        
        requestManager.performRequest(request: request) { (result) in
            
            completion(result)
        }
    }
    
}
