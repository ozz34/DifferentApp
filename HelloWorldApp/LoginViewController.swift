//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 25.07.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //MARK: Private properties
    private let login = "Jack"
    private let password = "123321"
    
    //MARK: Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }

        if let userName = userNameTF.text {
            welcomeVC.userName = userName
        }
    }
    
    //MARK: @IBActions
    @IBAction func logInButtonPressed() {
        guard userNameTF.text != login || passwordTF.text != String(password) else { return }
        
        doAlert(title: "Invalid login or password",
                message: "Please, enter correct login and password")
        
        passwordTF.text = ""
    }
    
    @IBAction func forgotNameButtonPressed() {
        doAlert(title: "Oops!",message: "Your name is \(login)😉")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        doAlert(title: "Oops!",message: "Your Password \(password)")
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        passwordTF.text = ""
        userNameTF.text = ""
    }
    
    //MARK: Private function
    private func doAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

