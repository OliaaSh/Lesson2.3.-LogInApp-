//
//  ViewController.swift
//  LogInApp
//
//  Created by Olga Shkredova on 20.09.22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPassButton: UIButton!
  
    // MARK: - Private properties
    private let userName = "Olya"
    private let password = "1234"
    
    //MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        forgotNameButton.layer.cornerRadius = 15
        forgotPassButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcomeMessage = userName
    }

    // MARK: - IB Action
    @IBAction func logInButtonPressed() {
        if userNameText.text != userName || passwordText.text != password {
            showAlert(
                with: "Wrong name or password",
                and: "Please, enter your name and password")
                passwordText.text = ""
        } else {
        performSegue(withIdentifier: "goToApp", sender: nil)
        }
    }
 
    @IBAction func forgotNamePressed() {
        showAlert(with: "Oops!", and: "Your name is \(userName)")
    }
    
    @IBAction func forgotPassPressed() {
        showAlert(with: "Oops!", and: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        userNameText.text = ""
        passwordText.text = ""
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

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameText {
            passwordText.becomeFirstResponder()
        } else {
            logInButtonPressed()
            //performSegue(withIdentifier: "goToApp", sender: nil)
        }
        return true
    }
    
}


