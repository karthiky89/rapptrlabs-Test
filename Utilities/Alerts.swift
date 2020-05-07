//
//  Alerts.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/28/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import Foundation
import UIKit

struct Alerts {

    private static func generateAlert (on vc: UIViewController, with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true)}
        
    }
    
    static func EmptyUserAlert(on vc:UIViewController){
        generateAlert(on: vc, with: "Invalid Details", message: "Please enter valid UserID")
    }
    
    static func EmptyPasswordAlert(on vc:UIViewController){
        generateAlert(on: vc, with: "Invalid Details", message: "Please enter valid Password")
    }
    
    // create alerts for possible scenarios on app
    static func noUserInputAlert(on vc:UIViewController){
        generateAlert(on: vc, with: "Data Error", message: "Please enter details to login")
    }
    
    static func badrequest(on vc:UIViewController){
        generateAlert(on: vc, with: "Data Error", message: "Invalid Parameters ")
    }
    
    static func loginSucess(on vc:UIViewController){
        generateAlert(on: vc, with: "Success", message: "you have Successfully logged -in")
    }
    
}
