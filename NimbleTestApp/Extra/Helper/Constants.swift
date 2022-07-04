//
//  Constants.swift
//  NimbleTestApp
//
//  Created by Hamza Khalid on 01/07/2022.
//

import Foundation
import UIKit

struct K {

    static let imageViewCornerRadius   : CGFloat = 10.0
    static var cardCornerRadius = 50.0
    
    struct Fonts {
        
        public static let font_Light = "HelveticaNeue"
        public static let font_Regular = "HelveticaNeue"
        public static let font_Medium = "HelveticaNeue-Medium"
        public static let font_SemiBold = "HelveticaNeue-Medium"
        public static let font_Bold = "HelveticaNeue-Bold"
        
        public static let fontNexaLight = "NexaLight"
        public static let fontNexaRegular = "NexaRegular"
        public static let fontNexaBold = "NexaBold"
        
        public static let Font_Roboto_Regular = "Roboto-Regular"
        public static let Font_Roboto_Bold = "Roboto-Bold"
        public static let Font_Roboto_Italic = "Roboto-Italic"
        public static let Font_Navigation_Title = "HelveticaNeue-Light" //"NexaLight" /
        
        public static let Poppins_Regular = "Poppins-Regular" //"NexaLight" /
        
    }
    
    struct ButtonConfig {
        
        static let cornerRadius   : CGFloat = 5.0
        static let heightForIphone : CGFloat = 50
        static let titleHeightForIphone : CGFloat = 12.9
        static let cornerRadiusForIphone : CGFloat = 8
        static let cornerRadiusForIpad : CGFloat = ButtonConfig.cornerRadiusForIphone * 1.75
        static let heightForIpad : CGFloat = ButtonConfig.heightForIphone * 1.75
        static let titleHeightForIpad : CGFloat = ButtonConfig.titleHeightForIphone * 1.50
        
        
    }
}
