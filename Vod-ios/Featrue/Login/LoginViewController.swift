//
//  LoginViewController.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/9/24.
//

import UIKit

class LoginViewController: UIViewController {

    // Login Button Outlet
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginButton.layer.cornerRadius = 19
        self.loginButton.layer.borderColor = UIColor(named: "uclaBlue")?.cgColor
        self.loginButton.layer.borderWidth = 1
        
        // button width Auto Layout setting
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40), // left leading
            self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40), // right trailing
            self.loginButton.heightAnchor.constraint(equalToConstant: 50) // Height
        ])
        
    }
    
    // Login button did tap
    @IBAction func buttonDidTap(_ sender: Any) {
        
    }
    
    
}
