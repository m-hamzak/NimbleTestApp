//
//  BaseNavigationController.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {

    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                          NSAttributedString.Key.font: UIFont(name:"Arial", size: 20)!]
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackBarButton()
        setupNavigationBar()
    }
    

    
    func setupBackBarButton() { // BaseViewController
        self.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
    }
    
    //MARK:-
    func setupNavigationBar(){
        
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.tintColor = UIColor.white
        setGradientNavigationBar()
        
    }
    
    func setGradientNavigationBar(){
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = nil
        
//        if let image = UIImage.getImageFrom(gradientLayer: getGradienLayer()) {
//            navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//        }
    }
    
    func setTransparentNavigationBar(){
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
    func getGradienLayer() -> CAGradientLayer{
        let layer = CAGradientLayer()
        var bounds = navigationBar.bounds
        bounds.size.height += UIApplication.shared.delegate?.window??.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 50
        layer.frame = bounds
        //layer.colors = [UIColor.Palette.luckyPoint2.cgColor, UIColor.Palette.astronaut.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 0)
        return layer
    }

}
