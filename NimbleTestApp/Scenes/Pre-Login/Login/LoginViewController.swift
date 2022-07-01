//
//  ViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapForgetPassword(_ sender: Any) {
        
        let vc = ForgetPasswordViewController.instantiate(fromStoryboard: .Main)
        self.present(vc, animated: true,completion: nil)
        
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        
        let vc = HomeViewController.instantiate(fromStoryboard: .Main)
        UIApplication.shared.delegate?.window??.rootViewController = vc
        self.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
}

