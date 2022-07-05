//
//  RequestBuilder.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 04/07/2022.
//

import Foundation

class RequestBuilder: NSObject {

    static var shared = RequestBuilder()
    let url = try! URLConstant.base.asURL()

    func getRequestForLogin(_ params:LoginRequest) -> Request{
        let request = Request(httpMethod: .post, url: url.appendingPathComponent(URLConstant.loginCustomer))
        request.body = params.toJSON()
        return request
    }

}
