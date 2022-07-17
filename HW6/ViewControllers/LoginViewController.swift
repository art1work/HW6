//
//  ViewController.swift
//  HW5
//
//  Created by Артём Ермохин on 03.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
//        welcomeVC.welcomeMessage = userNameTextField.text
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
                profileVC.user = user
            } else if let infoVC = $0 as? InfoViewController {
                infoVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        guard let inputUserName = userNameTextField.text, let inputPass = passwordTextField.text,
              inputUserName == user.name, inputPass == user.password else {
            showAlert(with: "Sign In Error", and: "Incorrect username or password. Please try again.")
            return
        }
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "", and: "Username is \"\(user.name)\"")
    }
    
    @IBAction func forgotPassButtonPressed(_ sender: UIButton) {
        showAlert(with: "", and: "Password is \"\(user.password)\"")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

