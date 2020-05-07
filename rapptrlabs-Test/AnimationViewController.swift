//
//  AnimationViewController.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/27/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

let cornerRadius : CGFloat = 10.0
let ChatBubbleCornerRadius : CGFloat = 8.0

class AnimationViewController: UIViewController  {
    
    // MARK: - Declatarions
    var fadeChceck = ViewController()
    
    // MARK: - Outlets
    @IBOutlet weak var shadowContainerView: UIView!
    
    @IBOutlet weak var logoView: UIImageView!
    
    @IBOutlet var fadeTap: UITapGestureRecognizer!
    
    @IBOutlet var traceTracker: UIPanGestureRecognizer!
    
    @IBOutlet weak var fadeButton: UIButton!
    
    // MARK: - viewDidLoad
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        SetButtonTitle ()
        //set up shadow container
        
        
        // Do any additional setup after loading the view.
    }
    // MARK: - ShadowFunctions
    
    func SetButtonTitle () {
        fadeButton.setTitle("FADE IN", for: UIControl.State.normal)
    }
    
    func SetUpShadow () {
        
        shadowContainerView.layer.cornerRadius = cornerRadius
        shadowContainerView.backgroundColor = .clear
        shadowContainerView.layer.shadowColor = UIColor.black.cgColor
        shadowContainerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        shadowContainerView.layer.shadowRadius = cornerRadius
        shadowContainerView.layer.shadowOpacity = 1.0
        logoView.layer.cornerRadius = cornerRadius
        logoView.clipsToBounds = true
        
    }
    
    func RemoveShadow (){
        shadowContainerView.layer.shadowColor = UIColor.clear.cgColor
    }
    
    // MARK: - IBActions
    
    //Implement action for logo movement
    @IBAction func fadeAndDrag(_ sender: UIPanGestureRecognizer) {
        self.fadeButton.isHidden  = true
        
        if traceTracker.state == .began {
            
            SetUpShadow()
            
        } else if traceTracker.state == .changed {
            
            SetUpShadow()
            
            let navi  = traceTracker.translation(in: self.logoView)
            
            shadowContainerView.transform = CGAffineTransform(translationX: navi.x, y: navi.y)
            
        } else if traceTracker.state == .ended {
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.6,options: .curveEaseInOut, animations:{
                self.shadowContainerView.transform = .identity
                
            })
            RemoveShadow()
            self.fadeButton.isHidden  = false
        }
        
    }
    
    // this function is called from button clicked &  tap on logo (tagGesture)
    @IBAction func FadeGestureTapped(_ sender: Any) {
        
        // check faded flag  status before animation
        // Manipulate the alpha for fade
        // Animate view with options
        // Update BUtton Title
        
        if fadeChceck.isFaded == false {
            
            UIView.animate(withDuration: 1.0,delay: 0.2, options: .curveLinear,animations: {
                self.shadowContainerView.alpha = 0.3
                self.fadeChceck.isFaded = true
                self.fadeButton.setTitle("FADE OUT", for: UIControl.State.normal)
                
            })
            return
        }else{
            
            UIView.animate(withDuration: 1.5,delay: 0.5, options: .curveLinear,animations: {
                self.shadowContainerView.alpha = 1.0
                self.fadeChceck.isFaded = false
                self.fadeButton.setTitle("FADE IN", for: UIControl.State.normal)
            })
            return
        }
        
    }
    
}
