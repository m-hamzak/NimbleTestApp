//
//  Palette.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(rgb: UInt,alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    struct Palette {
        
//        public static let primary            = UIColor.init(rgb: UInt(0x5AA0C1))
//        public static let secondary            = UIColor.init(rgb: UInt(0x475362))
        public static let black            = UIColor.init(rgb: UInt(0x000000))
        public static let white            = UIColor.init(rgb: UInt(0xFFFFFF))
        public static let glass      = UIColor.init(rgb: UInt(0xFFFFFF),alpha: 0.18)
        public static let translucent      = UIColor.init(rgb: UInt(0xFFFFFF),alpha: 0.3)
    }
}
