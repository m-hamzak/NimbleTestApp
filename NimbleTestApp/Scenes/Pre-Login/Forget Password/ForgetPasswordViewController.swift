//
//  ForgetPasswordViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class ForgetPasswordViewController: BaseViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSend(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
}
