//
//  LoginViewController.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/9/24.
//

import UIKit

class LoginViewController: UIViewController {

    // signIn Button Outlet
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Login Button Title
        self.signInButton.setTitle("Sign In", for: .normal)
        self.signInButton.setTitleColor(UIColor.white, for: .normal)
        
        // signIn Button Style
        self.signInButton.layer.cornerRadius = 19
        self.signInButton.layer.borderWidth = 1
        self.signInButton.layer.borderColor = UIColor(named: "wh")?.cgColor
        
    }
    
    // signInButton tap
    @IBAction func signInDidTap(_ sender: Any) {
        
        self.view.window?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabBar")
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    
}
