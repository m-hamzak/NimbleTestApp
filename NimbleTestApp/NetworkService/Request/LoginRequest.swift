//
//  LoginRequest.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 05/07/2022.
//

import Foundation
import ObjectMapper

class LoginRequest: BaseRequest {
    
    var grant_type: String?
    var email: String?
    var password: String?
    var client_id: String?
    var client_secret : String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    init(grant_type: String?, email: String?, password: String?, client_id: String?,client_secret: String?) {
        super.init()
        self.grant_type = grant_type
        self.email = email
        self.password = password
        self.client_id = client_id
        self.client_secret = client_secret

    }
    
    override func mapping(map: Map) {
        grant_type <- map["grant_type"]
        email <- map["email"]
        password <- map["password"]
        client_id <- map["client_id"]
        client_secret <- map["client_secret"]
    }
}
