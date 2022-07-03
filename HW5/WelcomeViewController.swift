//
//  WelcomeViewController.swift
//  HW5
//
//  Created by Артём Ермохин on 03.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    
    var welcomeMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.cyan.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        guard let userName = welcomeMessage else { return }
        welcomeLabel.text = "Welcome, \(userName)!"
    }
}
