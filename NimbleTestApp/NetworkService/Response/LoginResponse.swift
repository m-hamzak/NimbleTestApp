//
//  LoginResponse.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 05/07/2022.
//

import Foundation
import ObjectMapper

class LoginResponse: BaseResponse {
    
    var id: String?
    var type: String?
    var token: String?
    var access_token: String?
    var token_type: String?
    var expires_in: Int?
    var created_at: Int?
    
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        id              <- map["id"]
        type              <- map["type"]
        token              <- map["attributes.token"]
        access_token             <- map["attributes.access_token"]
        token_type              <- map["attributes.token_type"]
        expires_in              <- map["attributes.expires_in"]
        created_at              <- map["attributes.created_at"]
        
    }
}
