//
//  ChatTableViewCell.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/30/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit


class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UserImg: UIImageView!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var chatextlabel: UILabel!
    
    
    
}








@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 8.0
    @IBInspectable var bottomInset: CGFloat = 8.0
    @IBInspectable var leftInset: CGFloat = 8.0
    @IBInspectable var rightInset: CGFloat = 8.0
    @IBInspectable var borderColor: UIColor?
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        layer.borderWidth = 1.0
        layer.cornerRadius = 8.0
        layer.borderColor = borderColor?.cgColor
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
        
    }
}




extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


extension UIImageView {
    
    func drawRoundImage() {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}



extension UIColor {
    
    public func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
