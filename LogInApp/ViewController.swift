//
//  ViewController.swift
//  LogInApp
//
//  Created by Olga Shkredova on 20.09.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPassButton: UIButton!
    
    let userName = "Olya"
    let password = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        forgotNameButton.layer.cornerRadius = 15
        forgotPassButton.layer.cornerRadius = 15
        //passwordText.isSecureTextEntry = true
    }

    @IBAction func logInButtonPressed() {
        guard let nameField = userNameText.text, !nameField.isEmpty, nameField == userName
        else {
            showAlert(with: "Wrong name or password", and: "Please, enter your name and password")
            passwordText.text = ""
            return}
        guard let passField = passwordText.text, !passField.isEmpty, passField == password
        else {
        showAlert(with: "Wrong name or password", and: "Please, enter your name and password")
            passwordText.text = ""
            return
                }
        performSegue(withIdentifier: "goToApp", sender: nil)
    }
 
    @IBAction func forgotNamePressed() {
        showAlert(with: "Oops!", and: "Your name is \(userName)")
    }
    
    @IBAction func forgotPassPressed() {
        showAlert(with: "Oops!", and: "Your password is \(password)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcomeMessage = "Welcome, \(userName)!"
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        guard let welcomeVC = segue.source as? WelcomeViewController else {return}
        userNameText.text = welcomeVC.username
        passwordText.text = welcomeVC.password
    }
    
}



// MARK: - Private methods

extension ViewController {
    private func showAlert (with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       
        let okAction = UIAlertAction(title: "OK", style: .default)
        present(alert, animated: true)
        alert.addAction(okAction)
    }
    
}
