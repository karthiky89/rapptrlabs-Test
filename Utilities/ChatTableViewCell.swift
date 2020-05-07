//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var chatUserlabel: UILabel!

    @IBOutlet weak var chatTextView: UITextView!
    
    @IBOutlet weak var ChatUsrrImg: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCellData  ()
    }
    
    // MARK: - Public
    func setCellData() {
        chatUserlabel.text = "joe"
        chatTextView.text = "TEST DATA"
    }
}
