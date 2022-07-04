//
//  DefaultButton.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//


import UIKit

class DefaultButton: UIButton {
    
    
    public static var bgColor : UIColor = UIColor.Palette.white
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    public func setTitle(color:UIColor, size:CGFloat,familyName:String){
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = UIFont(name: familyName, size: size)
    }
    
    public func setupButton(){
        self.backgroundColor = DefaultButton.bgColor
        self.setTitleColor(UIColor.Palette.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: (UIDevice.current.userInterfaceIdiom == .pad) ? K.ButtonConfig.heightForIpad : K.ButtonConfig.heightForIphone).isActive = true
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: (UIDevice.current.userInterfaceIdiom == .pad) ? K.ButtonConfig.titleHeightForIpad : K.ButtonConfig.titleHeightForIphone, weight: .regular)
        self.clipsToBounds = true
        self.layer.cornerRadius = (UIDevice.current.userInterfaceIdiom == .pad) ? K.ButtonConfig.cornerRadiusForIpad : K.ButtonConfig.cornerRadiusForIphone
     
    }
    
    public func setCornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    public func setBackGroundColor(color:UIColor){
        self.backgroundColor = color
        
    }
    public func setButtonHeight(height:CGFloat){
        self.frame.size.height = height
    }
    func setBackGroundImage(bgImage:UIImage ){
        self.setBackgroundImage(bgImage, for: .normal)
        self.backgroundColor = UIColor.clear
    }
    
}
