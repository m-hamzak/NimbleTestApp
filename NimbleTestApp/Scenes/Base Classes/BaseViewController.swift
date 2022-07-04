//
//  BaseViewController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self.navigationController as? UINavigationControllerDelegate
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem =  UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        (self.navigationController as?
            BaseNavigationController
        )?.setupBackBarButton()
    }
    


}
