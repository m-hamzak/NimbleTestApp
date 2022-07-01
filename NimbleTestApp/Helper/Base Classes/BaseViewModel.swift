//
//  BaseViewModel.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import Foundation
import UIKit

protocol BaseViewModelDelegate {
    func showAlert(title:String, message: String)
    func showProgress(view: UIView, message:String?)
    func hideProgress()
}

protocol BaseViewModel {
    var delegate : Any! {get set}
    func bootStrap()
}

// MARK:-
extension BaseViewModelDelegate{
    
    func showProgress(view: UIView, message:String?){
        hideProgress()
      //  ABProgressHUD.showProgress(forView: view, withMessage: message)
    }
    
    func hideProgress(){
     //   ABProgressHUD.hideProgress()
    }
}
