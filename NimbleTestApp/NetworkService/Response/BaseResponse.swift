//
//  BaseResponse.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 05/07/2022.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    var id: Int?
    var type: String?
    var data: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        
//        if code == nil {
//            var codeInstring: String = ""
//            codeInstring <- map["code"]
//            code = Int(codeInstring)
//        }
    }
}
