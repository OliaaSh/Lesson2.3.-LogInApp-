//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Olga Shkredova on 21.09.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    var welcomeMessage = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeMessage)"
    }
    
    
}
