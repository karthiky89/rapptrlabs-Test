//
//  CustomLoginScreenButton.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/27/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import Foundation
import UIKit

class CustomLoginButton: UIButton{
    
    //Initializer
    override init(frame: CGRect) {
        super .init(frame: frame)
        SetUpButton ()
    }
    
    required init?(coder adecoder: NSCoder) {
        super .init(coder: adecoder)
        LoginButton()
    }
    
    // setup button
    func SetUpButton (){
        
        //call a private function so others classes can't call this function.
        LoginButton()
        
    }
    
    
     func LoginButton() {
        // Implement button changes
        layer.cornerRadius = 28
        layer.opacity = 0.8
        setTitleColor( UIColorFromRGB(rgbValue: 0x1B1E1F), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        
    }
    
    // get RGB color value for HexCode
    public func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

