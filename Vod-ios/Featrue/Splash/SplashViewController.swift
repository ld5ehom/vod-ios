//
//  SplashViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 8/25/24.
//

import UIKit

class SplashViewController: UIViewController {

    // App X Constraint
    @IBOutlet weak var appIconCenterXConstraint: NSLayoutConstraint!
    
    // App Y Constraint
    @IBOutlet weak var appIconCenterYConstraint: NSLayoutConstraint!
    
    // App Icon UI View
    @IBOutlet weak var appIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // After Load
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        // lottie
        lottieAnimationView.play { _ in
            present(LoginViewController(), animated: true)
        }
        */
        
        // Zoom in animation
        UIView.animate(withDuration: 0.7, animations: { [weak self] in
            // Scale transformation (increase the size)
            self?.appIcon.transform = CGAffineTransform(scaleX: 10, y: 10)
            // Optional: Fade in effect
            self?.appIcon.alpha = 0.0
        }, completion: { _ in
            // move to Login storyboard(Main)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            // move to initial view controller (Main storyboard)
            let viewController = storyboard.instantiateInitialViewController()
            
            // Switch the root view to the initial view controller of the Main storyboard
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
                window.rootViewController = viewController
            }
        })
    }

}
