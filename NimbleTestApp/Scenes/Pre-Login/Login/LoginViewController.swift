//
//  ViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: TranslucentTextField!
    @IBOutlet weak var passwordTextField: TranslucentTextField!
    @IBOutlet weak var loginButton: DefaultButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupData()
    }
    
    func setupView(){
        
    }
    
    func setupData(){
        
    }
    

    @IBAction func didTapForgetPassword(_ sender: Any) {
        
        let vc = ForgetPasswordViewController.instantiate(fromStoryboard: .PreLogin)
        self.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
        
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        
//        let vc = HomeViewController.instantiate(fromStoryboard: .Main)
//        UIApplication.shared.delegate?.window??.rootViewController = vc
//        self.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        mainLogin()
    }
    
    func mainLogin(){
        
        loginCustomer { loginResponse in
            print(loginResponse)
        }
    }
    
    func loginCustomer( callBack : @escaping ((_ loginResponse: LoginResponse?) -> Void) ){
        
        let loginRequest = LoginRequest.init(grant_type: "password",
                                             email: "dev@nimblehq.co",
                                             password: "12345678",
                                             client_id: "ofzl-2h5ympKa0WqqTzqlVJUiRsxmXQmt5tkgrlWnOE",
                                             client_secret: "lMQb900L-mTeU-FVTCwyhjsfBwRCxwwbCitPob96cuU")
       
        
        NetworkService.login(loginRequest) { (result) in
            switch result{
            case .success(let response):
                
//                guard response.code == 1 else{
//                    callBack(response)
//                    return
//                }
                
                callBack(response)
            
            case .failure(let error):
                print(error)
                callBack(nil)
            }
        }
    }
    
}

