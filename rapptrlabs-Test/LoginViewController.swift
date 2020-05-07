//
//  LoginViewController.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/27/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

enum LoginDataError : Error{
    case nodata
    case dataError
}

class LoginViewController: UIViewController {
    
    let UIDError = "please provide a userID"
    let PswdError  = "please provide a valid password"
    let entryError = "Please enter details to login"
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let str = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: (UIColorFromRGB(rgbValue: 0x5F6063))])
         self.UsernameTextField.attributedPlaceholder = str
        
        let str1 = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: (UIColorFromRGB(rgbValue: 0x5F6063))])
        self.PasswordTextField.attributedPlaceholder = str1
        
         
        

        
        
        // Do any additional setup after loading the view.
    }
    
    
    //validate  Fields if valid retun  nil else return error(string)
    func validateFields() -> String? {
        
        
        if (UsernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" &&  PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ){
            Alerts.noUserInputAlert(on: self)
            return entryError
            
        }  else if (UsernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "")
        {
            
            Alerts.EmptyUserAlert(on: self)
            return UIDError
            
        } else if (PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "")
        {
            Alerts.EmptyPasswordAlert(on:self)
            return PswdError
        }else if UsernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != nil && PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != nil{
            
        // self.loginwith(email: String, password: String, completion: [weak self] result in)
//            
        }
        return nil
        
    }
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        self.validateFields()
    
    }
    

    
    
    func loginwith(email:String, password:String,completion: @escaping (Result<loginData,LoginDataError>) ->Void ) {
        let dataTask = URLSession.shared.dataTask(with: URL (string:"http://dev.rapptrlabs.com/Tests/scripts/login.php?email=\(String(describing: email))&password=\(String(describing: password))")!) {data, response, error in
            
             
            guard let ApiResponse = data, error == nil else {
                Alerts.badrequest(on :self)
                return
            }
            
            var result : loginData?
            do {
                result =  try JSONDecoder().decode(loginData.self, from: data!)
            }catch{
                print("failed to convert \(error.localizedDescription)")
            }
            
           guard let json = result else {
                return
            }
        }
        dataTask.resume()
        
    }

    
    
}




struct loginData: Decodable{
    var code: String
    var message: String
    
}
