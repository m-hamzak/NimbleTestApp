//
//  StoryboardHandler.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.

import Foundation
import UIKit

enum StoryboardHandler : String {
    
    case Main
    case PreLogin
    
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController> (viewControllerClass: T.Type) -> T {
        let storyboardID  = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromStoryboard storyboardHandler : StoryboardHandler) -> Self {
        return storyboardHandler.viewController(viewControllerClass: self)
    }
}
