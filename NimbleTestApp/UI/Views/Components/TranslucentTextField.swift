//
//  TranslucentTextField.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import UIKit

class TranslucentTextField: UITextField {

    public static var bgColor : UIColor = UIColor.Palette.glass
    public static var placeholderColor : UIColor = UIColor.Palette.translucent
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }
    
    public func setupTextField(){
        self.backgroundColor = TranslucentTextField.bgColor
        self.attributedPlaceholder = NSAttributedString(
            string: self.placeholder != nil ? self.placeholder! : "",
            attributes: [NSAttributedString.Key.foregroundColor: TranslucentTextField.placeholderColor]
        )
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: (UIDevice.current.userInterfaceIdiom == .pad) ? K.ButtonConfig.heightForIpad : K.ButtonConfig.heightForIphone).isActive = true
        self.clipsToBounds = true
        self.layer.cornerRadius = (UIDevice.current.userInterfaceIdiom == .pad) ? K.ButtonConfig.cornerRadiusForIpad : K.ButtonConfig.cornerRadiusForIphone
        
     
    }
    
    public func setCornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    public func setBackGroundColor(color:UIColor){
        self.backgroundColor = color
        
    }
    public func setTextFieldHeight(height:CGFloat){
        self.frame.size.height = height
    }
    public func setPlaceholder(placeholder:String){
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: TranslucentTextField.placeholderColor]
        )

    }


}
