//
//  RequestManager.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 04/07/2022.
//


import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

protocol RequestProcessorDelegate{
    func processRequest(_ request:Request) -> Void
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

class RequestManager: NSObject {
    
    static let timeoutInterval = 90.0 //seconds
    static let shared = RequestManager()
    
    fileprivate override init() {
    }

    
    fileprivate let sessionManager: Alamofire.Session = {

            return getSession()

    }()
    
    fileprivate static func getSession() -> Alamofire.Session{
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = RequestManager.timeoutInterval
        configuration.urlCache = nil
        return Alamofire.Session(configuration: configuration)
    }
    
//    fileprivate static func getSessionForSSl() -> Alamofire.SessionManager{
//
//        let serverHost:String = URLConstant.base
//        let pathToCert = Bundle.main.path(forResource: "khcbmBankingProductionSSL", ofType: "cer")
//        let pathToStagingCert = Bundle.main.path(forResource: "khcbStagingSSL", ofType: "cer")
//        let prodCertificate:NSData = NSData(contentsOfFile: pathToCert!)!
//        let stagingCertificate:NSData = NSData(contentsOfFile: pathToStagingCert!)!
//
//        let serverTrustPolicy = ServerTrustPolicy.pinCertificates(
//            certificates: [SecCertificateCreateWithData(nil, prodCertificate)!,
//                           SecCertificateCreateWithData(nil, stagingCertificate)!],
//            validateCertificateChain: true,
//            validateHost: true
//        )
//
//        let serverTrustPolicies : [String: ServerTrustPolicy] = [
//          serverHost: serverTrustPolicy
//        ]
//
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = timeoutInterval // seconds
//        configuration.urlCache = nil
//
//        return Alamofire.SessionManager(
//            configuration: configuration ,
//            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
//        )
//    }

//
//    func performRequest(request:Request,completion: @escaping (_ response:BaseResponse) -> Void){
//
//        if let body = request.body as? Parameters{
//
//            sessionManager.request(request.url, method: request.httpMethod, parameters: body, encoding: JSONEncoding.default, headers: request.header).responseJSON { response in
//
//
//            }
//
//    }
   // func performRequest<T: Mappable>(request:Request,completion: @escaping (_ response: Result<T>) -> Void) {
    
    func performRequest(request:Request,completion: @escaping (_ response: BaseResponse) -> Void) {

        printRequest(request: request)
        if let body = request.body as? Parameters{
            
            sessionManager.request(request.url, method: request.httpMethod, parameters: body, encoding: JSONEncoding.default, headers: request.header).responseJSON { response in
                
                //Prints Response returned from server
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    self.printResponse(urlString: request.url.absoluteString, string: utf8Text)
                }
                
                switch response.result{
                case .success:
                   // if let result = response.result {
                       // print("Moiz \(result.toJSON()["code"] as? Int ?? 0))")
//                        if self?.checkErrorCode(errorCode: result.toJSON()["code"] as? Int ?? 0) ?? false{
//                            SessionManager.shared.logoutCustomerOnResponseFailure()
//                            return }
                    completion(Result.success(response.result))
                   // }
                case .failure(let error):
                    if self?.checkErrorCode(errorCode: response.result.value?.toJSON()["code"] as? Int ?? 0) ?? false {
                        SessionManager.shared.logoutCustomerOnResponseFailure()
                        return
                    }
                    print(error)
                    completion(Result.failure(error))
                }
            }
        }
        else{
            var urlRequest = URLRequest(url: request.url)
            urlRequest.headers = request.header
            urlRequest.httpBody = (request.body as? String)?.data(using: .utf8)
            urlRequest.httpMethod = request.httpMethod.rawValue
            sessionManager.request(urlRequest).responseString {  (response) in
                
                //sessionManager.request(request.url!, method: request.httpMethod, parameters: nil, encoding: JSONEncoding.default, headers: request.header).responseObject { (response:DataResponse<T>) in
                
                // sessionManager.request(urlRequest).responseObject { (response:DataResponse<T>) in
                
                //Prints Response returned from server
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("server response = \(utf8Text)")
                    self.printResponse(urlString: request.url.absoluteString, string: utf8Text)
                    request.response = utf8Text

                }
                
                switch response.result{
                case .success:
                    //request.response = response.result.value
                    //   self.postprocessRequest(request
                    if let resp = request.response as? [String : Any]{
                        print(resp)
                       // request.response = T.init(JSON: resp)
                       // completion(Result.success(request.response as! T))
                        completion(request.response as! BaseResponse)
                    }
                    else{
                        let resp = ["code":0, "message":"Invalid Response"] as [String : Any]
                        print(resp)
                        //request.response = T.init(JSON: resp)
                        completion(request.response as! BaseResponse)
                    }
                    
                case .failure(let error):
                    completion(request.response as! BaseResponse)
                }
            }
        }
    }
    
//    func download(request:Request, type: K.FileType? = nil, completion: @escaping (_ destinationURL: URL?) -> Void) {
//
//        preprocessRequest(request)
//        printRequest(request: request)
//
//
//        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
//            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//
//            //create folder in files if fileType is defined
//            if let fileType = type{
//                documentsURL.appendPathComponent(fileType.rawValue, isDirectory: true)
//            }
//            documentsURL.appendPathComponent(request.url.lastPathComponent)
//            return (documentsURL, [.removePreviousFile, .createIntermediateDirectories])
//
//        }
//
//        Alamofire.download(request.url, method: request.httpMethod, parameters: nil, encoding: JSONEncoding.default, headers: request.header, to: destination)
//            .responseData { response in
//                if response.result.isSuccess{
//                    print("PDF Downloaded successfully: \(response.destinationURL?.absoluteString ?? String())")
//
//                    completion(response.destinationURL)
//                }else {
//                    completion(nil)
//                }
//            }
//    }
    
//    fileprivate func preprocessRequest(_ request: Request){
//        for preprocessor in request.preprocessors{
//            let mypreprocessor:RequestProcessorDelegate = preprocessor as! RequestProcessorDelegate
//            mypreprocessor.processRequest(request)
//        }
//    }
//
//    fileprivate func postprocessRequest(_ request: Request){
//        for postprocessor in request.postprocessors{
//            let mypostprocessor: RequestProcessorDelegate = postprocessor as! RequestProcessorDelegate
//            mypostprocessor.processRequest(request)
//        }
//    }
    

    
    
    func printResponse(urlString: String, string: String){
        
        if let responseDict = convertToDictionary(text: string){
            print("/*************** \(urlString.components(separatedBy: "/").last ?? "") Response Starts ***************/ \n\n\(responseDict) \n\n/*************** \(urlString.components(separatedBy: "/").last ?? "") Response Ends ***************/ \n\n")
        }
    }
    
    func printRequest(request: Request){
        
        print("\n/*************** \(request.url.absoluteString.components(separatedBy: "/").last ?? "") Request Starts ***************/\n")
        print("Url = \(request.url!)")
        print("Headers = \(request.header)")
        print("Body = \(request.body ?? "")")
        print("\n/*************** \(request.url.absoluteString.components(separatedBy: "/").last ?? "") Request Ends ***************/ \n\n")
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func checkErrorCode(errorCode: Int) -> Bool{
        if (errorCode == 401){
           // SessionManager.shared.logoutCustomerOnResponseFailure()
            return true
        }
        return false
    }
}
