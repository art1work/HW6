//
//  ViewController.swift
//  HW5
//
//  Created by Артём Ермохин on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let username = "User"
    private let password = "12345"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeMessage = userNameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        guard let inputUserName = userNameTextField.text, let inputPass = passwordTextField.text,
                inputUserName == username, inputPass == password else {
            showAlert(with: "Sign In Error", and: "Incorrect username or password. Please try again.")
            return
        }
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "", and: "Username is \"User\"")
    }
    
    @IBAction func forgotPassButtonPressed(_ sender: UIButton) {
        showAlert(with: "", and: "Password is \"12345\"")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
}

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

