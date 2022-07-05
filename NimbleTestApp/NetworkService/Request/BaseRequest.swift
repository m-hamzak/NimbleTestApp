//
//  BaseRequest.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 05/07/2022.
//

import Foundation
import ObjectMapper

class BaseRequest: Mappable{
    
    init() {
        
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
    }
}
