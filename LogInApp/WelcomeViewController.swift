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
    let username = ""
    let password = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = welcomeMessage
    }
    
    
//    @IBAction func logOutButtonPressed() {
//        self.navigationController?.popViewController(animated: true)
//    }
    
    
}