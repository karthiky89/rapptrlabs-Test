//
//  ViewController.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/27/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var ChatButtonLoginScreen: CustomLoginButton!
    
    @IBOutlet weak var MainLoginButton: CustomLoginButton!
    
    @IBOutlet weak var LoginScreenAnimationButton: CustomLoginButton!
    
    @IBOutlet weak var loginAnimationButtonView: UIView!
    
    @IBOutlet weak var LoginButtonView: UIView!
    
    @IBOutlet weak var LoginChatButtonView: UIView!
    
    // MARK: - Declarations
    var CustomButton = CustomLoginButton()
    var isFaded = Bool()
    
    
    // MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup the buttons upon view  did load
        ChatButtonLoginScreen.SetUpButton()
        MainLoginButton.SetUpButton()
        LoginScreenAnimationButton.SetUpButton()
        
        
        // Do any additional setup after loading the view.
        func SetUpLoginScreen() {
            
            //********************************************************************************* //Check the rounded corners for the view.  - *TODO
            //*********************************************************************************
            LoginScreenAnimationButton.layer.cornerRadius  =  30
            view.addSubview(loginAnimationButtonView)
            LoginButtonView.layer.cornerRadius  =  8
            LoginChatButtonView.layer.cornerRadius  =  8
            
        }
    }
    
    
}




